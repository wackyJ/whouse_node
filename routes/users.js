var express = require('express');
var router = express.Router();
var query = require('./query');
var  jwt= require('jsonwebtoken')

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

//1.添加用户注册路由
router.post('/v1/register',(req,res)=>{
  // 获取前端传递的数据
  var info=req.body.params;
  // console.log(info);
  var $uname = info.uname;
  var $upwd = info.upwd;
  var $uphone = info.uphone;
  //执行sql语句
  var sql='INSERT INTO wh_user(uname,upwd,uphone) values(?,md5(?),?)';
  query(sql,[$uname,$upwd,$uphone]).then(result=>{
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
  let sql="SELECT uid,uname,upwd,token_id,status FROM wh_user WHERE uname = ? AND upwd = md5(?)";
  query(sql,[$uname,$upwd]).then(result=>{
      if(result.length>0){
        let token_id=result[0].token_id;
        let uid=result[0].uid;
        let uname=result[0].uname;
        //  将用户id保存session对象中
        req.session.uid=uid;// uid当前登录：用户凭证
        //  将用户token_id保存session对象中
        req.session.token_id=token_id;////当前用户权限凭证
        // 生成token信息
        let content ={uid}; // token的主题信息
        let secretOrPrivateKey="whouseUser" // 这是加密的key（密钥） 
        let $status = jwt.sign(content, secretOrPrivateKey, {
          expiresIn: 60*60*1  // 1小时过期
        });
        // 将$status存入数据库
        query("UPDATE  wh_user SET status=? WHERE uid=?",[$status,uid]).then(result=>{
          res.send({code:200,msg:"login successfully",data:{uid,uname,status:$status}})
        });
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
    let sql="SELECT uid,uname,upwd,email,uphone,gender,real_name,status,token_id FROM wh_user where uid=?";
    query(sql,[uid]).then(result=>{
      // console.log(result)
        res.send({code:200,msg:"success",data:result[0]});
    })
  })

  //4.清除用户登录信息
  router.post("/v1/clearUser",(req,res)=>{
    delete req.session.uid;
    delete req.session.token_id;
    res.send({code:-3,msg:"logout success!"})
  })

//5.检测用户登录(token)是否过期
/*router.post("/v1/checkUser",(req,res)=>{
  query("SELECT uname,status FROM wh_user WHERE uname=? AND status=?",[req.body.params.uname,req.body.params.status]).then(result=>{
    if(result.length>0){
      let status = req.body.params.status; // 从body中获取statsus
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
});*/

// 6.修改用户信息
router.post("/v1/upUsers",(req,res)=>{
  //判断用户是否已经登录
  let uid = req.session.uid;
  if(!uid){
    res.send({code:-1,msg:"请先登录"});
    return;
  }
  var $uid = req.body.params.uid;
  var $obj = req.body.params.obj;
  console.log($obj);
  var sql = "update wh_user set ? where uid = ?";
  query(sql,[$obj,$uid]).then(result=>{
    if(result.affectedRows>0){
      res.send({code:200,msg:"update success"});
    }else{
      res.send({code:201,msg:"update fail"});
    }
  })
})

module.exports = router;
