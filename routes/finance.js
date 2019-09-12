const express = require('express');
const pool = require('../pool');
const router = express.Router();

router.get("/v1/weeklySales",(req,res)=>{
    //判断用户是否已经登录
    let uid = req.session.uid;
    if(!uid){
        res.send({code:-1,mgs:"请先登录"})
        return;
    }
    pool.query("select week(delivery_date),SUM(sell_price*pcount) AS total from wh_order_detail GROUP BY week(delivery_date)",(err,result)=>{
        if(err){
            res.send({code:201,msg:`${err}`})
        }else{
            res.send({code:200,msg:"According to successful",data:result});
        }
    });
});

router.get("/v1/monthlySales",(req,res)=>{
    //判断用户是否已经登录
    let uid = req.session.uid;
    if(!uid){
        res.send({code:-1,mgs:"请先登录"})
        return;
    }
    pool.query("select month(delivery_date),SUM(Sell_price*pcount) AS total from wh_order_detail GROUP BY month(delivery_date)",(err,result)=>{
        if(err){
            res.send({code:201,msg:`${err}`})
        }else{
            res.send({code:200,msg:"According to successful",data:result});
        }
    });
});

router.get("/v1/yearlySales",(req,res)=>{
    //判断用户是否已经登录
    let uid = req.session.uid;
    if(!uid){
        res.send({code:-1,mgs:"请先登录"})
        return;
    }
    pool.query("select year(delivery_date),SUM(sell_price*pcount) AS total from wh_order_detail GROUP BY year(delivery_date)",(err,result)=>{
        if(err){
            res.send({code:201,msg:`${err}`})
        }else{
            res.send({code:200,msg:"According to successful",data:result});
        }
    });
});

module.exports = router; 