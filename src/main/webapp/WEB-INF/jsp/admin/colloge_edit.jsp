<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑学院</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/bootstrap.min.css" media="all">
</head>
<body style="font-size: 0.8rem;" class="m-3">
<div class="d-flex">
    <div class="col d-flex">
        <label style="width: 80px;margin-bottom: 0px;" class="d-flex align-items-center"><span style="color: #FF7670;">*
        </span>
            学院名称:</label>
        <input id="collogeId" type="hidden" class="form-control form-control-sm" value="${colloge.collogeId}"/>
        <input id="collogeName" class="form-control form-control-sm" value="${colloge.collogeName}" placeholder="请输入学院名称"/>
    </div>
    <div class="col d-flex">
        <label style="width: 80px;margin-bottom: 0px;" class="d-flex align-items-center"><span style="color: #FF7670;">*
        </span>学院序号:</label>
        <input id="orderNum" value="${colloge.orderNum}" class="form-control form-control-sm" placeholder="请输入学院序号"/>
    </div>
</div>
<script src="${pageContext.request.contextPath}/lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/lay-config.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/http.js" charset="utf-8"></script>
<script>
    //引入layui的弹出层
    var layer = null;
    layui.use(['layer'], function () {
        layer = layui.layer;
    })

    function addParm() {
        //获取学院的值
        var collogeName = $("#collogeName").val();
        if (!collogeName) {
            layer.msg('请填写学院名称!');
            return;
        }
        var orderNum = $("#orderNum").val();
        if (!orderNum) {
            layer.msg('请填写学院序号!');
            return;
        }
        return{
            collogeId:$("#collogeId").val(),
            collogeName:collogeName,
            orderNum:orderNum
        }
    }
</script>
</body>
</html>