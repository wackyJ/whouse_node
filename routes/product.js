const query=require("./query");
const express = require("express");
const router= express.Router();

// *******商品页面接口**********
// 所有商品查询
router.get("/v1/allProduct",(req,res)=>{
  //判断用户是否已经登录
  let uid = req.session.uid;
  if(!uid){
    res.send({code:-1,mgs:"请先登录"})
    return;
  }
  //如果已经登录则正常继续操作
  let output={
    count:0,
    pageSize:30,
    pageCount:0,
    pno:req.query.pno||0,
    data:[]
  };
  let sql="SELECT * FROM wh_product";
  query(sql,[])
  .then(result=>{
    output.count=result.length;
    output.pageCount=Math.ceil(output.count/output.pageSize);
    sql+=` LIMIT ?,?`;
    return query(sql,[output.pageSize*output.pno,output.pageSize]);
  })
  .then(result=>{
    output.data=result;
    res.send(output);
  })
});
// 商品数据修改
router.post("/v1/updata",(req,res)=>{
  //判断用户是否已经登录
  let uid = req.session.uid;
  if(!uid){
    res.send({code:-1,mgs:"请先登录"})
    return;
  }
  let $propName = req.body.params.propName;
  let $value = req.body.params.value;
  let $pid=req.body.params.pid;
  let sql="UPDATE wh_product SET ??=? WHERE pid=?;";
  query(sql,[$propName,$value,$pid]).then(result=>{
    if(result.affectedRows>0){
			res.send({code:200,msg:"updata success"});
		}else{
			res.send({code:201,msg:"updata faile"});
		}
   })
 })
// 单个商品删除
router.delete("/v1/deldata",(req,res)=>{
  //判断用户是否已经登录
  let uid = req.session.uid;
  if(!uid){
    res.send({code:-1,msg:"请先登录"})
    return;
  }
  let $pid=req.query.pid;
  let sql="DELETE FROM wh_product WHERE pid = ?;";
  query(sql,[$pid]).then(result=>{
    if(result.affectedRows>0){
			res.send({code:200,msg:"delete success"});
		}else{
			res.send({code:201,msg:"delect faile"});
		}
  })
})
//商品查询
router.get("/v1/search",(req,res)=>{
  //判断用户是否已经登录
  let uid = req.session.uid;
  if(!uid){
    res.send({code:-1,mgs:"请先登录"})
    return;
  }
  let output={
    count:0,
    pageSize:9,
    pageCount:0,
    pno:req.query.pno||0,
    data:[]
  };
  let kw=req.query.kw;
  if(kw){
    //"mac i5 128g"
    let kws=kw.split(" ");
    //[mac,i5,128g]
    kws.forEach((elem,i,arr)=>{
      arr[i]=`pname like '%${elem}%'`;
    })
    /*[
      pname like '%mac%',
      pname like '%i5%',
      pname like '%128g%'
    ]*/
    //join(" and ");
    let where=kws.join(" and ");
    //"pname like '%mac%' and pname like '%i5%' and pname like '%128g%'"
    // let sql=`select *,(select md from wh_product_pic where product_id=pid limit 1) as md from wh_product where ${where}`;
    let sql=`select * from wh_product where pname like '%${kw}%' `;
    query(sql,[])
    .then(result=>{
      output.count=result.length;
      output.pageCount=
        Math.ceil(output.count/output.pageSize);
      sql+=` limit ?,?`;
      return query(sql,[output.pageSize*output.pno,output.pageSize]);
    })
    .then(result=>{
      output.data=result;
      res.send(output);
    })
  }else{
    res.send(output);
  }
})


// *********库存页面接口*************
// 商品库存查询
router.get("/v1/repertory",(req,res)=>{
  //判断用户是否已经登录
  let uid = req.session.uid;
  if(!uid){
    res.send({code:-1,mgs:"请先登录"})
    return;
  }
  // console.log(uid);
  let output={
    count:0,
    pageSize:10,
    pageCount:0,
    pno:req.query.pno||0,
    data:[]
  };
  let sql="SELECT * FROM wh_product";
  query(sql,[])
  .then(result=>{
    output.count=result.length;
    output.pageCount=Math.ceil(output.count/output.pageSize);
    sql+=` LIMIT ?,?`;
    return query(sql,[output.pageSize*output.pno,output.pageSize]);
  })
  .then(result=>{
    output.data=result;
    res.send(output);
  })
});
//商品采购单
router.post("/v1/purchase",(req,res)=>{
  let purchaseForm=req.body.params.purchaseForm;
  let productDetail=req.body.params.productDetail;
  productDetail=productDetail.map(obj=>{
    obj.pur_num=parseInt(purchaseForm.pur_num);
    obj.uid=parseInt(purchaseForm.uid);
    obj.pur_date=purchaseForm.pur_date;
    return obj;
  })
  let insertId;
  // console.log(purchaseForm,productDetail);
  let sql="INSERT INTO wh_purchase SET ?";
  query(sql,[purchaseForm])
  .then(result=>{
    insertId=result.insertId;
    for(let i=0;i<productDetail.length;i++){
      let sql="INSERT INTO wh_purchase_detail SET ?";
      query(sql,[productDetail[i]]).then(result=>{
        let obj=productDetail[i];
        // 如果成功录入数据库则同步更新到系统提示信息中
        let msg=`商品ID：${obj.pid}的库存增加了${obj.pur_count}件`;
        query(`INSERT INTO wh_tips VALUES('','${msg}',0,now())`);
      })
    }
    res.send({code:200,msg:"success",data:insertId});
  })
})


module.exports=router;