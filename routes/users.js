var express = require('express');
var router = express.Router();
var query = require('./query');

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

//1.添加用户注册路由
router.post('/v1/register',(req,res)=>{
  // 获取前端传递的数据
  var info=req.body;
  //执行sql语句
  var sql='INSERT INTO wh_user SET ?';
  pool.query(sql,[info],(err,result)=>{
    if(err)throw err;
    if(result.affectedRows>0){
      res.send({code:200,msg:'registered successfully!'})
    }else{
      res.send({code:201,msg:'fail to register!'})
    }
  })
});

//2.添加用户登录路由
router.post("/v1/login",(req, res)=>{
  let $uname=req.body.params.uname;
  let $upwd=req.body.params.upwd;
  let sql="SELECT uid,uname,upwd,token_id FROM wh_user WHERE uname=? AND upwd=?";
  query(sql,[$uname,$upwd]).then(result=>{
      if(result.length>0){
        //  将用户id保存session对象中
        let $uid=result[0].uid;
        req.session.uid=$uid;// uid当前登录：用户凭证
        res.send({code:200,msg:"login successfully"})
      }else{
        res.send({code:201,msg:"login failure"})
      }
    })
  })

module.exports = router;
