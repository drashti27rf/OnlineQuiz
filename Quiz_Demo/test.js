"use strict"
var express = require("express");
var app = express();
var path = require("path");
var fs = require("fs");
var mysql = require("mysql");
var http = require("http");
var ejs = require("ejs");
var arr=[];
var host_name = 'spring2019divya.cufydhbnrpo2.us-east-2.rds.amazonaws.com';
var	port_no =  '3306';
var	database_name =  'Quiz_Sys_Db';
var	usernameRDS = 'dpate114';
var passwordRDS = '12345';
var session = require('express-session');
var bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({extended : false });
var sqlConnection = mysql.createConnection({
  host:host_name,
  port:port_no,
  database: database_name,
  user:usernameRDS,
  password:passwordRDS

});


app.use(session({
  secret : 'Drashti',
  resave : false,
  saveUninitialized : true
}));
app.set('view engine', 'ejs');


app.get('/login',function(req,res){
	res.render('login');
});

app.post('/login',urlencodedParser,function(req,res){
  sqlConnection.connect(function(error){
    console.log(req.body.username);
    console.log(req.body.psw);
    sqlConnection.query('select Username from User where Username = "'+req.body.username+'" and Password = "'+req.body.psw+'"',function(error,result,field){
    console.log(result);
    req.session.uname = result;
    res.redirect('/mycat');
  })
});

});

app.get('/mycat',function(req,res){
	sqlConnection.connect(function(err) {
	  console.log("Connected!");
    console.log(req.session.uname[0].Username);
    sqlConnection.query('select Title from Quiz where creater_id = "'+req.session.uname[0].Username+'"',function(error,result,field){
    console.log(result);
    res.render('cat',{re: result});
});
});
});


app.listen("8080");
console.log("listening at 8080");
