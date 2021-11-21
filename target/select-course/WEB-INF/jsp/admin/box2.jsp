<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/bootstrap.min.css">
</head>
<body>
<h3>div默认是垂直排列</h3>
<div style="background-color: #909baf;height: 200px;display: flex">
    <div style="height: 40px;width: 40px;flex-grow: 1;line-height: 40px;text-align: center;background-color: #00F7DE;color: #FFF;">1</div>
    <div style="height: 40px;width: 40px;flex-grow: 1;line-height: 40px;text-align: center;background-color: #6fe862;color: #FFF;" >2</div>
    <div style="height: 40px;width: 40px;flex-grow: 1;line-height: 40px;text-align: center;background-color: #d1a1ea;color: #FFF;">3</div>
    <div style="height: 40px;width: 40px;flex-grow: 1;line-height: 40px;text-align: center;background-color: #86a1e7;color: #FFF;">4</div>
</div>
<div style="background-color: #909baf;height: 200px;" class="d-flex flex-column">
    <div style="height: 40px;width: 40px;flex-grow: 1;line-height: 40px;text-align: center;background-color: #00F7DE;color: #FFF;">1</div>
    <div style="height: 40px;width: 40px;flex-grow: 1;line-height: 40px;text-align: center;background-color: #6fe862;color: #FFF;" >2</div>
    <div style="height: 40px;width: 40px;flex-grow: 1;line-height: 40px;text-align: center;background-color: #d1a1ea;color: #FFF;">3</div>
    <div style="height: 40px;width: 40px;flex-grow: 1;line-height: 40px;text-align: center;background-color: #86a1e7;color: #FFF;">4</div>
</div>
</body>1
</html>
