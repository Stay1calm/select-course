<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学院管理</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui-v2.6.3/css/layui.css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/bootstrap.min.css" media="all">

<body class="m-3" style="font-size: 0.8rem;">
<%--头部搜索框--%>
<div class="d-flex">
    <div class="col-auto d-flex align-items-center">
        <input id="searchName" class="form-control form-control-sm" value="" placeholder="请输入学院名称"/>
        <button class="layui-btn layui-btn-primary layui-btn-sm ml-3" id="searchBtn"><i class="layui-icon layui-icon-search"></i>搜索
        </button>
        <button style="border: 1px solid #FF7670;color: #FF7670;"
                class="layui-btn layui-btn-primary layui-btn-sm ml-3" id="resetBtn"><i
                class="layui-icon layui-icon-close"></i>重置
        </button>
        <button id="addBtn" class="layui-btn layui-btn-normal layui-btn-sm ml-3"><i
                class="layui-icon layui-icon-add-1"></i>新增
        </button>
    </div>
</div>
<%--//定义表格展示的容器--%>
<table id="collogeTable" lay-filter="collogeTable">
<%--    定义表头的工具栏--%>
    <script type="text/html" id="toolbar">
    <div class="layui-btn-container">
<%--        <button class="layui-btn layui-btn-danger layui-btn-sm" lay-event="deleteAll">删除</button>--%>
    </div>
</script>
<%--  行工具条--%>
    <script id="lineTool" type="text/html">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
</table>
<script src="${pageContext.request.contextPath}/lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/lay-config.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/http.js" charset="utf-8"></script>
<script>
    layui.use(['table', 'layer'], function () {
        var table = layui.table;
        var layer = layui.layer;
        //渲染表格
        table.render({
            elem:'#collogeTable',//制定表格渲染的容器
            height:'full-80',
            url:'/colloge.do?method=list',//获取表格数据的地址
            toolbar:'#toolbar',
            cols:[[
                {field:'collogeName',title:'学院名称'},
                {field:'orderNum',title:'学院序号'},
                {fixed: 'right', width:150, align:'center', toolbar: '#lineTool'} //这里的toolbar值是模板元素的选择器
            ]],
            page:true,//开启分页
            limit:5,
            limits:[5,20,30,100]
        });
        //监听行工具条事件
        table.on('tool(collogeTable)',function (obj) {
            console.log(obj);
            //编辑按钮
            if (obj.event == 'edit')
            {
                //打开弹框
                var index=layer.open({
                    skin:'layui-layer-molv',
                    offset:'0px',
                    title:'编辑学院',
                    type:2,//iframe的形式
                    area:['650px','350px'],//弹框的宽高
                    content: '/colloge.do?method=editUI&collogeId='+obj.data.collogeId,
                    btn:['确定','取消'],
                    btn1:function (index) {
                        var parms=window["layui-layer-iframe"+index].addParm();
                        if (parms)
                        {
                            http.post(
                                "/colloge.do?method=editSave",parms,function (data) {
                                    if (data&&data.code==200){
                                        layer.msg(data.msg);
                                        layer.close(index);
                                        //刷新表格数据
                                        reload();
                                    }
                                }
                            )
                        }
                    },
                    btn2:function (index) {


                    }
                })
            }else if (obj.event=='del')
            {
                //信息提示
                //eg1
                layer.confirm('确定删除该数据吗？', {icon: 3, title:'提示'}, function(index){
                    //do something
                    //发送请求给后端 需要传递删除的id
                    http.post("/colloge.do?method=delete&collogeId="+obj.data.collogeId,function (data){
                        if (data.code==200)
                        {
                            layer.msg(data.msg);
                            layer.close(index);
                            //刷新表格数据
                            reload();
                        }
                    })
                    layer.close(index);
                });
            }
        });
        //监听表头工具栏按钮事件
        table.on('toolbar(collogeTable)',function (obj) {
            console.log(obj);
        });
        //搜索按钮点击事件
        $("#searchBtn").click(function () {
            reload();

        });
        $("#resetBtn").click(function () {
            //清空搜索框的数据
            $("#searchName").val('');
            reload();
        });
        //表格重载
        function reload(){
            table.reload('collogeTable', {
                where: { //设定异步数据接口的额外参数，任意设
                    collogeName:$("#searchName").val()
                    //…
                }
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }
            }); //只重载数据
        }
        //新增按钮点击事件
        $("#addBtn").click(function () {
            //打开弹框
            var index = layer.open({
                skin:'layui-layer-molv',
                offset:'0px',
                title:'新增学院',
                type:2,
                area:['650px','350px'],
                content:'/colloge.do?method=addUI',
                btn:['确定','取消'],
                btn1:function (index) {
                    var parms=window["layui-layer-iframe"+index].addParm();
                    if (parms)
                    {
                        http.post(
                            "/colloge.do?method=addSave",parms,function (data) {
                                if (data&&data.code==200){
                                    layer.msg(data.msg);
                                    layer.close(index);
                                    //刷新表格数据
                                    reload();
                                }
                            }
                        )
                    }
                },
                btn2:function (index) {


                }
            })
        });
    });
</script>
</body>
</html>
