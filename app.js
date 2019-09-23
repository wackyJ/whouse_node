const cors = require('cors');
const createError = require('http-errors');
const express = require('express');
// 用于处理文件与目录的路径
const path = require('path');

const cookieParser = require('cookie-parser');
// 用来记录日志的中间件
const logger = require('morgan');
//引入session模块，用来记录用户的登录状态
const session = require('express-session')
//引入路由器
var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var financeRouter = require('./routes/finance');
var productRouter = require('./routes/product');
var orderRouter = require('./routes/order');
var settingRouter = require('./routes/setting');
var tipsRouter = require('./routes/tips');
var logRouter = require('./routes/log');
var logisticsRouter = require('./routes/logistics')

var app = express();
app.use(cors({
  origin:["http://127.0.0.1:8080","http://localhost:8080","http://49.235.127.99:3389"],
  credentials:true
}));
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
// 配置session
app.use(session({
  secret:"whouse",//加密字符串，随意内容但定义以后不要修改
  resave:true,  //重复保存
  saveUninitialized:true, //保存初始化数据
  // cookie: { maxAge: 30*60*1000 }
}))
app.use(express.static( 'public' ));

// view engine setup
// 修改为使用后缀为.html的模板文件
var ejs=require('ejs');
app.set('views', path.join(__dirname, 'views'));
app.engine('html',ejs.__express);
app.set('view engine', 'html');

//使用路由器，并挂载到相应路径下
app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/finance', financeRouter);
app.use('/product',productRouter);
app.use('/order',orderRouter);
app.use('/setting',settingRouter);
app.use('/tips',tipsRouter);
app.use('/log',logRouter);
app.use('/logistics',logisticsRouter);

// catch 404 and forward to error handler
app.use(function(req,res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
