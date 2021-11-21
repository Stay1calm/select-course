<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增学院</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/bootstrap.min.css"  media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui-v2.6.3/css/layui.css" media="all">


<body style="font-size: 0.8rem;" class="m-3">
<div class="d-flex">
    <div class="col d-flex">
    <label style="width: 80px;margin-bottom: 0px;" class="d-flex align-items-center "><span style="color: #da4f49">*</span>学院名称:</label>
    <input id="collogeName" value="" placeholder="请输入学院名称" class="form-control form-control-sm">
    </div>
    <div class="col d-flex">
        <label style="width: 80px;margin-bottom: 0px;" class="d-flex align-items-center "><span style="color: #da4f49">*</span>学院序号:</label>
        <input id="orderNum" value="" placeholder="请输入学院序号" class="form-control form-control-sm">
    </div>
</div>
<script>
    //引入layui的弹出层
    var layer=null;
    layui.use(['layer'],function () {
        layer=layui.layer;
    })
    function addParm(){
        //  获取学院的值
        var collogeName= $("#collogeName").val();
        if (!collogeName){
            layer.msg('请填写学院名称');
            return;
        }
        var orderNum=$("#orderNum").val();
        if (!orderNum){
            layer.msg('请填写学院序号');
            return;
        }
        return{
            collogeName:collogeName,
            orderNum:orderNum
        }
    }

</script>
<script src="${pageContext.request.contextPath}/lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/lay-config.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/http.js" charset="utf-8"></script>
</body>
</html>
