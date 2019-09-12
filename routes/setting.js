const express = require("express");
const query=require("./query");
const router = express.Router();


/******   1.用户管理   ******/
//1.1 设置页面的用户模块中查询所有用户信息
router.get('/v1/userList',(req,res)=>{
  //判断用户是否已经登录
  let uid = req.session.uid;
  if(!uid){
    res.send({code:-1,mgs:"请先登录"});
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
//1.2 删除某用户
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
// 1.3 修改用户信息
router.post("/v1/upuser",(req,res)=>{
  //判断用户是否已经登录
  let uid = req.session.uid;
  if(!uid){
    res.send({code:-1,mgs:"请先登录"});
    return;
  }
  var obj = req.body.params.newSel;
  var $uid = obj.uid;
  delete obj.uid;
  var sql = "update wh_user set ? where uid = ?";
  query(sql,[obj,$uid]).then(result=>{
    if(result.affectedRows>0){
      res.send({code:200,msg:"update success"});
    }else{
      res.send({code:201,msg:"update fail"});
    }
  })
})
// 1.4 添加用户   -----待后期完善


/******   2.供应商管理   ******/
//2.1 设置页面的供应商模块中查询所有供应商信息
router.get('/v1/proList',(req,res)=>{
  //判断用户是否已经登录
  let uid = req.session.uid;
  if(!uid){
    res.send({code:-1,mgs:"请先登录"});
    return;
  }
  var output={
    count:0,
    pageSize:5,
    pageCount:0,
    pno:req.query.pno||0,
    data:[]
  };
  var sql="SELECT * FROM wh_provider";
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
//2.2 删除某供应商信息
router.get("/v1/delProvider",(req,res)=>{
  //判断用户是否已经登录
  let uid = req.session.uid;
  if(!uid){
    res.send({code:-1,msg:"请先登录"});
    return;
  } 
  var $pv_id = req.query.pv_id;
  var sql = "delete from wh_provider where pv_id = ?";
  query(sql,[$pv_id]).then(result=>{
    if(result.affectedRows>0){
      res.send({code:200,msg:"delete success"});
    }else{
      res.send({code:201,msg:"delete fail"});
    }
  })
})
// 2.3 修改供应商信息
router.post("/v1/upProvider",(req,res)=>{
  //判断用户是否已经登录
  let uid = req.session.uid;
  if(!uid){
    res.send({code:-1,mgs:"请先登录"});
    return;
  }
  var obj = req.body.params.newSel;
  var $pv_id = obj.pv_id;
  delete obj.pv_id;
  if($pv_id!=null){
    var sql = "update wh_provider set ? where pv_id = ?";
    query(sql,[obj,$pv_id]).then(result=>{
      if(result.affectedRows>0){
        res.send({code:200,msg:"update success"});
      }else{
        res.send({code:201,msg:"update fail"});
      }
    })
  }else{
    var sql = "insert into wh_provider set ?";
    query(sql,[obj]).then((result)=>{
      if(result.affectedRows>0){
        console.log(result);
        res.send({code:202,msg:'add success',newId:result.insertId});
      }else{
        res.send({code:203,msg:"add fail"});
      }
    });
  }
})

/******   3.客户管理   ******/
//3.1 设置页面的客户模块中查询所有客户信息
router.get('/v1/clientList',(req,res)=>{
  //判断用户是否已经登录
  let uid = req.session.uid;
  if(!uid){
    res.send({code:-1,mgs:"请先登录"});
    return;
  }
  var output={
    count:0,
    pageSize:5,
    pageCount:0,
    pno:req.query.pno||0,
    data:[]
  };
  var sql="SELECT * FROM wh_client";
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
//3.2 删除某客户信息
router.get("/v1/delClient",(req,res)=>{
  //判断用户是否已经登录
  let uid = req.session.uid;
  if(!uid){
    res.send({code:-1,msg:"请先登录"})
    return;
  } 
  var $cid = req.query.cid;
  var sql = "delete from wh_client where cid = ?";
  query(sql,[$cid]).then(result=>{
    if(result.affectedRows>0){
      res.send({code:200,msg:"delete success"});
    }else{
      res.send({code:201,msg:"delete fail"});
    }
  })
})
// 3.3 修改客户信息
router.post("/v1/upClient",(req,res)=>{
  //判断用户是否已经登录
  let uid = req.session.uid;
  if(!uid){
    res.send({code:-1,mgs:"请先登录"});
    return;
  }
  var obj = req.body.params.newSel;
  var $cid = obj.cid;
  delete obj.cid;
  if($cid!=null){
    var sql = "update wh_client set ? where cid = ?";
    query(sql,[obj,$cid]).then(result=>{
      if(result.affectedRows>0){
        res.send({code:200,msg:"update success"});
      }else{
        res.send({code:201,msg:"update fail"});
      }
    })
  }else{
    var sql = "insert into wh_client set ?";
    query(sql,[obj]).then((result)=>{
      if(result.affectedRows>0){
        res.send({code:202,msg:'add success',newId:result.insertId});
      }else{
        res.send({code:203,msg:"add fail"});
      }
    });
  }
})

module.exports = router;