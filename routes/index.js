var express = require('express');
var router = express.Router();
const User = require('../schemas/user');
/**********************/

//添加登录路由
router.get("/v1/login/:uname&:upwd",(req,res)=>{
	//获取提交数据
	var $uname=req.params.uname;
	var $upwd=req.params.upwd;
	console.log($uname);
	console.log($upwd);
	//执行mongodb语句
	// 插入
	function insert() {
	var user = new User({
		username: $uname, // 用户名
		password: $upwd, // 用户密码
		age: 18, // 用户年龄
		lastLoinDate: new Date() // 最近登录一次时间
	});

	user.save(function (err, docs) {
		if(err) {
		console.log("Error: " + err);
		} else {
		console.log("docs: " + docs);
		}
	})
	}
	insert();

});

/* GET home page. */
router.get('/signin', function(req, res, next) {
  res.render('index');
});



module.exports = router;
