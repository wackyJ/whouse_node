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
  var sql="select * from wh_product";
  query(sql,[])
  .then(result=>{
    output.count=result.length;
    output.pageCount=Math.ceil(output.count/output.pageSize);
    sql+=` limit ?,?`;
    return query(sql,[output.pageSize*output.pno,output.pageSize]);
  })
  .then(result=>{
    output.data=result;
    res.send(output);
  })
})

module.exports=router;