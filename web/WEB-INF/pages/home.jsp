<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>主页</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
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
    .main{
        height: 88%;
        width: 100%;
        background-color: #2585d2;
        padding-top: 100px;
    }
    .main ul{
        margin-left: 100px;
    }
    ul li{
        list-style-type: none;
        float: left;
        margin-left: 100px;
        position: relative;
    }
    h6{
        width: 200px;
        height: 200px;
        border-radius: 50%;
        border: 5px solid white;
        text-align: center;
        line-height: 200px;
        color: #ffffff;
        font-size: 22px;
        font-weight: bold;
    }
    ul li p{
        width: 10px;
        height: 10px;
        text-align: center;
        line-height: 10px;
        font-size: 1px;
        font-weight: bold;
        border: 5px solid white;
        border-radius: 50%;
        float: left;
        position: absolute;
        bottom: 50px;
        left: 50px;
        display: none;
        opacity: 0;
    }
    ul li a{
        color: #ffffff;
    }
    ul li a:hover{
        text-decoration: none;
        color: #ffffff;
    }
    ul li div{

    }
</style>
<script>
        $(function () {
            var num=0;
            $("li").find("h6").click(function () {
                if(num%2==0){
                     if($(this).is("h6")){
                         console.log($(this).is("h6"));
                         $(this).parent().find("p").css("display",'block');
                         $(this).parent().find("p").animate({left:"-100px",opacity:1,width:"100px",height:"100px",lineHeight:"100px",fontSize:"18px"},1000);
                         $(this).parent().find("p").eq(1).animate({bottom:"150px"},1000);
                         $(this).parent().find("p").eq(2).animate({bottom:"-50px"},1000);
                         num++;
                     }
                }else if(num%2!=0){
                    if($(this).is("h6")) {
                        $(this).parent().find("p").animate({left: "50px", opacity: 0.5,width:"10px",height:"10px",lineHeight:"10px",fontSize:"1px", opacity: 0}, 1000);
                        $(this).parent().find("p").animate({bottom: "50px"}, 1000);
                        num++;
                    }
                }
            })
        })
</script>
<body>
<div class="top">
    <img src="${pageContext.request.contextPath}/img/logo.png" alt="光环国际">
    <h1>人才信息管理系统</h1>
</div>
<div class="main">
    <ul>
        <li>
            <h6>企业</h6>
            <div>
                <p><a href="company-toaddcompany.a">企业维护</a></p>
                <p><a href="company-tocompany.a">企业查询</a></p>
                <p><a href="company-toproject.a">职位匹配</a></p>
            </div>
        </li>
        <li>
            <h6>人才</h6>
            <div>
                <p><a href="person-toaddperson.a">人才维护</a></p>
                <p><a href="person-toperson.a">人才查询</a></p>
                <p><a href="">敬请期待</a></p>
            </div>
        </li>
        <li>
            <h6>系统</h6>
            <div>
                <p><a href="">数据字典</a></p>
                <p><a href="">字典维护</a></p>
                <p><a href="">敬请期待</a></p>
            </div>
        </li>
    </ul>
</div>
</body>
</html>