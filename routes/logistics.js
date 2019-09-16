const express = require("express");
const router = express.Router();
var urlencode = require('urlencode');
var md5=require("md5")
var axios = require("axios");

router.get("/v1/immediateQuery",(req,res)=>{
    let ShipperCode=req.query.ShipperCode;
    let LogisticCode=req.query.LogisticCode;
    var paramData ={ShipperCode,LogisticCode}
    var b = Buffer.from(md5(JSON.stringify(paramData)+"0ae25830-610b-4457-ab3d-e065586a4081"),'utf-8');
    // console.log(b);
    axios.get("http://api.kdniao.com/Ebusiness/EbusinessOrderHandle.aspx",{
    params:{
        RequestData:urlencode(JSON.stringify(paramData)),
        EBusinessID: 1579500,
        RequestType: 1002,
        DataSign: urlencode(b.toString('base64'))
    }}).then(result=>{
    // console.log(result.data);
    res.send({code:200,msg:"success",data:result.data})
    }).catch(err=>{
    // console.log(err);
    res.send({code:201,msg:"err"})
    })
    // console.log("end");
})

module.exports = router;