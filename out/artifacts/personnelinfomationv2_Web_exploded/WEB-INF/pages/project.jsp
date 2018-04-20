<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>职位匹配</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/link.css">
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
        min-height: 88%;
        width: 100%;
        background-color: #2585d2;
        overflow: hidden;
    }
    .companyinf{
        width: 1200px;
        min-height: 150px;
        margin: 0 auto;
        background-color:  rgba(255,255,255,0.4);
        margin-top: 10px;
        border-radius: 10px;
        padding: 5px;
        position: relative;
    }
    .companyinf h3{
        margin-left: 30px;
    }
    .introduce{
        width: 800px;
        min-height: 150px;
        margin-left: 30px;
        display: inline-block;
        overflow: hidden;
        margin-bottom: 20px;
    }
    .information{
        height: 200px;
        width: 280px;
        display: inline-block;
        margin-left: 40px;
        overflow: hidden;
        position: absolute;
    }
    .information ul li{
        list-style-type: none;
        padding-top: 20px;
    }
    introduce p{
        color: #555;
    }
    .information strong{
        padding: 20px;
    }
    .contact{
        margin-left: 30px;
    }
    .contact span{
        padding-left: 10px;
    }
    .project,.job,.mate{
        width: 1200px;
        min-height: 150px;
        margin: 0 auto;
        background-color:  rgba(255,255,255,1);
        margin-top: 10px;
        border-radius: 10px;
        padding: 5px;
    }
</style>
<body>
<div class="top">
    <img src="${pageContext.request.contextPath}/img/logo.png" alt="光环国际">
    <h1>人才信息管理系统</h1>
</div>
<div class="main">
    <div class="companyinf">
        <h3>光环国际</h3>
        <div class="introduce">
            <h4>公司介绍</h4>
             <p>
                 光环国际教育集团创办于2001年，在管理培训领域，光环卓而不凡的服务品质，已经成为国内该领域的著名品牌。多年来我们一直致力于传播国际领先的管理思想和方法，并推动其在中国企业的广泛应用，帮助个人与组织取得持久竞争力，以此助推国家发展。目前，光环国际教育集团在项目管理、国际财会、国际MBA教育等领域积累了丰富成熟的经验，并取得了令人骄傲的成绩，荣获08年腾讯网主办的“中国最具实力教育集团”的称号。
                 光环国际一如既往全力推动项目管理在中国的发展，以“诚信，专注，高效，进取，共赢”为理念，为客户创造价值，引领管理实践，提升企业的管理成熟度，帮助企业和管理者实现自我突破和超越！以此推动国家发展！

             </p>
        </div>
        <div class="information">
        <span>公司基本信息</span>
            <ul>
                <li><strong>业务类型:</strong><span>互联网/培训</span></li>
                <li><strong>公司规模:</strong><span>2000人以上</span></li>
                <li><strong>企业邮箱:</strong><span>328852120@qq.com</span></li>
                <li><strong>公司地点:</strong><span>光谷软件园</span></li>
            </ul>
        </div>
        <div class="contact">
<p><strong>联系人姓名:</strong><span>老王</span></p>
<p><strong>联系人电话:</strong><span>18627857490</span></p>
        </div>
    </div>
    <div class="project">

    </div>
    <div class="job">

    </div>
    <div class="mate">

    </div>
</div>
<div class="link">
    <div class="left">快速导航&lt;&lt;</div>
    <div class="right">
        <ul>
            <li><a href="server.html">主页</a></li>
            <h5>企业</h5>
            <li><a href="company.html">企业查询</a></li>
            <li><a href="addcompany.html">企业维护</a></li>
            <li><a href="project.html">职位匹配</a></li>
            <h5>人才</h5>
            <li><a href="people.html">人才查询</a></li>
            <li><a href="addperson.html">人才维护</a></li>
            <h5>数据</h5>
            <li><a href="#">字典维护</a></li>
            <li><a href="#">数据字典</a></li>
        </ul>
    </div>
</div>
</body>
</html>