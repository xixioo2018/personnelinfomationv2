<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>人才查询</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/link.css">
<script src="js/jquery.min.js"></script>
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
        margin-bottom: 0px;
    }
    .main{
        min-height: 88%;
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
        bottom: 18px;
        font-size: 40px;
    }
    .query,.information{
        width: 1200px;
        min-height: 120px;
        background-color: rgba(255,255,255,0.6);
        border-radius: 10px;
        position: relative;
        right: 100px;
        overflow: hidden;
        margin-top: 10px;
        padding-top: 10px;
    }
    .information{
        background-color: #ffffff;
    }
    .clearfix{
        margin-top: 5px;
    }
</style>
<body>
<script type="application/javascript">

</script>
<div class="top">
    <img src="${pageContext.request.contextPath}/img/logo.png" alt="光环国际">
    <h1>人才信息管理系统</h1>
</div>
<div class="main">
    <div class="query">
        <input type="text" class="form-control" class="">
        <button class="btn btn-default" onclick="test()"> 搜索</button>
        <div style="width:946px; margin:0 auto;">
            <div class="clearfix">
                <p class="shaixuan-tj floatLeft clearfix">
                    <span><a href="/">全部结果</a></span>
                    <i class="icon-angle-right"></i>
                    <span><strong>“搜索公司”</strong></span>
                    <i class="icon-angle-right"></i>
                </p>
                <p id="sxbtn" class="shaixuan-btn clearfix"><span><em>收起筛选</em><i class="icon-angle-up"></i></span></p>
            </div>
            <div id="page-search-store" class="mb10 border sxcon">
                <div class="search-by by-category relative">
                    <dl class="relative clearfix">
                        <dt class="floatLeft"><a href="/"> 年龄</a></dt>
                        <dd id="ageajax" class="floatLeft show-con">
                            <a href="/" class="">小于20岁</a>
                            <a href="/" class="">20-25</a>
                            <a href="/" class="">25-30</a>
                            <a href="/" class="">30-35</a>
                            <a href="/" class="nzw12">35-40</a>
                            <a href="/" class="">40-45</a>
                            <a href="/" class="">45-50</a>
                        </dd>
                        <dd class="floatLeft show-more"><h3 class="pointer clearfix"><span>更多</span><i class="icon-angle-down"></i></h3></dd>
                    </dl>
                    <dl class="relative clearfix" style="border-bottom:0">
                        <dt class="floatLeft"><a href="/"> 性别</a></dt>
                        <dd class="floatLeft show-con">
                            <a href="/" class="">男</a>
                            <a href="/" class="">女</a>
                        </dd>
                    </dl>
                    <dl class="relative clearfix" style="border-bottom:0">
                        <dt class="floatLeft"><a href="/"> 学历</a></dt>
                        <dd id="educationajax" class="floatLeft show-con">
                            <%--<a href="/" class="">高中</a>
                            <a href="/" class="">专科</a>
                            <a href="/" class="">本科</a>
                            <a href="/" class="">硕士</a>
                            <a href="/" class="">博士</a>
                            <a href="/" class="">博士后</a>--%>
                        </dd>
                    </dl>
                    <dl class="relative clearfix" style="border-bottom:0">
                        <dt class="floatLeft"><a href="/"> 行业类别</a></dt>
                        <dd id="categoryajax" class="floatLeft show-con">
                            <%--<a href="/" class="">餐饮行业</a>
                            <a href="/" class="">服务行业</a>
                            <a href="/" class="">广告业</a>
                            <a href="/" class="">IT行业</a>
                            <a href="/" class="nzw12">运输业</a>
                            <a href="/" class="">机械制造</a>
                            <a href="/" class="">保险业</a>
                            <a href="/" class="">能源</a>
                            <a href="/" class="">教育</a>
                            <a href="/" class="">化工</a>
                            <a href="/" class="">艺术</a>
                            <a href="/" class="">医疗服务</a>
                            <a href="/" class="">旅游业</a>--%>
                        </dd>
                        <dd class="floatLeft show-more"><h3 class="pointer clearfix"><span>更多</span><i class="icon-angle-down"></i></h3></dd>
                    </dl>
                    <dl class="relative clearfix" style="border-bottom:0">
                        <dt class="floatLeft"><a href="/"> 求职方向</a></dt>
                        <dd class="floatLeft show-con">
                            <a href="/" class="">H5工程师</a>
                            <a href="/" class="">前端工程师</a>
                            <a href="/" class="">JAVA开发工程师</a>
                            <a href="/" class="">php开发工程师</a>
                            <a href="/" class="">c++开发工程师</a>
                            <a href="/" class="">全栈工程师</a>
                            <a href="/" class="">架构师</a>
                            <a href="/" class="">项目经理</a>
                            <a href="/" class="">项目总监</a>
                            <a href="/" class="">技术总监</a>
                        </dd>
                        <dd class="floatLeft show-more"><h3 class="pointer clearfix"><span>更多</span><i class="icon-angle-down"></i></h3></dd>
                    </dl>
                    <dl class="relative clearfix" style="border-bottom:0">
                        <dt class="floatLeft"><a href="/"> 工作经验</a></dt>
                        <dd class="floatLeft show-con">
                            <a href="/" class="">应届毕业生</a>
                            <a href="/" class="">小于1年</a>
                            <a href="/" class="">1-3年</a>
                            <a href="/" class="">3-5年</a>
                            <a href="/" class="">5-7年</a>
                            <a href="/" class="">7年以上</a>
                        </dd>
                    </dl>
                </div>
            </div>
        </div>
    </div>
    <div class="information">
        <table class="table table-striped table-bordered table-hover " style="background-color: white" width="200">
            <tr>
                <th>No</th>
                <th>名称</th>
                <th>公司规模</th>
                <th>行业类别</th>
                <th>招聘方向</th>
                <th>招聘人数</th>
                <th>职位要求</th>
                <th>联系人姓名</th>
                <th>联系人电话</th>
                <th>公司地址</th>
            </tr>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
                <td>10</td>
            </tr>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
                <td>10</td>
            </tr>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
                <td>10</td>
            </tr>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
                <td>10</td>
            </tr>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
                <td>10</td>
            </tr>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
                <td>10</td>
            </tr>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
                <td>10</td>
            </tr>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
                <td>10</td>
            </tr>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
                <td>10</td>
            </tr>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
                <td>10</td>
            </tr>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
                <td>10</td>
            </tr>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
                <td>10</td>
            </tr>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
                <td>10</td>
            </tr>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
                <td>10</td>
            </tr>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
                <td>10</td>
            </tr>
        </table>

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
<script>
    function test () {
        var serch = $(".crumb-select-item").find("a").text();
        alert(serch)
        /*var boxIds = new Array();
        boxIds.push("age=23");
        boxIds.push("school=jdwl");
        boxIds.push("category=12");
        alert(boxIds)*/
        /*var param = {list : boxIds};
        alert(param.list)*/
        $.ajax({
            timeout : 20000,
            type : "POST",
            dataType : "JSON",
            /*traditional:true,*/
            url : "person-queryperson",
            data : {serch: serch},
            success : function(data){
                /*if (data.flag){
                    alert(data.flag+""+data.massage)
                }else {
                    alert("error")
                }*/

                /*data.each(function (n,value) {
                    alert(n)
                })*/
                alert(data[0])
            }
            //注意：这里不能加下面这行，否则数据会传不到后台
            //contentType:'application/json;charset=UTF-8',
        });
    }
    $(function(){
        /*请求数据年龄*/
        $.ajax({
            timeout : 20000,
            type : "POST",
            dataType : "JSON",
            /*traditional:true,*/
            url : "dict-queryage",
            data : {age: 1,education:2,category:3},
            success : function(data){
                var jsonStr1 = eval(data)
                var lenth = jsonStr1.length;
                for (var i=0;i<lenth;i++){
                    /*if (jsonStr1[i].dctypeid==1){
                        $("#ageajax").append("<a href=\"/\" class=\"abc\">"+jsonStr1[i].dictname+"</a>");
                    }*/
                    if (jsonStr1[i].dctypeid==2){
                        $("#educationajax").append("<a href=\"/\" class=\"abc\">"+jsonStr1[i].dictname+"</a>");
                    }
                    if (jsonStr1[i].dctypeid==3){
                        $("#categoryajax").append("<a href=\"/\" class=\"abc\">"+jsonStr1[i].dictname+"</a>");
                    }
                }
            }
            //注意：这里不能加下面这行，否则数据会传不到后台
            //contentType:'application/json;charset=UTF-8',
        });
        $(".show-con").on('click','.abc',function(){
            event.preventDefault();
            THIP = $(this).parents("dl");
            if($(this).hasClass("nzw12")){
            }else{
                $(this).addClass("nzw12");
                var zhiclass = $(this).parents("dd").siblings("dt").find("a").text();
                zhicon = $(this).text();
                tianjaneir="<span class='crumb-select-item'><a href='/'><b>"+zhiclass+"</b><em>"+zhicon+"</em><i class='icon-remove'></i></a></span>"
                $(".shaixuan-tj").children().last().after(tianjaneir);
                THIP.css("display","none");
            }
        });
        $("tr:even").addClass("active");
        $("tr:odd").addClass("info")
        $(".shaixuan-tj span.crumb-select-item").live('hover',function(event){
            if(event.type=='mouseenter'){
                $(this).addClass("crumb-select-itemon");
            }else{
                $(this).removeClass("crumb-select-itemon");
            }
        });
        $(".shaixuan-tj span.crumb-select-item").live('click', function(event){
            event.preventDefault();
            $(this).remove();
            var TTR = $(this).find("em").text();
            $(".show-con a").each(function(){
                var TT = $(this).text();
                THI = $(this);
                THIPP = $(this).parents("dl");
                if(TTR==TT){
                    THI.removeClass("nzw12");
                    THIPP.css("display","block");
                    /*得到TT*/
                }
            })
        });
        $(".show-con a").click(function(event){
            event.preventDefault();
            THIP = $(this).parents("dl");
            if($(this).hasClass("nzw12")){
            }else{
                $(this).addClass("nzw12");
                var zhiclass = $(this).parents("dd").siblings("dt").find("a").text();
                zhicon = $(this).text();
                tianjaneir="<span class='crumb-select-item'><a href='/'><b>"+zhiclass+"</b><em>"+zhicon+"</em><i class='icon-remove'></i></a></span>"
                $(".shaixuan-tj").children().last().after(tianjaneir);
                THIP.css("display","none");
            }
        });
        $(".show-more").click(function(event){
            event.preventDefault();
            var ticon = $(this).find("i");
            tspan = $(this).find("span");
            if($(this).hasClass("zk")){
                $(this).siblings(".show-con").css("height","30px");
                ticon.removeClass("icon-angle-up");
                ticon.addClass("icon-angle-down");
                tspan.html("更多");
                $(this).removeClass("zk")
            }else{
                $(this).siblings(".show-con").css("height","auto");
                ticon.removeClass("icon-angle-down");
                ticon.addClass("icon-angle-up");
                tspan.html("收起");
                $(this).addClass("zk")
            }
        });
        $("#sxbtn").click(function(event){
            event.preventDefault();
            var xicon = $(this).find("span i");
            xspan = $(this).find("span em");
            if($(this).hasClass("zkon")){
                xspan.text("收起筛选");
                xicon.removeClass("icon-angle-down");
                xicon.addClass("icon-angle-up");
                $(".sxcon").slideDown();
                $(this).removeClass("zkon")
            }else{
                xspan.text("查看筛选");
                xicon.removeClass("icon-angle-up");
                xicon.addClass("icon-angle-down");
                $(".sxcon").slideUp();
                $(this).addClass("zkon")
            }
        })
        $("dd a").click(function () {
            //  console.log($(this).parent("dd").prev().find("a").text()+$(this).text());
            console.log($(".shaixuan-tj span:gt(1) a").text());
        })
    })
</script>
</html>