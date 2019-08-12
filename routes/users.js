var pool = require('../pool');
var express = require('express');
var router = express.Router();


/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

//1.添加用户注册路由
router.post('/v1/register',(req,res)=>{
  //执行sql语句
  var sql='insert into wh_user set ?';
  pool.query(sql,[req.body],(err,result)=>{
    if(err)throw err;
    if(result.affectedRows>0){
      res.send({code:210,msg:'registered successfully!'})
    }else{
      res.send({code:211,msg:'fail to register!'})
    }
  })
});

//2.添加用户登录路由
router.get('/v1/login/:uname&:upwd',(req,res)=>{
  var sql='select uname,upwd from wh_user where uname=? and upwd=?';
  pool.query(sql,[req.uname,req.upwd],(err,result)=>{
    if(err)throw err;
    if(result.length>0){
      res.send({code:200,msg:'login successfully'})
    }else{
      res.send({code:201,msg:'login failure '})
    }
  })
});
module.exports = router;
