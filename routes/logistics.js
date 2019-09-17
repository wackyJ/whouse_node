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
    axios.post("http://api.kdniao.com/Ebusiness/EbusinessOrderHandle.aspx",{
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
//物流追踪(订阅接口)，无次数限制，并发不超过30次/s
router.post("/v1/logisticsTracking",(req,res)=>{
    let ShipperCode=req.query.ShipperCode;
    let LogisticCode=req.query.LogisticCode;
    var paramData ={
        "ShipperCode":ShipperCode,     //快递公司编码（必填）
        "OrderCode":"",//订单编号
        "LogisticCode":LogisticCode,   //快递单号（必填）
        "PayType":"1",//运费支付方式
        "ExpType":"1",//详细快递类型
        "CustomerName":"",//ShipperCode 为 JD，必填，对应京东的青龙配送编码，也叫商家编码，格式：数字＋字母＋数字，9 位数字加一个字母，共 10 位，举例：001K123450；ShipperCode 为 SF，且快递单号非快递鸟渠道返回时，必填，对应收件人/寄件人手机号后四位；ShipperCode 为 SF，且快递单号为快递鸟渠道返回时，不填；ShipperCode 为其他快递时，不填
        "CustomerPwd":"",
        "MonthCode":"",//月结编号
        "IsNotice":"0",//是否通知快递员上门揽件0-通知，1-不通知，不填则默认为 1
        "Sender":{
            "Name":"1255760",          //发件人（必填）
            "Tel":"",                  //电话或手机，必填一个
            "Mobile":"13700000000",    //电话或手机，必填一个
            "ProvinceName":"广东省",   //发件省（必填）
            "CityName":"深圳市",       //发件市（必填）
            "ExpAreaName":"福田区",    //发件区/县 （必填）
            "Address":"测试地址"        //发件人详细地址（必填）
        },
        "Receiver":{
            "Name":"1255760",          //收件人（必填）
            "Tel":"",                  //电话或手机，必填一个
            "Mobile":"13800000000",    //电话或手机，必填一个
            "ProvinceName":"广东省",   //收件省（必填）
            "CityName":"深圳市",       //收件市（必填）
            "ExpAreaName":"龙华新区",  //收件区/县（必填）
            "Address":"测试地址 2"    //收件人详细地址（必填）
        },
        "Commodity":[
            {
            "GoodsName":""//商品名称
            }
        ]
    };
    var b = Buffer.from(md5(JSON.stringify(paramData)+"0ae25830-610b-4457-ab3d-e065586a4081"),'utf-8');
    // console.log(b);
    axios.post("http://api.kdniao.com/Ebusiness/EbusinessOrderHandle.aspx",{
    params:{
            RequestData:urlencode(JSON.stringify(paramData)),
            EBusinessID: 1579500,
            RequestType: 1002,
            DataSign: urlencode(b.toString('base64')),
    }}).then(result=>{
    // console.log(result.data);
    res.send({code:200,msg:"success",data:result.data})
    }).catch(err=>{
    // console.log(err);
    res.send({code:201,msg:"err"})
    })
    // console.log("end");
})

//物流追踪(轨迹接收) 每次全量推送，一次最多推送 10 单
router.post("/v1/pathPush",(req,res)=>{
    //需按快递鸟要求开发接口，保证信息的正常接收。必须在 5S 内对快递鸟请求做出响应(数据存储后马上返回响应结果，然后再处理数据)，响应结果按接口格式要求返回。
    var paramData=req.body;
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