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

    var jobffUrl;//岗位表单的url
    var proffUrl;//项目表单的url

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
                var lenth = jsonStr1.length;
                for (var i=0;i<lenth;i++){
                    /*if (jsonStr1[i].dctypeid==1){
                        $("#ageajax").append("<a href=\"/\" class=\"abc\">"+jsonStr1[i].dictname+"</a>");
                    }*/


                    if (jsonStr1[i].dctypeid==4){
                        $("#jobtype").append("<option value="+data[i].id+">"+data[i].dictname+"</option>");
                    }
                    if (jsonStr1[i].dctypeid==3){
                        $("#category").append("<option value="+data[i].id+">"+data[i].dictname+"</option>");
                    }
                    if (jsonStr1[i].dctypeid==7&&data[i].dictvalue!=3){
                        $("#projectState").append("<option value="+data[i].id+">"+data[i].dictname+"</option>");
                    }
                }
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
            pagination:true,
            pageSize:5,
            pageList:[5],
            pagePosition:'top',
            nowrap:false,
            loadMsg:'正在加载...',
            fitColumns:true,
            url:'project-queryProjectById?id='+${company.id},
            columns:[[
                {field:'id',title:'编号',align:'center',width:60},
                {field:'name',title:'项目名称',width:100,align:'center'},
                {field:'category',title:'业务类型',width:80,align:'right',sortable:true,align:'center',
                        formatter:function(val){
                        return formatDict(val);}},
                {field:'reqnum',title:'需要人数',width:80,align:'right',align:'center'},
                {field:'nownum',title:'当前人数',width:80,align:'center'},
                {field:'statime',title:'开始时间',width:120,align:'center'},
                {field:'endtime',title:'结束时间',width:120,align:'center'},
                {field:'comid',title:'公司id',width:60,align:'center',hidden:true},
                {field:'state',title:'状态',width:60,align:'center',
                    formatter:function(val){
                        return formatDict(val);}},
                {field:'require',title:'项目需求',width:60,align:'center',hidden:true},
                {field:'manager',
                    title:'项目管理',
                    align:'center',
                    width:110,
                    formatter:function(value, row, index){
                        var str='<a href="javascript:void(0)" name="manager" class="easyui-linkbutton" >项目管理</a>';
                        return str;
                    }},
            ]],
            onLoadSuccess:function(data){
                $("a[name='manager']").linkbutton({plain:true,iconCls:'icon-edit'});
            },
            onClickCell:function(index,field,value){
                if(field=='manager'){
                    //出现菜单栏
                    $('#proMm').menu('show', {
                        left: xx-120,
                        top: yy
                    });
                    //选中改行数据
                    $('#tt').datagrid('selectRow',index);

                }
            },onDblClickRow:function(index,row){
                $.messager.alert({
                    title:row.name+'项目需求',
                    msg:row.require,
                    showType:'show',
                    showSpeed:800
                });

            },
            view: detailview,
            detailFormatter: function(Index, row){
                return '<div style="padding:2px;position:relative;height:250px"><table id="ttc"></table></div>';
            },
            onExpandRow: function(index,row){
                var ttc = $(this).datagrid('getRowDetail',index).find("table[id='ttc']");
                ttc.datagrid({
                    fitColumns:true,
                    singleSelect:true,
                    loadMsg:'正在加载...',
                    height:'auto',
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
                                var str = '<a href="javascript:void(0)" name="opera"  class="easyui-linkbutton"  >匹配</a>';
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
                            hidden:'true',
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
                            width:100,
                            formatter:function(val){
                                return formatDict(val);}
                        },
                        {field:'edit',
                            title:'编辑',
                            align:'center',
                            width:80,
                            formatter:function(value, row, index){
                                var str = '<a href="javascript:void(0)" name="editJob"  class="easyui-linkbutton"  >修改</a>';
                                return str;
                            }},
                        {field:'delete',
                            title:'关闭',
                            align:'center',
                            width:80,
                            formatter:function(value, row, index){
                                var str = '<a href="javascript:void(0)" name="delJob"  class="easyui-linkbutton"  >关闭</a>';
                                return str;
                            }},
                    ]],
                    onLoadSuccess:function(data){
                        $("a[name='opera']").linkbutton({plain:true,iconCls:'icon-search'});
                        $("a[name='editJob']").linkbutton({plain:true,iconCls:'icon-edit'});
                        $("a[name='delJob']").linkbutton({plain:true,iconCls:'icon-no'});
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
                        if(field=="operate"){
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
                                    alert('推送');
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
                        }
                        //修改岗位
                        if(field=='edit'){
                            //选中当前行
                            $(this).datagrid('selectRow',index);
                            var row=$(this).datagrid('getSelected');

                            $('#jobdd').dialog({title:'修改岗位',
                                iconCls:'icon-edit'
                            });
                            $('#jobdd').dialog('open');
                            $('#jobff').form('clear');
                            $('#jobff').form('load',row);
                            jobffUrl='edit'+row.id;

                        }
                        //关闭岗位
                        if(field=='delete'){
                            //选中当前行
                            $(this).datagrid('selectRow',index);
                            var row=$(this).datagrid('getSelected');


                            //发送异步请求
                            alert('del'+row.id);
                        }

                    }
                });
            }
        });

        var page=$('#tt').datagrid('getPager');
        page.pagination({
            buttons: '#projectTb'
        })

    });
    function formatDict(num){
        for(var i=0 ;i<dicts.length;i++){
            if(num==dicts[i].id){
                return dicts[i].dictname;
            }
        }
    }

    function operate2(value,row,index){
        var str = '<a href="javascript:void(0)" name="opera2"  class="easyui-linkbutton" ></a>';
        return str;
    }
    function operate3(value,row,index){
        var str = '<a href="javascript:void(0)" name="opera3"  class="easyui-linkbutton" ></a>';;
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
        var row=$('#tt').datagrid('getSelected');

        $('#jobdd').dialog({title:'新增岗位',
            iconCls:'icon-add'
        });
        $('#jobdd').dialog('close');
        $('#jobdd').dialog('open');
        $('#jobff').form('clear');
        $('#jobff').form('load',{
            proid:row.id,
        });
        jobffUrl='test'+row.id;
    }




    //关闭job对话框
    function jobddClose(){
        $('#jobdd').dialog('close');
    }

    //job表单提交
    function jobffSubmit(){
        alert(jobffUrl);
    }


    //添加项目
    function addPro(){
        $('#prodd').dialog({title:'新增项目',
            iconCls:'icon-add'
        });
        $('#prodd').dialog('close');
        $('#prodd').dialog('open');
        $('#proff').form('clear');
        $('#proff').form('load',{
            comid:${company.id},
        });
        proffUrl='project-addProject';
    }

    //修改项目
    function editPro(){
        var row=$('#tt').datagrid('getSelected');

        $('#prodd').dialog({title:'修改项目',
            iconCls:'icon-add'
        });
        $('#prodd').dialog('close');
        $('#prodd').dialog('open');
        $('#proff').form('clear');
        $('#proff').form('load',row);
        proffUrl='edit'+row.id;
    }

    //关闭项目
    function delPro(){
        var row=$('#tt').datagrid('getSelected');
        alert('del'+row.id);
    }


    //关闭pro对话框
    function proddClose(){
        $('#prodd').dialog('close');
    }

    //项目表单提交
    function proffSubmit(){
        alert(proffUrl);
        $('#proff').form('submit', {
                url:proffUrl,
                onSubmit: function(param){},
                success:function(){
                    $.messager.show({
                        title:'提示',
                        msg:'操作成功',
                        showType:'show',
                    });
                }
        });
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
        <div id="dd" class="easyui-dialog" closed="true" title="人才匹配" closed="open"  modal="true" cache="true" style="width:1300px;height:600px;">
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
                            <th data-options="field:'age',width:80,align:'center'">年龄</th>
                            <th data-options="field:'gender',width:80,align:'center'">性别</th>
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
            <li><a href="javascript:void(0)">字典维护</a></li>
            <li><a href="javascript:void(0)">数据字典</a></li>
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

<!--项目管理菜单-->
<div id="proMm" class="easyui-menu" style="width:120px;">
    <div id="editPro" data-options="iconCls:'icon-edit'" onclick="editPro()">修改项目</div>
    <div id="delPro" data-options="iconCls:'icon-no'" onclick="delPro()">关闭项目</div>
    <div class="menu-sep"></div>
    <div id="addJob" data-options="iconCls:'icon-add'" onclick="addJob()">新增岗位</div>
</div>

<div id="jobdd" class="easyui-dialog"  style="width:270px;height:370px;"
     data-options="resizable:true,modal:true" closed="true" buttons="#jobddtb">
    <form id="jobff">
        &nbsp&nbsp&nbsp&nbsp<input name="id" type="text" hidden="true"><br/>
        &nbsp&nbsp&nbsp&nbsp<input name="proid" type="text" hidden="true"><br/>
        &nbsp&nbsp&nbsp&nbsp所需人数:<input name="reqNum" type="number"><br/>
        <hr>
        &nbsp&nbsp&nbsp&nbsp当前人数:<input name="nowNum" type="number"><br/>
        <hr>
        &nbsp&nbsp&nbsp&nbsp匹配人数:<input name="matNum" type="number" disabled="true"><br/>
        <hr>
        &nbsp&nbsp&nbsp&nbsp岗位类型:<select id="jobtype" name="jobtype"></select>
    </form>
</div>
</div>
<div id="jobddtb">
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true" onclick="jobffSubmit()">确认</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-no',plain:true" onclick="jobddClose()">取消</a>
</div>

<div id="projectTb">
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="addPro()">新增项目</a>
</div>

<!--项目对话框-->
<div id="prodd" class="easyui-dialog"  style="width:270px;height:550px;"
     data-options="resizable:true,modal:true" closed="true" buttons="#proddtb">
    <form id="proff" >
        <input name="id" type="text" hidden="true"><br/>
        项目名称：<input name="name" type="text"><br/>
        <hr/>
        业务类型：<select name="category" id="category"></select><br/>
        <hr/>
        所需人数：<input name="reqnum" type="text"><br/>
        <hr/>
        当前人数：<input name="nownum" type="text"><br/>
        <hr/>
        开始时间：<input name="statime" type="date"><br/>
        <hr/>
        结束时间：<input name="endtime" type="date"><br/>
        <hr/>
        <input name="comid" type="text" hidden="true"><br/>
        当前状态:<select name="state" id="projectState"></select><br/>
        <hr/>
        项目需求:<textarea name="require" type="text"></textarea><br/>
    </form>
</div>
<div id="proddtb">
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true" onclick="proffSubmit()">确认</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-no',plain:true" onclick="proddClose()">取消</a>
</div>



</body>
</html>