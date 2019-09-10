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
  req.session.cookie.maxAge=req.session.cookie.originalMaxAge;
  let $orderForm = req.body.params.orderForm;
  let $orderDetail = req.body.params.orderDetail;
  $orderDetail=$orderDetail.map(obj=>{
    obj.onum=$orderForm.onum;
    obj.create_date=$orderForm.create_date;
    obj.delivery_date=$orderForm.delivery_date;
    return obj;
  });
  console.log($orderDetail);
  $orderForm.firstAdress=$orderForm.firstAdress.join("/");
  console.log($orderForm);
  let sql="INSERT INTO wh_order SET ?";
  query(sql,[$orderForm]).then(result=>{
    for(let i=0;i<$orderDetail.length;i++){
      let sql="INSERT INTO wh_order_detail SET ?";
      query(sql,[$orderDetail[i]]).then(result=>{})
      console.log($orderDetail[i]);
    }
   /*$orderDetail.map((obj,index,arr)=>{
      let sql="INSERT INTO wh_order_detail SET ?";
      query(sql,[obj]).then(result=>{});
      console.log(index);
    });*/
    res.send({code:200,msg:"success"});
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
    console.log(output.pageSize);
    return query(sql,[kw,output.pageSize*output.pno,output.pageSize]);
  })
  .then(result=>{
    console.log(2);
    console.log(result);
    output.data=result;
    res.send(output);
  }).catch(err=>{
    console.log(3);
    console.log(err);
  })
})


module.exports = router;