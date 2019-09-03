const express = require("express");
const query = require("./query");
const router = express.Router();

router.post("/v1/OrderSubmission",(req,res)=>{
  //判断用户是否已经登录
  let uid = req.session.uid;
  if(!uid){
    res.send({code:-1,mgs:"请先登录"})
    return;
  }
  res.send("success");
  /*var $orderForm = req.body.params.orderForm;
  // var $orderProduct = $orderForm.orderProduct;
  // delete $orderForm.orderProduct;
  $orderForm.create_date=new Date($orderForm.create_date).getTime();
  $orderForm.delivery_date=new Date($orderForm.delivery_date).getTime();
  console.log($orderForm);
  // console.log($orderProduct);
  // var sql="INSERT INTO wh_order Value (?,?)";
  var sql="INSERT INTO wh_order SET (?,?)";

  if($orderProduct.length<=1){
    query(sql,[ $orderForm,orderProduct[0] ]).then(result=>{
       res.send({code:200,msg:"success",data:{result}})
    })
  }else{
    for(var i=0;i<$orderProduct.length;i++){

    }
  }*/
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