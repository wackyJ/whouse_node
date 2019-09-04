const express = require("express");
const query=require("./query");
const router = express.Router();

//1.设置模块中查询所有用户信息
router.get('/v1/userList',(req,res)=>{
  //判断用户是否已经登录
  let uid = req.session.uid;
  if(!uid){
    res.send({code:-1,mgs:"请先登录"})
    return;
  }
  var output={
    count:0,
    pageSize:5,
    pageCount:0,
    pno:req.query.pno||0,
    data:[]
  };
  var sql="SELECT uid,uname,email,uphone,gender,token_id FROM wh_user";
  query(sql,[])
  .then(result=>{
    output.count=result.length;
    output.pageCount=Math.ceil(output.count/output.pageSize);
    sql+=` LIMIT ?,?`;
    return query(sql,[output.pageSize*output.pno,output.pageSize]);
  })
  .then(result=>{
    output.data=result;
    // console.log(output.data);
    res.send(output);
  })
});
//2.删除某用户
router.get("/v1/deluser",(req,res)=>{
  //判断用户是否已经登录
  let uid = req.session.uid;
  if(!uid){
    res.send({code:-1,msg:"请先登录"})
    return;
  } 
  var $uid = req.query.uid;
  var sql = "delete from wh_user where uid = ?";
  query(sql,[$uid]).then(result=>{
    if(result.affectedRows>0){
      res.send({code:200,msg:"delete success"});
    }else{
      res.send({code:201,msg:"delete fail"});
    }
  })
})

module.exports = router;