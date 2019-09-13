const express = require("express");
const query = require("./query");
const router = express.Router();
//所有订单信息（包含订单详情查询）
router.get("/v1/allOrders",(req,res)=>{
  let sql="select * from wh_order,wh_order_detail where wh_order.onum=wh_order_detail.onum;";
  query(sql,[]).then(result=>{
    if(result.length>0){
      // console.log(result);
      res.send({code:200,msg:"success",data:result});
    }
  })
})
//订单提交
router.post("/v1/OrderSubmission",(req,res)=>{
  //判断用户是否已经登录
  let uid = req.session.uid;
  if(!uid){
    res.send({code:-1,msg:"请先登录"})
    return;
  }
  let $orderForm = req.body.params.orderForm;
  let $orderDetail = req.body.params.orderDetail;
  $orderForm.firstAdress=$orderForm.firstAdress.join("/");
  let sql="INSERT INTO wh_order SET ?";
  query(sql,[$orderForm]).then(result=>{
    // console.log("订单插入成功！");
    $orderDetail=$orderDetail.map(obj=>{
      obj.onum=result.insertId;
      obj.create_date=$orderForm.create_date;
      obj.delivery_date=$orderForm.delivery_date;
      delete obj.total;
      return obj;
    });
    /*****************循环将提交的商品插入订单详情表**********/
    for(let i=0;i<$orderDetail.length;i++){
      let sql="INSERT INTO wh_order_detail SET ?";
      query(sql,[$orderDetail[i]])
      .then(result=>{
        // console.log("订单详情插入成功！");
        //订单表中商品添加成功，则库存中对应商品数量减少
        let sql="UPDATE wh_product SET repertory_count=repertory_count-? , sold_count=sold_count+? WHERE pid=?  ";
        query(sql,[$orderDetail[i].pcount,$orderDetail[i].pcount,$orderDetail[i].pid]).then(()=>{
          // console.log(`${i+1}行商品减少成功！`);
        })
      }).catch(err=>{
        // console.log(`第${i+1}行商品添加失败，后续商品未能添加`);
        //如果添加失败则返回具体第几行商品出错
        res.send({code:201,msg:`第${i+1}行商品添加失败，后续商品未能添加`})
      })
    }
    //******************库存数量报警功能**************************/ 
    // 创建变量保存库存不足商品的名字
    let pnames=[];
    // 警报数量
    let alarmCount=50;
    let sql="SELECT pname,pid FROM wh_product WHERE repertory_count<?";
    query(sql,[alarmCount]).then(result=>{
      pnames=result;
      if(pnames.length>0){
        // 将所有符合条件的商品保存进pnames数组内
        pnames=pnames.map(obj=>`${obj.pname} 库存不足${alarmCount}--商品ID：${obj.pid}`);
        pnames.reduce((accumulator, currentValue)=>query(`INSERT INTO wh_tips VALUES('','${currentValue}',1,now())`),0)
      }
      // console.log(pnames);
    })
    /**************最终结果返回*****************/
    res.send({code:200,msg:"success",data:result.insertId});
  })
});
//订单商品单价显示
router.get("/v1/unitPrice",(req,res)=>{
  let $pid=req.query.pid;
  let sql="SELECT sell_price FROM wh_product WHERE pid=?";
  query(sql,[$pid]).then(result=>{
    if(result.length>0){
      res.send({code:200,msg:"Unit price indicates success",data:result});
    }else{
      res.send({code:201,msg:"The target product does not exist"})
    }
  })
})
//订单查询
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
  let sql="SELECT * FROM wh_order_detail INNER JOIN wh_order ON wh_order_detail.onum=wh_order.onum WhERE wh_order.onum=? ";
  query(sql,[kw])
  .then(result=>{
    output.count=result.length;
    output.pageCount=Math.ceil(output.count/output.pageSize);
    sql+=` limit ?,?`;
    // console.log(output.pageSize);
    return query(sql,[kw,output.pageSize*output.pno,output.pageSize]);
  })
  .then(result=>{
    // console.log(2);
    // console.log(result);
    output.data=result;
    res.send(output);
  }).catch(err=>{
    // console.log(3);
    // console.log(err);
  })
})
//订单状态查询
router.get("/v1/statusCode",(req,res)=>{
  let sql="SELECT ostatus FROM wh_order";
  query(sql).then(result=>{
    res.send({code:200,msg:"success",data:result});
  })
})

module.exports = router;