const express = require("express");
const pool=require("../pool");
const router = express.Router();

// 系统提示功能接口
// 1.系统提示表的插入操作
router.get('/v1/tipList',(req,res)=>{
  // //判断用户是否已经登录
  let uid = req.session.uid;
  if(!uid){
    res.send({code:-1,mgs:"请先登录"});
    return;
  }
  sql = "select * from wh_tips t order by t.create_time desc limit 0,4";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      // console.log(result);
      res.send({code:200,msg:'query success',data:result});
    }else{
      res.send({code:201,msg:'query fail'});
    }
  })
})

module.exports = router;