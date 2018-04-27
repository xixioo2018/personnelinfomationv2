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
<script>
    var dicts;//数据字典


    var xx;
    var yy;




    $(function(){
        //对鼠标定位
        $('body').mousemove(function(e) {
            e = e || window.event;
            xx = e.pageX || e.clientX + document.body.scroolLeft;
            yy = e.pageY || e.clientY + document.body.scrollTop;
        });

        /*数据字典查找*/
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
            }
            //注意：这里不能加下面这行，否则数据会传不到后台
            //contentType:'application/json;charset=UTF-8',
        });


        $('#tt').datagrid({
            title:'项目一览',
            width:'100%',
            height:'auto',
            remoteSort:false,
            singleSelect:true,
            nowrap:false,
            fitColumns:true,
            url:'project-queryProjectById?id='+${company.id},
            columns:[[
                {field:'id',title:'编号',width:80},
                {field:'name',title:'项目名称',width:100,align:'center'},
                {field:'category',title:'业务类型',width:80,align:'right',sortable:true,align:'center'},
                {field:'reqnum',title:'需要人数',width:80,align:'right',align:'center'},
                {field:'nownum',title:'当前人数',width:150,align:'center'},
                {field:'comid',title:'公司id',width:60,align:'center'},
                {field:'state',title:'状态',width:60,align:'center'},
                {field:'require',title:'项目需求',width:60,align:'center'}
            ]],
            view: detailview,
            detailFormatter: function(Index, row){
                return '<div style="padding:2px;position:relative;height:250px"><table name="ttc"></table></div>';
            },
            onExpandRow: function(index,row){
                var ttc = $(this).datagrid('getRowDetail',index).find("table[name='ttc']");
                ttc.datagrid({
                    fitColumns:true,
                    singleSelect:true,
                    loadMsg:'正在加载...',
                    height:'auto',
                    toolbar:'#jtb',
                    pagination:true,
                    //查找岗位
                    url:'job-queryJobById?id='+row.id,
                    pageSize:5,
                    pageList:[5],
                    pagePosition:'top',
                    columns:[[
                        {field:'operate',
                            title:'操作',
                            align:'center',
                            width:110,
                            formatter:function(value, row, index){
                                var str = '<a href="#" name="opera"  class="easyui-linkbutton"  >匹配</a>';
                                return str;
                            }},
                        {
                            title:'岗位编号',
                            field: 'id',
                            width:100
                        },
                        {
                            title:'所属项目',
                            field: 'proid',
                            width:100
                        },
                        {
                            title:'需求人数',
                            field: 'reqnum',
                            width:100
                        },
                        {
                            title:'当前人数',
                            field: 'nownum',
                            width:100
                        },
                        {
                            title:'匹配人数',
                            field: 'matnum',
                            width:100
                        },
                        {
                            title:'岗位类型',
                            field: 'jobtype',
                            width:100
                        }
                    ]],
                    onLoadSuccess:function(data){
                        $("a[name='opera']").linkbutton({plain:true,iconCls:'icon-search'});
                    },
                    onClickRow:function(index,row){
                        //匹配
                        /*
                        $.post('matchServlet',row,function(){
                          $('#none').datagrid('reload');
                          $('#done').datagrid('reload');
                        });
                        $('#dd').dialog('open');
                        */
                    },
                    onClickCell:function(index,field,value){
                        if(field!="operate"){
                            return;
                        }
                        $(this).datagrid('selectRow',index);
                        var row=$(this).datagrid('getSelected');

                        $('#none').datagrid({
                            url:'person-matchperson?jobtype='+row.jobtype+'&jobid='+row.id,
                            onLoadSuccess:function(data){
                                $("a[name='opera2']").linkbutton({plain:true,iconCls:'icon-redo',text:'推送'});
                            },
                            onClickCell:function (index,field,value) {
                                if(field!="operate"){
                                    return;
                                }
                                $(this).datagrid('selectRow',index);
                                var row=$(this).datagrid('getSelected');
                                alert(row.name);
                            }
                        });
                        $('#done').datagrid({
                            url:'job2person-queryJob2personByJid?id='+row.id,
                            onLoadSuccess:function(data){
                                $("a[name='opera3']").linkbutton({
                                    plain:true,
                                    iconCls:'icon-edit',
                                    text:'操作'
                                });
                            },
                            onClickCell:function (index,field,value) {
                                if(field!="operate"){
                                    return;
                                }

                                //让菜单出现在鼠标位置
                                $('#mm').menu('show', {
                                    left: xx+50,
                                    top: yy
                                });
                                $(this).datagrid('selectRow',index);
                                var row=$(this).datagrid('getSelected');

                            }
                        });
                        $('#done').datagrid('reload');
                        $('#none').datagrid('reload');
                        $('#dd').dialog('open');

                    },
                    onDblClickRow:function(index,row){
                        $("table[name='ttc']").datagrid('unselectAll');
                        $('#mmJob').menu('show', {
                            left: xx+50,
                            top: yy
                        });
                        $(this).datagrid('selectRow',index);
                        var row=$(this).datagrid('getSelected');
                    }
                });
                //var data=row.jobs;
                //ttc.datagrid('loadData',data);
            }
        });

    });
    function formatDict(num){
        for(var i=0 ;i<dicts.length;i++){
            if(num==dicts[i].id){
                return dicts[i].dictname;
            }
        }
    }

    function operate2(value,row,index){
        var str = '<a href="#" name="opera2"  class="easyui-linkbutton" ></a>';
        return str;
    }
    function operate3(value,row,index){
        var str = '<a href="#" name="opera3"  class="easyui-linkbutton" ></a>';;
        return str;
    }
    //未上岗
    function unhire(){
        var row=$('#done').datagrid('getSelected');

        $.post("job2person-updateJob2personById",
            {
                "id":row.id,
                "jobid":row.jobid,
                "jobtype":row.jobtype,
                "perid.id":row.perid.id,
                "perid.name":row.perid.name,
                "perid.age":row.perid.age,
                "perid.gender":row.perid.gender,
                "perid.education":row.perid.education,
                "perid.school":row.perid.school,
                "perid.category":row.perid.category,
                "perid.company":row.perid.company,
                "perid.job":row.perid.job,
                "perid.experience":row.perid.experience,
                "perid.status":row.perid.status,
                "perid.resume":row.perid.resume,
                "perid.priority":row.perid.priority,
                "status":33,
                "isinter":row.isinter,
                "ishire":row.ishire
            },
            function(){
                $('#done').datagrid('reload');
        });

    }

    //已上岗
    function hire(){
        var row=$('#done').datagrid('getSelected');

        $.post("job2person-updateJob2personById",
            {
                "id":row.id,
                "jobid":row.jobid,
                "jobtype":row.jobtype,
                "perid.id":row.perid.id,
                "perid.name":row.perid.name,
                "perid.age":row.perid.age,
                "perid.gender":row.perid.gender,
                "perid.education":row.perid.education,
                "perid.school":row.perid.school,
                "perid.category":row.perid.category,
                "perid.company":row.perid.company,
                "perid.job":row.perid.job,
                "perid.experience":row.perid.experience,
                "perid.status":row.perid.status,
                "perid.resume":row.perid.resume,
                "perid.priority":row.perid.priority,
                "status":34,
                "isinter":row.isinter,
                "ishire":1
            },
            function(){
                $('#done').datagrid('reload');
            });

    }

    //面试通过
    function pass(){
        var row=$('#done').datagrid('getSelected');

        $.post("job2person-updateJob2personById",
            {
                "id":row.id,
                "jobid":row.jobid,
                "jobtype":row.jobtype,
                "perid.id":row.perid.id,
                "perid.name":row.perid.name,
                "perid.age":row.perid.age,
                "perid.gender":row.perid.gender,
                "perid.education":row.perid.education,
                "perid.school":row.perid.school,
                "perid.category":row.perid.category,
                "perid.company":row.perid.company,
                "perid.job":row.perid.job,
                "perid.experience":row.perid.experience,
                "perid.status":row.perid.status,
                "perid.resume":row.perid.resume,
                "perid.priority":row.perid.priority,
                "status":31,
                "isinter":1,
                "ishire":row.ishire
            },
            function(){
                $('#done').datagrid('reload');
            });

    }

    //面试未通过
    function unpass(){
        var row=$('#done').datagrid('getSelected');

        $.post("job2person-updateJob2personById",
            {
                "id":row.id,
                "jobid":row.jobid,
                "jobtype":row.jobtype,
                "perid.id":row.perid.id,
                "perid.name":row.perid.name,
                "perid.age":row.perid.age,
                "perid.gender":row.perid.gender,
                "perid.education":row.perid.education,
                "perid.school":row.perid.school,
                "perid.category":row.perid.category,
                "perid.company":row.perid.company,
                "perid.job":row.perid.job,
                "perid.experience":row.perid.experience,
                "perid.status":row.perid.status,
                "perid.resume":row.perid.resume,
                "perid.priority":row.perid.priority,
                "status":32,
                "isinter":1,
                "ishire":row.ishire
            },
            function(){
                $('#done').datagrid('reload');
            });

    }
    //添加岗位
    function  addJob() {
        var row=$("table[name='ttc']").datagrid('getSelected');
        alert(row.id);
    }

    //编辑岗位
    function  editJob() {
        var row=$("table[name='ttc']").datagrid('getSelected');
        alert(row.id);
    }

    //关闭岗位
    function  removeJob() {
        var row=$("table[name='ttc']").datagrid('getSelected');
        alert(row.id);
    }

</script>
<body >
<div class="top">
    <img src="img/logo.png" alt="光环国际">
    <h1>人才信息管理系统</h1>
</div>
<div class="main">
    <div class="companyinf">
        <h3>${company.name}</h3>
        <div class="introduce">
            <h4>公司介绍</h4>
             <p>
                ${company.description}
             </p>
        </div>
        <div class="information">
        <span>公司基本信息</span>
            <ul>
                <li><strong>业务类型:</strong><span>${company.business}</span></li>
                <li><strong>公司规模:</strong><span>${company.scale}</span></li>
                <li><strong>企业邮箱:</strong><span>${company.conemail}</span></li>
                <li><strong>公司地点:</strong><span>${company.address}</span></li>
            </ul>
        </div>
        <div class="contact">
<p><strong>联系人姓名:</strong><span>${company.conname}</span></p>
<p><strong>联系人电话:</strong><span>${company.conphone}</span></p>
        </div>
    </div>
    <div class="project">
        <table id="tt"></table>
        <div id="dd" class="easyui-dialog" closed="true" title="人才匹配" closed="open"  modal="true" cache="true" style="width:1200px;height:600px;">
            <div id="tabs" class="easyui-tabs" fit=true tabWidth=200 narrow=true>
                <div title="未推送"  style="padding:20px;display:none;">
                    <table id="none" class="easyui-datagrid" style="width:100%;" pagination="true" pagePosition="top"
                           data-options="fitColumns:true,singleSelect:true">
                        <thead>
                        <tr>
                            <th data-options="field:'operate',width:110,align:'center',formatter:function(value,row,index){
                    return operate2(value,row,index);}">操作</th>
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
                            <th data-options="field:'status',width:100,align:'center'">状态</th>
                            <th data-options="field:'resume',width:100,align:'center',hidden:true">简历附件</th>
                            <th data-options="field:'priority',width:100,align:'center',hidden:true">优先度</th>
                        </tr>
                        </thead>
                    </table>
                </div>
                <div title="已推送" style="padding:20px;display:none;">
                    <table id="done" class="easyui-datagrid" style="width:100%;" pagination="true" pagePosition="top"
                           data-options="fitColumns:true,singleSelect:true">
                        <thead>
                        <tr>
                            <th data-options="field:'operate',width:50,align:'center',formatter:function(value,row,index){
                    return operate3(value,row,index);}">操作</th>
                            <th data-options="field:'id',width:100,align:'center',hidden:'true'">id</th>
                            <th data-options="field:'jobid',width:100,align:'center',hidden:'true'">所属岗位</th>
                            <th data-options="field:'jobtype',width:90,align:'center',formatter:function(val){
                    return formatDict(val);}">岗位类型</th>
                            <th data-options="field:'perid',width:50,align:'center',formatter:function(val){
                    return val.name;
                }">姓名</th>
                            <th data-options="field:'status',width:100,align:'center',formatter:function(val){
                    return formatDict(val);}">推送状态</th>
                            <th data-options="field:'isinter',width:100,align:'center',formatter:function(val){
                    if(val==1){return '已面试';}else{return '未面试';}}">是否面试</th>
                            <th data-options="field:'ishire',width:100,align:'center',formatter:function(val){
                    if(val==1){return '已录用';}else{return '未录用';}}">是否录用</th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
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
<div id="mm" class="easyui-menu" style="width:120px;">
    <div id="unpass" data-options="iconCls:'icon-undo'" onclick="unpass()">面试未过</div>
    <div id="pass" data-options="iconCls:'icon-redo'" onclick="pass()">面试通过</div>
    <div class="menu-sep"></div>
    <div id="hire" data-options="iconCls:'icon-ok'" onclick="hire()">已上岗</div>
    <div id="unhire" data-options="iconCls:'icon-cancel'" onclick="unhire()">未上岗</div>
</div>

<div id="mmJob" class="easyui-menu" style="width:120px;">
    <div  data-options="iconCls:'icon-undo'" onclick="addJob()">添加岗位</div>
    <div  data-options="iconCls:'icon-redo'" onclick="editJob()">编辑岗位</div>
    <div  data-options="iconCls:'icon-cancel'" onclick="removeJob()">关闭岗位</div>
</div>



</body>
</html>