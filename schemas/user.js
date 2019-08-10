// 定义一个user的Schema，命名为user.js

/**
 * 用户信息
 */
// 定义数据库表存储结构
const mongoose = require('../db');
const Schema = mongoose.Schema;

const UserSchema = new Schema({
  username: { type: String }, // 用户名
  password: { type: String }, // 用户密码
  age: { type: String }, // 用户年龄
  lastLoinDate: { type: Date } // 最近登录一次时间
})

// 生成Model
module.exports = mongoose.model('User', UserSchema);