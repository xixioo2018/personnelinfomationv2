<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        *{
            margin: 0px;
            padding: 0px;
        }
        body,html{
            height: 100%;
        }
        .top{
            height: 12%;
            width: 100%;
            position: relative;
        }
        .main{
            height: 88%;
            width: 100%;
            background-color: #2585d2;
            overflow: hidden;
        }
        .top img{
            float: left;
            margin-left: 60px;
            margin-top: 10px;
        }
        .top h1{
            font-family: STXingkai;
            position: absolute;
            left: 210px;
            bottom: 13px;
        }
        .main p{
            color: #ffffff;
            text-align: center;
            margin-top: 25px;
        }
        .main p:nth-child(1){
            font-size: 32px;
        }
        .main p:nth-child(2){
            font-size: 54px;
        }
        .main p:nth-child(3){
            font-size: 20px;
        }
        .login{
            display: block;
            width: 500px;
            height: 600px;
            margin-left: 35%;
        }
        .login input{
            width: 400px;
            height: 50px;
            margin-top: 30px;
        }
        .login input:nth-child(3){
            color: #ffffff;
            background-color:#2585d2 ;
            border: 3px solid white;
            font-size: 20px;
        }
        .login input:nth-child(3):hover{
            color:#2585d2 ;
            background-color: #ffffff;
        }
    </style>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="top">
    <img src="img/logo.png" alt="光环国际">
    <h1>人才信息管理系统</h1>
</div>
<div class="main">
    <p>构建企业未来敏捷组织</p>
    <p>核心人力云（人力资源管理系统）</p>
    <p>激活、人才、创造智慧HR新世代&nbsp;!</p>
    <form class="login" action="login" method="post">
        <input type="text" class="form-control" placeholder="username" name="username">
        <input type="password" class="form-control" placeholder="password" name="password">
        <input type="submit" class="form-control" value="Login">
    </form>
</div>
</body>
</html>