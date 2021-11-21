<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="margin-left: 30px">

<h3> div默认垂直排列</h3>
<div style="background-color: #909baf;height: 200px;">
    <div style="height: 40px;width: 40px;line-height: 40px;text-align: center;background-color: #00F7DE;color: #FFF;">1</div>
    <div style="height: 40px;width: 40px;line-height: 40px;text-align: center;background-color: #6fe862;color: #FFF;" >2</div>
    <div style="height: 40px;width: 40px;line-height: 40px;text-align: center;background-color: #d1a1ea;color: #FFF;">3</div>
    <div style="height: 40px;width: 40px;line-height: 40px;text-align: center;background-color: #86a1e7;color: #FFF;">4</div>
</div>
<br>
<h3> div变成弹性盒子模型 div子元素水平排列display: flex;</h3>
<div style="background-color: #909baf;height: 200px;display: flex;">
    <div style="height: 40px;width: 40px;line-height: 40px;text-align: center;background-color: #00F7DE;color: #FFF;">1</div>
    <div style="height: 40px;width: 40px;line-height: 40px;text-align: center;background-color: #6fe862;color: #FFF;" >2</div>
    <div style="height: 40px;width: 40px;line-height: 40px;text-align: center;background-color: #d1a1ea;color: #FFF;">3</div>
    <div style="height: 40px;width: 40px;line-height: 40px;text-align: center;background-color: #86a1e7;color: #FFF;">4</div>
</div>
<h3> div变成弹性盒子模型 div子元素默认水平排列flex-direction: row从左到右</h3>
<div style="background-color: #909baf;height: 200px;flex-direction: row">
    <div style="height: 40px;width: 40px;line-height: 40px;text-align: center;background-color: #00F7DE;color: #FFF;">1</div>
    <div style="height: 40px;width: 40px;line-height: 40px;text-align: center;background-color: #6fe862;color: #FFF;" >2</div>
    <div style="height: 40px;width: 40px;line-height: 40px;text-align: center;background-color: #d1a1ea;color: #FFF;">3</div>
    <div style="height: 40px;width: 40px;line-height: 40px;text-align: center;background-color: #86a1e7;color: #FFF;">4</div>
</div>
<h3> div变成弹性盒子模型 div子元素默认水平排列flex-direction: row从右到左</h3>
<div style="background-color: #909baf;height: 200px;flex-direction: row-reverse">
    <div style="height: 40px;width: 40px;line-height: 40px;text-align: center;background-color: #00F7DE;color: #FFF;">1</div>
    <div style="height: 40px;width: 40px;line-height: 40px;text-align: center;background-color: #6fe862;color: #FFF;" >2</div>
    <div style="height: 40px;width: 40px;line-height: 40px;text-align: center;background-color: #d1a1ea;color: #FFF;">3</div>
    <div style="height: 40px;width: 40px;line-height: 40px;text-align: center;background-color: #86a1e7;color: #FFF;">4</div>
</div>
<h3> div变成弹性盒子模型 div子元素 从上到下</h3>
<div style="background-color: #909baf;height: 200px;flex-direction: column">
    <div style="height: 40px;width: 40px;line-height: 40px;text-align: center;background-color: #00F7DE;color: #FFF;">1</div>
    <div style="height: 40px;width: 40px;line-height: 40px;text-align: center;background-color: #6fe862;color: #FFF;" >2</div>
    <div style="height: 40px;width: 40px;line-height: 40px;text-align: center;background-color: #d1a1ea;color: #FFF;">3</div>
    <div style="height: 40px;width: 40px;line-height: 40px;text-align: center;background-color: #86a1e7;color: #FFF;">4</div>
</div>
<h3> div变成弹性盒子模型 div子元素平分</h3>
<div style="background-color: #909baf;height: 200px;display: flex">
    <div style="height: 40px;width: 40px;flex-grow: 1;line-height: 40px;text-align: center;background-color: #00F7DE;color: #FFF;">1</div>
    <div style="height: 40px;width: 40px;flex-grow: 1;line-height: 40px;text-align: center;background-color: #6fe862;color: #FFF;" >2</div>
    <div style="height: 40px;width: 40px;flex-grow: 1;line-height: 40px;text-align: center;background-color: #d1a1ea;color: #FFF;">3</div>
    <div style="height: 40px;width: 40px;flex-grow: 1;line-height: 40px;text-align: center;background-color: #86a1e7;color: #FFF;">4</div>
</div>

</body>
</html>
