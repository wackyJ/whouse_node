const express = require("express");
const query = require("./query");
const router = express.Router();

router.post("/v1/OrderSubmission",(req,res)=>{
  //判断用户是否已经登录
  let uid = req.session.uid;
  if(!uid){
    res.send({code:-1,msg:"请先登录"})
    return;
  }
  // res.send({code:200,msg:"success"});
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

router.get("/v1/OrderSearch",(req,res)=>{
  //判断用户是否已经登录
  let uid = req.session.uid;
  if(!uid){
    res.send({code:-1,mgs:"请先登录"})
    return;
  }

})



module.exports = router;