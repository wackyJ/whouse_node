const express = require("express");
const pool=require("../pool");
const query = require("./query");
const router = express.Router();

// 1.插入一条日志
router.post("/v1/addLog",(req,res)=>{
  let inMsg = req.body.params;
  var sql = "insert into wh_log values('',?,now())";
  query(sql,[inMsg]).then(result=>{
    if(result.affectedRows>0){
      res.send({code:200,msg:"add success"});
    }else{
      res.send({code:201,msg:"add fail"});
    }
  }).catch(err=>{
    console.log(err);
  })
})
// 2.查询日志
router.get("/v1/logList",(req,res)=>{
  var sql = "select * from wh_log t order by t.log_time desc limit 0,6";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:200,msg:'query success',data:result});
    }else{
      res.send({code:201,msg:'query fail'});
    }
  })
})

module.exports = router;