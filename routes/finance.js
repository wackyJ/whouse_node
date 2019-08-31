const express = require('express');
const pool = require('../pool');
const router = express.Router();

router.get("/v1/monthlySales",(req,res)=>{
    pool.query("select month(delivery_date),SUM(price*pcount) AS total from wh_order_detail GROUP BY month(delivery_date)",(err,result)=>{
        if(err){
            res.send({code:201,msg:`${err}`})
        }else{
            res.send(result);
        }
    });
});
router.get("/v1/weeklySales",(req,res)=>{
    pool.query("select week(delivery_date),SUM(price*pcount) AS total from wh_order_detail GROUP BY week(delivery_date)",(err,result)=>{
        if(err){
            res.send({code:201,msg:`${err}`})
        }else{
            res.send(result);
        }
    });
});
router.get("/v1/yearlySales",(req,res)=>{
    pool.query("select year(delivery_date),SUM(price*pcount) AS total from wh_order_detail GROUP BY year(delivery_date)",(err,result)=>{
        if(err){
            res.send({code:201,msg:`${err}`})
        }else{
            res.send(result);
        }
    });
});

module.exports = router; 