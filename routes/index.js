var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index');
});
//添加登录路由
router.get("/v1/login/:uname&:upwd",(req,res)=>{
	//获取提交数据
	var $uname=req.params.uname;
	var $upwd=req.params.upwd;
	console.log($uname);
	console.log($upwd);
	//执行mongodb语句

});


module.exports = router;
