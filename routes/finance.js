var express = require('express');
var router = express.Router();
var pool = require('../pool');

router.get("/v1/monthlySales",(req,res)=>{
    pool.query("select month(delivery_date),SUM(total) AS total from wh_order GROUP BY month(delivery_date)",(err,result)=>{
        if(err){
            res.send({code:201,msg:`${err}`})
        }else{
            res.send(result);
        }
    });
});
router.get("/v1/weeklySales",(req,res)=>{
    pool.query("select week(delivery_date),SUM(total) AS total from wh_order GROUP BY week(delivery_date)",(err,result)=>{
        if(err){
            res.send({code:201,msg:`${err}`})
        }else{
            res.send(result);
        }
    });
});
router.get("/v1/yearlySales",(req,res)=>{
    pool.query("select year(delivery_date),SUM(total) AS total from wh_order GROUP BY year(delivery_date)",(err,result)=>{
        if(err){
            res.send({code:201,msg:`${err}`})
        }else{
            res.send(result);
        }
    });
});

module.exports = router; 