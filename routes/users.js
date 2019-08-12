var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

//添加用户登录路由
router.post('/v1/registeruser',(req,res)=>{
  // 获取前端传递的数据
  var info=req.body;
  //执行sql语句
  var sql='insert into wh_user set ?';
  pool.query(sql,[info],(err,result)=>{
    if(err)throw err;
    if(result.affectedRows>0){
      res.send({code:200,msg:'registered successfully!'})
    }else{
      res.send({code:201,msg:'fail to register!'})
    }
  })
});

module.exports = router;
