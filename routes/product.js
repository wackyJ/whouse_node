const query=require("./query");
const express = require("express");
const router= express.Router();

router.get("/v1/repertory",(req,res)=>{
  let output={
    count:0,
    pageSize:30,
    pageCount:0,
    pno:req.query.pno||0,
    data:[]
  };
  let sql="SELECT * FROM wh_product";
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

router.post("/v1/updata",(req,res)=>{
  let $propName = req.body.params.propName;
  let $value = req.body.params.value;
  let $pid=req.body.params.pid;
  console.log($propName);
  console.log($value);
  console.log($pid);
  /*let sql="UPDATE wh_product SET ? = ?  WHERE ?;";
  query(sql,[$propName,$value,$pid]).then(result=>{
    // if(result.affectedRows>0){
      console.log(123456);
			res.send({code:200,msg:"updata success"});*/
		// }else{
		// 	res.send({code:201,msg:"updata faile"});
		// }
  // })
 })

router.delete("/v1/deldata",(req,res)=>{
  let $pid=req.query.pid;
  let sql=`DELETE FROM wh_product WHERE pid = ?;`;
  query(sql,[$pid]).then(result=>{
    if(result.affectedRows>0){
			res.send({code:200,msg:"delete success"});
		}else{
			res.send({code:201,msg:"delect faile"});
		}
  })
})

module.exports=router;