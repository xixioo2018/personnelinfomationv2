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

<!--easyui-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/insdep/themes/insdep/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/insdep/themes/insdep/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/insdep/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/insdep/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datagrid-detailview.js"></script>
<!--国际化-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/insdep/locale/easyui-lang-zh_CN.js"></script>
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

    #tfm
    {
        border-collapse:separate;
        border-spacing:10px 50px;
        overflow: hidden;
    }
    #tfm tr:nth-child(1) td:nth-child(6) input{
        width: 20px;
    }
    #tfm tr:nth-child(1) td:nth-child(6) strong{
        position: relative;
        bottom: 12px;
    }

    #tfm
    {
        border-collapse:separate;
        border-spacing:10px 50px;
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
                        <dd id="jobajax" class="floatLeft show-con">
                            <!--<a href="/" class="">H5工程师</a>
                            <a href="/" class="">前端工程师</a>
                            <a href="/" class="">JAVA开发工程师</a>
                            <a href="/" class="">php开发工程师</a>
                            <a href="/" class="">c++开发工程师</a>
                            <a href="/" class="">全栈工程师</a>
                            <a href="/" class="">架构师</a>
                            <a href="/" class="">项目经理</a>
                            <a href="/" class="">项目总监</a>
                            <a href="/" class="">技术总监</a>-->
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
        <!--person表-->
        <table id="ptb"class="easyui-datagrid" style="width:100%;height:260px"
               data-options="fitColumns:true,singleSelect:true" pagination="true" pageSize="5",
               pageList="[5]",
               pagePosition="top",>
            <thead>
            <tr>
                <th data-options="field:'operate',width:110,align:'center',formatter:function(value,row,index){
                    return operate(value,row,index);}">操作</th>
                <th data-options="field:'id',width:100,align:'center',hidden:true">学生编号</th>
                <th data-options="field:'name',width:100,align:'center'">名称</th>
                <th data-options="field:'age',width:100,align:'center'">年龄</th>
                <th data-options="field:'gender',width:100,align:'center'">性别</th>
                <th data-options="field:'education',width:100,align:'center',formatter:function(val){
                    return formatDict(val);}">学历</th>
                <th data-options="field:'school',width:100,align:'center'">毕业院校</th>
                <th data-options="field:'category',width:100,align:'center',formatter:function(val){
                    return formatDict(val);}">行业类别</th>
                <th data-options="field:'company',width:100,align:'center'">在职公司</th>
                <th data-options="field:'job',width:100,align:'center',formatter:function(val){
                    return formatDict(val);}">求职方向</th>
                <th data-options="field:'experience',width:100,align:'center'">工作经验(年)</th>
                <th data-options="field:'status',width:100,align:'center',formatter:function(val){
                    if(val==0){return '空闲';}else{return '在职';}}">状态</th>
                <th data-options="field:'resume',width:100,align:'center',hidden:true">简历附件</th>
                <th data-options="field:'priority',width:100,align:'center',hidden:true">优先度</th>
            </tr>
            </thead>
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
    var dicts;
    var number=1;//当前页码
    var size=5;//显示行数
    $('#ptb').datagrid({
        onDblClickRow:function(index,row){
        // alert(row.education);
        },
        onLoadSuccess:function(data){
            $("a[name='opera']").linkbutton({plain:true,iconCls:'icon-edit'});
        },
        onClickCell:function(index,field,value){
            if(field!="operate"){
                return;
            }
            $(this).datagrid('selectRow',index);
            var row=$(this).datagrid('getSelected');
            $('#dd').dialog('open');
            $('#fm').form('load',row);
        }
    });
    function test () {
        var serch = $(".crumb-select-item").find("a").text();
        var start=(number-1)*size;
        //alert(start+'---'+number+'----'+size);
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
            url : "person-queryperson?start="+start+"&size="+size,
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

                $('#ptb').datagrid('loadData',data);
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
            data : {age: 1,education:2,category:3,job:4},
            success : function(data){
                var jsonStr1 = eval(data);
                dicts=jsonStr1;
                var lenth = jsonStr1.length;
                for (var i=0;i<lenth;i++){
                    /*if (jsonStr1[i].dctypeid==1){
                        $("#ageajax").append("<a href=\"/\" class=\"abc\">"+jsonStr1[i].dictname+"</a>");
                    }*/
                    if (jsonStr1[i].dctypeid==2){
                        $("#educationajax").append("<a href=\"/\" class=\"abc\">"+jsonStr1[i].dictname+"</a>");
                        $("#education").append("<option value="+data[i].id+">"+data[i].dictname+"</option>");
                    }
                    if (jsonStr1[i].dctypeid==3){
                        $("#categoryajax").append("<a href=\"/\" class=\"abc\">"+jsonStr1[i].dictname+"</a>");
                        $("#category").append("<option value="+data[i].id+">"+data[i].dictname+"</option>");
                    }
                    if (jsonStr1[i].dctypeid==4){
                        $("#jobajax").append("<a href=\"/\" class=\"abc\">"+jsonStr1[i].dictname+"</a>");
                        $("#job").append("<option value="+data[i].id+">"+data[i].dictname+"</option>");
                    }
                }
               //alert(dicts.length);
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
        });
        $("dd a").click(function () {
            //  console.log($(this).parent("dd").prev().find("a").text()+$(this).text());
            console.log($(".shaixuan-tj span:gt(1) a").text());
        });



    })

    function formatDict(num){
        for(var i=0 ;i<dicts.length;i++){
            if(num==dicts[i].id){
                return dicts[i].dictname;
            }
        }
    }

    function operate(value,row,index){
        var str = '<a href="#" name="opera"  class="easyui-linkbutton" >修改</a>';
        return str;
    }

    function sub(){

        $('#fm').form('submit', {
            url:'person-updatePersonById',
            onSubmit: function(){
            },
            success:function(){
                $.messager.show({
                    title:'提示',
                    msg:'操作成功',
                    showType:'show',
                });
                $('#dd').dialog('close');
                test ();
            }
        });
    }

    $(function(){
        var pager = $('#ptb').datagrid('getPager');	// get the pager of datagrid
        pager.pagination({
            onSelectPage:function(pageNumber, pageSize){
                number=pageNumber;
                size=pageSize;
                test();
            }
        });
    });


</script>

<div id="dd" class="easyui-dialog" style="width:1000px;height:480px" closed="true"
     data-options="title:'修改人才信息',modal:true,buttons:'#tb'" >
    <form id="fm"  method="post" enctype="multipart/form-data">
        <input type="hidden" name="resume" value="abc">
        <input type="hidden" name="id" >
        <table id="tfm">
            <tr align="right">
                <td><strong>姓名:</strong></td>
                <td><input type="text" class="form-control" placeholder="姓名" name="name"></td>
                <td><strong>年龄:</strong></td>
                <td><input type="text" class="form-control" placeholder="年龄" name="age"></td>
                <td><strong>性别:</strong></td>
                <td align="left"><strong>男</strong><input type="radio" name="gender" value="男"><strong>女</strong><input type="radio" name="gender" value="女"></td>
            </tr>
            <tr align="right">
                <td><strong>学历:</strong></td>
                <td>
                    <select class="form-control" name="education" id="education">
                    </select>
                </td>
                <td><strong>毕业院校:</strong></td>
                <td><input type="text" class="form-control" placeholder="毕业院校" name="school"></td>
                <td><strong>行业类别:</strong></td>
                <td>
                    <select class="form-control" name="category" id="category">
                    </select>
                </td>
            </tr>
            <tr align="right">
                <td><strong>所在公司:</strong></td>
                <td><input type="text" class="form-control" placeholder="所在公司" name="company"></td>
                <td><strong>求职方向:</strong></td>
                <td>
                    <select class="form-control" name="job" id="job">
                    </select>
                </td>
                <td><strong>工作经验:</strong></td>
                <td><input type="text" class="form-control" placeholder="工作经验" name="experience"></td>
            </tr>
            <tr>
                <td><strong>是否在职</strong></td>
                <td>
                    <select class="form-control" name="status">
                        <option value="0">空闲</option>
                        <option value="1">在职</option>
                    </select>
                </td>
                <td><strong>上传简历:</strong></td>
                <td>
                    <input type="file" class="btn btn-primary" name="file">
                </td>
                <td colspan="2"></td>
            </tr>
        </table>
    </form>
</div>
<div id="tb">
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true" onclick="sub()">提交</a>
</div>


</html>