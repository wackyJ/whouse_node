var express = require('express');
var router = express.Router();
var pool = require('../pool');

router.get("/v1/monthlySales",(req,res)=>{
    pool.query("select MONTH(delivery_date),SUM(total) AS total from wh_order GROUP BY MONTH(delivery_date)",(err,result)=>{
        if(err){
            res.send({code:201,msg:`${err}`})
        }else{
            res.send(result);
        }
    });
})

module.exports = router; 