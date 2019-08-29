const query=require("./query");
const express = require("express");
const router= express.Router();

router.get("/v1/repertory",(req,res)=>{
  var output={
    count:0,
    pageSize:30,
    pageCount:0,
    pno:req.query.pno||0,
    data:[]
  };
  var sql="SELECT * FROM wh_product";
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

router.post("/v1/delRecord",(req,res)=>{
  let _pid=req.body.params.pid;
  let sql=`DELETE FROM wh_product WHERE pid = ?;`;
  query(sql,[_pid]).then(result=>{
    if(result.affectedRows>0){
			res.send({code:1,msg:"delete success"});
		}else{
			res.send({code:-1,msg:"delect faile"});
		}
  })
})

module.exports=router;