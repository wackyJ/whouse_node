var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

//1.添加用户注册路由
router.post('/v1/register',(req,res)=>{
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

//2.添加用户登录路由
router.post("/v1/login",(req, res)=>{
      pool.query("select uname,upwd,token_id from wh_user where uname=? and upwd=?",[req.body.uname,req.body.upwd],(err,result)=>{
        if(err)throw err;
        if(result.length>0){
          let content ={name:req.body.name}; // 要生成token的主题信息
          let secretOrPrivateKey="suiyi" // 这是加密的key（密钥） 
          let status = jwt.sign(content, secretOrPrivateKey, {
                  expiresIn: 60*60*1  // 1小时过期
          });
          // 将status存入数据库
          pool.query("insert into wh_user set token=?",status,(err,result)=>{
            if(err)throw err;
            if(result.affectedRows>0){
              // 返回给前端用户权限id，以及登录状态status
              res.send({code:200,msg:"login successfully",token_id:result.token_id,status:status})
            }
          })
        }
      })
  })

//3.检测用户登录是否过期
router.post("/v1/checkUser",(req,res)=>{
  pool.query("select uname,status from wh_user where uname=? and status=?",[req.body.uname,req.body.status],(err,result)=>{
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
