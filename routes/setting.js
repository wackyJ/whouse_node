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
    pageSize:2,
    pageCount:0,
    pno:req.query.pno||0,
    data:[]
  };
  var sql="SELECT * FROM wh_user";
  query(sql,[])
  .then(result=>{
    output.count=result.length;
    output.pageCount=Math.ceil(output.count/output.pageSize);
    sql+=` LIMIT ?,?`;
    return query(sql,[output.pageSize*output.pno,output.pageSize]);
  })
  .then(result=>{
    output.data=result;
    res.send(output);
  })
});

module.exports = router;