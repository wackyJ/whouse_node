const query=require("./query");
const express = require("express");
const router= express.Router();

// 商品页面接口
router.get("/",(req,res)=>{
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
    let sql=`select *,(select md from wh_product_pic where product_id=pid limit 1) as md from wh_product where ${where}`;
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
router.get("/v1/shelp",(req,res)=>{
  let kw=req.query.kw;
  let kws=kw.split(" ");
  kws.forEach((elem,i,arr)=>{
    arr[i]=`pname like '%${elem}%'`;
  })
  let where=kws.join(" and ");
  let sql=`select pid,pname from wh_product where ${where} limit 10`;
  query(sql,[]).then(result=>{
    res.send(result);
  })
})


// 库存页面接口
router.get("/v1/repertory",(req,res)=>{
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

router.post("/v1/updata",(req,res)=>{
  let $propName = req.body.params.propName;
  let $value = req.body.params.value;
  let $pid=req.body.params.pid;
  console.log($propName);
  console.log($value);
  console.log($pid);
  /*let sql="UPDATE wh_product SET ? = ?  WHERE ?;";
  query(sql,[$propName,$value,$pid]).then(result=>{
    // if(result.affectedRows>0){
      console.log(123456);
			res.send({code:200,msg:"updata success"});*/
		// }else{
		// 	res.send({code:201,msg:"updata faile"});
		// }
  // })
 })

router.delete("/v1/deldata",(req,res)=>{
  let $pid=req.query.pid;
  let sql=`DELETE FROM wh_product WHERE pid = ?;`;
  query(sql,[$pid]).then(result=>{
    if(result.affectedRows>0){
			res.send({code:200,msg:"delete success"});
		}else{
			res.send({code:201,msg:"delect faile"});
		}
  })
})

module.exports=router;