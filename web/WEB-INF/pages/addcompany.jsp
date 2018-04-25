<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>企业维护</title>
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
    .head{
        width: 100%;
        text-align: center;
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
    .mid input,.mid select{
        width: 240px;
        height: 40px;
        display: inline-block;
    }
    .mid strong{
        font-size: 20px;
        margin-right: 10px;
        margin-left: 10px;
    }
    table
    {
        border-collapse:separate;
        border-spacing:10px 50px;
    }
    .mid button{
        margin-left: 50px;
        width: 160px;
        height: 40px;
    }
</style>
<script>
    $(function () {
        $("button").click(function moveTo() {
            var mymessage=confirm("要继续添加信息吗?");
            if(mymessage==true){
                $("#flag").val("true");
                $("#form").submit();
            }
            else{
                $("#flag").val("false");
                $("#form").submit();
            }
        });
        $.ajax({
            type: "GET",
            url: "dict-queryage",
            dataType: "json",
            success: function(data){
                var date = eval(data);
                for (var i=0;i<data.length;i++) {
                    if(data[i].dctypeid==1){
                        $("#CompanySize").append("<option value="+data[i].id+">"+data[i].dictname+"</option>");

                    }else if(data[i].dctypeid==3){
                        $("#CompanyType").append("<option value="+data[i].id+">"+data[i].dictname+"</option>");
                    }
                }
            }
        });
    })
</script>
<body>
<div class="top">
    <img src="${pageContext.request.contextPath}img/logo.png" alt="光环国际">
    <h1>人才信息管理系统</h1>
</div>
<div class="main">
<div class="head">
    <h2>欢迎录入企业信息</h2>
    <p>致力于打造最完善的企业搜索平台</p>
</div>
    <div class="mid">
                <form action="company-addCompany">
                    <table>
                <tr>
                    <td> <strong>公司名称:</strong></td>
                    <td>  <input type="text" class="form-control" placeholder="公司名称" name="name"></td>
                    <td>  <strong>公司规模:</strong></td>
                    <td>  <select id="CompanySize" class="form-control" name="scale.id">


                    </select></td>
                    <td> <strong>业务类型:</strong></td>
                    <td> <select id="CompanyType" class="form-control" name="business.id">

                    </select></td>
                </tr>
                <tr>
                    <td> <strong>联系人姓名:</strong></td>
                    <td> <input type="text" class="form-control" placeholder="联系人姓名" name="conName"></td>
                    <td>  <strong>联系人电话:</strong></td>
                    <td>  <input type="text" class="form-control" placeholder="联系人电话" name="conPhone"></td>
                    <td><strong>企业邮箱:</strong></td>
                    <td><input type="text" class="form-control" placeholder="企业邮箱" name="conEmail"></td>
                </tr>
                <tr>
                    <td><strong>公司简介:</strong></td>
                    <td colspan="3">
                        <textarea class="form-control" name="description" placeholder="公司简介"></textarea>
                    </td>
                    <td><strong>公司地址:</strong></td>
                    <td><input type="text" class="form-control" placeholder="公司地址" name="address"></td>
                </tr>
            </table>
                    <p align="center"><button type="submit" class="btn btn-primary">提交表单</button></p>
                    <input type="hidden" name="flag" id="flag">
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
