var express = require('express');
var router = express.Router();
var query = require('./query');
var jwt = require('jsonwebtoken');

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
  let token_id,status;//准备2个变量用来保存查询接口的token_id和token状态
  let $uname=req.body.params.uname;
  let $upwd=req.body.params.upwd;
  let sql="SELECT uid,uname,upwd,token_id FROM wh_user WHERE uname=? AND upwd=?";
  query(sql,[$uname,$upwd]).then(result=>{
      if(result.length>0){
        token_id=result[0].token_id;
        let $uid=result[0].uid
        //  将用户id保存session对象中
        req.session.uid=$uid;// uid当前登录：用户凭证
        //生成token信息
        let content ={name:$uname}; // 要生成token的主题信息
        let secretOrPrivateKey="suiyi" // 这是加密的key（密钥） 
        status = jwt.sign(content, secretOrPrivateKey, {
          expiresIn: 60*60*1  // 1小时过期
        });
        // 将status存入数据库
        return query("UPDATE  wh_user SET status=? WHERE uid=?",[status,$uid]);
      }
    }).then(result=>{
      if(result.affectedRows>0){
        // 返回给前端用户权限id，以及登录状态status
        console.log(status);
        res.send({code:200,msg:"login successfully",token_id,status})
      }
    }).catch(err=>{
      console.log(err);
      res.send({code:-1,msg:"login failure"})
    })
  })

//3.检测用户登录是否过期
router.post("/v1/checkUser",(req,res)=>{
  pool.query("SELECT uname,status FROM wh_user WHERE uname=? AND status=?",[req.body.uname,req.body.status],(err,result)=>{
    if(err)throw err;
    if(result.length>0){
      let status = req.body.status; // 从body中获取statsus
      let secretOrPrivateKey="suiyi"; // 这是加密的key（密钥） 
      jwt.verify(status, secretOrPrivateKey, function (err, decode) {
          if (err) {  //  时间失效的时候/ 伪造的token          
              res.send({'status':0});            
          } else {
              res.send({'status':1});
          }
      });
      }else{
        res.send({'status':0});            
      }
  });
});


module.exports = router;
