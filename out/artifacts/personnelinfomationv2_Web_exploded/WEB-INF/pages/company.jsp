<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>企业查询</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/link.css">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<!--easyui-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/insdep/themes/insdep/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/insdep/themes/insdep/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/insdep/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/insdep/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datagrid-detailview.js"></script>
<!--国际化-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/insdep/locale/easyui-lang-zh_CN.js"></script>
<style>
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
        background-color: #8DB6CD;
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
        background-color: #efefef;
    }
    .information{
        background-color: #ffffff;
    }
    .clearfix{
        margin-top: 5px;
    }
</style>

<body>
<div class="top">
    <img src="${pageContext.request.contextPath}/img/logo.png" alt="光环国际">
    <h1>人才信息管理系统</h1>
</div>
<div class="main">
    <div class="query">
        <input type="text" class="form-control" class="">
        <button class="btn btn-default" onclick="test()">搜索</button>
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
                        <dt class="floatLeft"><a href="/"> 行业类别</a></dt>
                        <dd class="floatLeft show-con" id="CompanyType">
                            <%--<a href="/" class="">餐饮行业</a>--%>
                            <%--<a href="/" class="">服务行业</a>--%>
                            <%--<a href="/" class="">广告业</a>--%>
                            <%--<a href="/" class="">IT行业</a>--%>
                            <%--<a href="/" class="nzw12">运输业</a>--%>
                            <%--<a href="/" class="">机械制造</a>--%>
                            <%--<a href="/" class="">保险业</a>--%>
                            <%--<a href="/" class="">能源</a>--%>
                            <%--<a href="/" class="">教育</a>--%>
                            <%--<a href="/" class="">化工</a>--%>
                            <%--<a href="/" class="">艺术</a>--%>
                            <%--<a href="/" class="">医疗服务</a>--%>
                            <%--<a href="/" class="">旅游业</a>--%>
                        </dd>
                        <dd class="floatLeft show-more"><h3 class="pointer clearfix"><span>更多</span><i class="icon-angle-down"></i></h3></dd>
                    </dl>
                    <dl class="relative clearfix" style="border-bottom:0">
                        <dt class="floatLeft"><a href="/"> 公司规模</a></dt>
                        <dd class="floatLeft show-con" id="CompanySize">
                            <%--<a href="/" class="">少于50人</a>--%>
                            <%--<a href="/" class="">50-100人</a>--%>
                            <%--<a href="/" class="">150-500人</a>--%>
                            <%--<a href="/" class="">500-1000人</a>--%>
                            <%--<a href="/" class="">5000-10000人</a>--%>
                            <%--<a href="/" class="">10000人以上</a>--%>
                        </dd>
                    </dl>
                    <!--<dl class="relative clearfix" style="border-bottom:0">
                        <dt class="floatLeft"><a href="/"> 招聘方向</a></dt>
                        <dd class="floatLeft show-con" id="recruitment">
                            <%--<a href="/" class="">java开发</a>--%>
                            <%--<a href="/" class="">php开发</a>--%>
                        </dd>
                    </dl>-->
                    <%--<dl class="relative clearfix" style="border-bottom:0">--%>
                        <%--<dt class="floatLeft"><a href="/">招聘人数：</a></dt>--%>
                        <%--<dd class="floatLeft show-con">--%>
                            <%--<a href="/" class="">少于5人</a>--%>
                            <%--<a href="/" class="">5-10人</a>--%>
                            <%--<a href="/" class="">10-50人</a>--%>
                            <%--<a href="/" class="">50-100人</a>--%>
                            <%--<a href="/" class="">100-200人</a>--%>
                            <%--<a href="/" class="">200-500人</a>--%>
                        <%--</dd>--%>
                    <%--</dl>--%>
                    <dl class="relative clearfix" style="border-bottom:0">
                        <dt class="floatLeft"><a href="/"> 公司地址</a></dt>
                        <dd class="floatLeft show-con" id="address">
                            <a href="/" class="">武汉</a>
                            <a href="/" class="">北京</a>
                        </dd>
                    </dl>
                </div>
            </div>
        </div>
    </div>
    <div class="information">
        <!--company表-->
        <table id="ctb"class="easyui-datagrid" style="width:100%;height:260px"
               data-options="fitColumns:true,singleSelect:true" pagination="true" pageSize="5" pageList="[5]",
               pagePosition="top">
            <thead>
            <tr>
                <th data-options="field:'operate',width:110,align:'center',formatter:function(value,row,index){
                    return operate(value,row,index);}">操作</th>
                <th data-options="field:'id',width:100,align:'center',hidden:true">公司编号</th>
                <th data-options="field:'name',width:100,align:'center'">公司名称</th>
                <th data-options="field:'scale',width:100,align:'center',formatter:function(val){
                    return formatDict(val);}">公司规模(人)</th>
                <th data-options="field:'business',width:100,align:'center',formatter:function(val){
                    return formatDict(val);}">行业类别</th>
                <th data-options="field:'conname',width:100,align:'center'">联系人姓名</th>
                <th data-options="field:'conphone',width:100,align:'center'">联系人电话</th>
                <th data-options="field:'conemail',width:100,align:'center'">联系人邮箱</th>
                <th data-options="field:'desription',width:100,align:'center',hidden:true">公司简介</th>
                <th data-options="field:'address',width:100,align:'center'">公司地址</th>
            </tr>
            </thead>
        </table>
    </div>
</div>
<div class="link">
    <div class="left">快速导航&lt;&lt;</div>
    <div class="right">
        <ul>
            <li><a href="server.jsp">主页</a></li>
            <h5>企业</h5>
            <li><a href="company-tocompany.a">企业查询</a></li>
            <li><a href="company-toaddcompany.a">企业维护</a></li>
            <li><a href="company-toproject.a">职位匹配</a></li>
            <h5>人才</h5>
            <li><a href="person-toperson.a">人才查询</a></li>
            <li><a href="person-toaddperson.a">人才维护</a></li>
            <h5>数据</h5>
            <li><a href="#">字典维护</a></li>
            <li><a href="#">数据字典</a></li>
        </ul>
    </div>
</div>
</body>
<script>
    var dicts;
    var number=1;//当前页码
    var size=5;//显示行数
    $('#ctb').datagrid({
        onDblClickRow:function(index,row){
            alert(row.id);
        },
        onLoadSuccess:function(data){
            $("a[name='opera']").linkbutton({plain:true,iconCls:'icon-search'});
        },
        onClickCell:function(index,field,value){
            if(field!="operate"){
                return;
            }
            $(this).datagrid('selectRow',index);
            var row=$(this).datagrid('getSelected');
            window.location.href = "company-querycompanyById?id="+row.id;
        }
    });
    function test () {
        var start=(number-1)*size;
        var serch = $(".crumb-select-item").find("a").text();
        //alert(serch);
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
            url : "company-querycompany",
            data : {serch: serch,start:start,size:size},
            success : function(data){
                /*if (data.flag){
                    alert(data.flag+""+data.massage)
                }else {
                    alert("error")
                }*/

                /*data.each(function (n,value) {
                    alert(n)
                })*/
                $('#ctb').datagrid('loadData',data);
            }
            //注意：这里不能加下面这行，否则数据会传不到后台
            //contentType:'application/json;charset=UTF-8',
        });
    }
    $.ajax({
        type: "GET",
        url: "dict-queryage",
        dataType: "json",
        success: function(data){
            var date = eval(data);
            dicts=date;
            for (var i=0;i<data.length;i++) {
                if(data[i].dctypeid==1){
                    $("#CompanySize").append("<a href=\"/\" class=\"abc\">"+data[i].dictname+"</a>");
                }else if(data[i].dctypeid==3){
                    $("#CompanyType").append("<a href=\"/\" class=\"abc\">"+data[i].dictname+"</a>");
                }else if(data[i].dctypeid==4){
                    $("#recruitment").append("<a href=\"/\" class=\"abc\">"+data[i].dictname+"</a>");
                }else if(data[i].dctypeid==5){
                    $("#address").append("<a href=\"/\" class=\"abc\">"+data[i].dictname+"</a>");
                }
            }
        }
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

    $(function(){
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


    function operate(value,row,index){
        var str = '<a href="#" name="opera"  class="easyui-linkbutton"  >查看</a>';
        return str;
    }

    function formatDict(num){
        for(var i=0 ;i<dicts.length;i++){
            if(num==dicts[i].id){
                return dicts[i].dictname;
            }
        }
    }

    //分页,切换页面时改变页码
    $(function(){
        var pager = $('#ctb').datagrid('getPager');	// get the pager of datagrid
        pager.pagination({
            onSelectPage:function(pageNumber, pageSize){
                number=pageNumber;
                size=pageSize;
                test();
            }
        });
    });
</script>
</html>