const jwt = require('jsonwebtoken');
const cors = require('cors');
var createError = require('http-errors');
var express = require('express');
// 用于处理文件与目录的路径
var path = require('path');
var cookieParser = require('cookie-parser');
// 用来记录日志的中间件
var logger = require('morgan');
//引入路由器
var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var financeRouter = require('./routes/finance');
var productRouter = require('./routes/product');

var app = express();

// view engine setup
// 修改为使用后缀为.html的模板文件
var ejs=require('ejs');
app.set('views', path.join(__dirname, 'views'));
app.engine('html',ejs.__express);
app.set('view engine', 'html');

app.use(cors());
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
//使用路由器，并挂载到相应路径下
app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/finance', financeRouter);
app.use('/product',productRouter);

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
