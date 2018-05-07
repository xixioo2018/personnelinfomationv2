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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">
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
        padding-top: 20px;
    }
    h6{
        width: 200px;
        height: 200px;
        border: 5px solid white;
        text-align: center;
        line-height: 200px;
        border-radius: 50%;
        color: white;
        font-weight: bold;
        font-size: 22px;
    }
</style>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<script>
       $(function () {
           var $guideSlider = $("#guideSlider").eq(0);

           $guideSlider.find(".guide-list .guide").hover(function() {
               $(this).addClass("on").siblings().removeClass("on");
           });
       })
</script>
<body>
<div class="top">
    <img src="${pageContext.request.contextPath}/img/logo.png" alt="光环国际">
    <h1>人才信息管理系统</h1>
</div>
<div class="main">
    <div class="guide-slider" id="guideSlider">
        <ul class="guide-list">
            <li class="guide on">
                <div class="display">
                    <div class="icon icon1 animated flipInY"></div>
                    <div class="title">企业管理</div>
                    <div class="introduction">提升宝贝搜索排名，玩转免费流量</div>
                </div>
                <div class="behind">
                    <div class="function-list-wrap">
                        <ul class="function-list">
                            <li class="function corner corner-hot"><a href="company-toaddcompany.a">企业维护</a></li>
                            <li class="function corner"><a href="company-tocompany.a">企业查询</a></li>
                            <li class="function corner"><a href="company-toproject.a">职位匹配</a></li>
                            <li class="function"><a href="#">敬请期待</a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="guide">
                <div class="display">
                    <div class="icon icon2 animated flipInY"></div>
                    <div class="title">人才管理</div>
                    <div class="introduction">抓住每一个流量，千方百计促使成交</div>
                </div>
                <div class="behind">
                    <div class="function-list-wrap">
                        <ul class="function-list">
                            <li class="function"><a href="person-toaddperson.a">人才维护</a></li>
                            <li class="function"><a href="person-toperson.a">人才查询</a></li>
                            <li class="function"><a href="#">人才匹配</a></li>
                            <li class="function"><a href="#">敬请期待</a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="guide">
                <div class="display">
                    <div class="icon icon5 animated flipInY"></div>
                    <div class="title">系统管理</div>
                    <div class="introduction">用全能掌柜，让您轻轻松松做掌柜</div>
                </div>
                <div class="behind">
                    <div class="function-list-wrap">
                        <ul class="function-list">
                            <li class="function"><a href="#">数据字典</a></li>
                            <li class="function"><a href="#">字典维护</a></li>
                            <li class="function"><a href="#">官方推荐</a></li>
                            <li class="function"><a href="#">敬请期待</a></li>
                        </ul>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>
</body>
</html>