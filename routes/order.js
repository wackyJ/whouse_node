const express = require("express");
const query = require("./query");
const router = express.Router();
//所有订单信息（包含订单详情查询）
router.get("/v1/allOrders",(req,res)=>{
  query()
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
//订单查询
router.get("/v1/OrderSearch",(req,res)=>{
  //判断用户是否已经登录
  let uid = req.session.uid;
  if(!uid){
    res.send({code:-1,mgs:"请先登录"})
    return;
  }
})
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


module.exports = router;