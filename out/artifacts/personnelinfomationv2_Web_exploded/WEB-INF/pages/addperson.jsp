<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>人才维护</title>
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
        min-height: 80%;
        width: 100%;
        background-color:#2585d2 ;
        overflow: hidden;
        text-align: center;
    }
    .main h2{
        font-size: 44px;
        font-weight: bold;
        color: white;
        margin-bottom: 20px;
    }
    .main p{
        font-size: 28px;
        font-weight: bold;
        color: white;
        margin-bottom: 20px;
    }
    .mid{
        width: 1200px;
        min-height: 500px;
        background-color: rgba(255,255,255,1);
        margin: 0 auto;
        border-radius: 10px;
        padding-top: 30px;
        padding-bottom: 30px;
        padding-left: 10px;
    }
    table
    {
        border-collapse:separate;
        border-spacing:10px 50px;
    }
    .mid strong{
        font-size: 20px;
        margin-right: 10px;
        margin-left: 30px;
    }
    .mid input,.mid select{
        width: 240px;
        height: 40px;
        display: inline-block;
    }
    table
    {
        border-collapse:separate;
        border-spacing:10px 50px;
        overflow: hidden;
    }
    table tr:nth-child(1) td:nth-child(6) input{
        width: 20px;
    }
    table tr:nth-child(1) td:nth-child(6) strong{
        position: relative;
        bottom: 12px;
    }
</style>
<script>
    $(function () {
        $("button").click(function moveTo() {
            var mymessage=confirm("要继续添加信息吗?");
            if(mymessage==true){
            }
            else{
                window.open("people.html");
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
    <h2>欢迎录入人才信息</h2>
    <p>建设一个强大的人才库，让你接触过的候选人都成为未来的人才储备</p>
    <div class="mid">
        <form action="https://www.baidu.com">
             <table>
                 <tr>
                     <td><strong>姓名:</strong></td>
                     <td><input type="text" class="form-control" placeholder="姓名" name="name"></td>
                     <td><strong>年龄:</strong></td>
                     <td><input type="text" class="form-control" placeholder="年龄" name="age"></td>
                     <td><strong>性别:</strong></td>
                     <td><strong>男</strong><input type="radio" name="gender" value="男"><strong>女</strong><input type="radio" name="gender" value="女"></td>
                 </tr>
                 <tr>
                     <td><strong>学历:</strong></td>
                     <td>
                         <select class="form-control" name="education">
                             <option>1</option>
                             <option>2</option>
                             <option>3</option>
                             <option>4</option>
                             <option>5</option>
                         </select>
                     </td>
                     <td><strong>毕业院校:</strong></td>
                     <td><input type="text" class="form-control" placeholder="毕业院校" name="school"></td>
                     <td><strong>行业类别:</strong></td>
                     <td>
                         <select class="form-control" name="category">
                             <option>1</option>
                             <option>2</option>
                             <option>3</option>
                             <option>4</option>
                             <option>5</option>
                         </select>
                     </td>
                 </tr>
                 <tr>
                     <td><strong>所在公司:</strong></td>
                     <td><input type="text" class="form-control" placeholder="所在公司" name="company"></td>
                     <td><strong>求职方向:</strong></td>
                     <td>
                         <select class="form-control" name="job">
                             <option>1</option>
                             <option>2</option>
                             <option>3</option>
                             <option>4</option>
                             <option>5</option>
                         </select>
                     </td>
                     <td><strong>工作经验:</strong></td>
                     <td><input type="text" class="form-control" placeholder="工作经验" name="experience"></td>
                 </tr>
                 <tr>
                     <td colspan="2"></td>
                     <td><strong>上传简历:</strong></td>
                     <td>
                         <input type="file" class="btn btn-primary" name="resume">
                     </td>
                     <td colspan="2"></td>
                 </tr>
             </table>
            <p align="center"><button type="submit" class="btn btn-primary">上传信息</button></p>
        </form>
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