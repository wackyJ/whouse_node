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
  // 创建变量保存库存不足商品的名字
  let pnames=[];
  // 警报数量
  let alarmCount=50;
  let sql="SELECT pname,pid FROM wh_product WHERE repertory_count<?";
  pool.query(sql,[alarmCount],(err,result)=>{
    pnames=result;
    if(pnames.length>0){
      // 将所有符合条件的商品保存进pnames数组内
      pnames=pnames.map(obj=>`${obj.pname} 库存不足${alarmCount}--商品ID：${obj.pid}`);
    }
    console.log(pnames);
  })
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