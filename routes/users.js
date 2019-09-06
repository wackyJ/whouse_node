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
        let uid=result[0].uid;
        let uname=result[0].uname;
        req.session.uid=uid;// uid当前登录：用户凭证
        res.send({code:200,msg:"login successfully",data:{uid,uname}})
      }else{
        res.send({code:201,msg:"login failure"})
      }
    })
  })

  // 3.用户个人信息获取路由
  router.get("/v1/userInfo",(req,res)=>{
    let uid = req.session.uid;
    if(!uid){
      res.send({code:-1,mgs:"请先登录"})
      return;
    }
    let sql="SELECT uid,uname FROM wh_user where uid=?";
    query(sql,[uid]).then(result=>{
      res.send({code:200,msg:"success",data:result[0]})
    })
  })

module.exports = router;
