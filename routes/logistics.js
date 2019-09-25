const express = require("express");
const router = express.Router();
var urlencode = require('urlencode');
var md5=require("md5")
var axios = require("axios");

//物流即时查询，每个月最多查询3000次，其中相同单号每天最多查询5次（快递鸟账户API限制）
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
    console.log(result.data);
    res.send({code:200,msg:"success",data:result.data})
    }).catch(err=>{
    console.log(err);
    res.send({code:201,msg:"err"})
    })
    // console.log("end");
})
//基于快递鸟物流追踪(订阅接口)API，无次数限制，并发不超过30次/s
router.post("/v1/logisticsTracking",(req,res)=>{
    let paramData=req.body.params;
    console.log(paramData);
    var b = Buffer.from(md5(JSON.stringify(paramData)+"0ae25830-610b-4457-ab3d-e065586a4081"),'utf-8');
    axios.get("http://api.kdniao.com/Ebusiness/EbusinessOrderHandle.aspx",{
    params:{
        RequestData:urlencode(JSON.stringify(paramData)),
        EBusinessID: 1579500,
        RequestType: 1008,
        DataSign: urlencode(b.toString('base64')),
    }}).then(result=>{
    console.log(result.data);
    res.send({code:200,msg:"success",data:result.data})
    }).catch(err=>{
    // console.log(err);
    res.send({code:201,msg:err})
    })
})
//物流追踪(轨迹接收) 每次全量推送，一次最多推送 10 单
router.post("/v1/pathPush",(req,res)=>{
    //需按快递鸟要求开发接口，保证信息的正常接收。必须在 5S 内对快递鸟请求做出响应(数据存储后马上返回响应结果，然后再处理数据)，响应结果按接口格式要求返回。
    var paramData=req.body;
    console.log(req.body);
    res.send({
        params:{
            "EBusinessID": "1579500",
            "UpdateTime": `${1}`,
            "Success": true,
            "Reason": ""
        }
    })
    //处理数据
})

module.exports = router;