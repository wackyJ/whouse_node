const express = require("express");
const pool = require("../pool");
const router = express.Router();

router.post("/v1/createOrder",(req,res)=>{
  console.log(req.body);
  var $sizeForm = req.body.params.zxc;
  console.log($sizeForm);
  res.send("这是后台数据")
})

module.exports = router;