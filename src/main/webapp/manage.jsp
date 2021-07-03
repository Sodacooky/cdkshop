<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理游戏</title>
</head>
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"
      rel="stylesheet">
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<body>

    <div class="jumbotron">
        <h2>欢迎来到Electricity网站后台！</h2>
        <p>请输入游戏信息</p>
    </div>
<form role="form">
    <div class="form-group">
        <label>序号</label>
        <input type="text" class="form-control" name="xu"
               placeholder="请输入序号">
    </div>
    <div class="form-group">
        <label>名称</label>
        <input type="text" class="form-control" name="name"
               placeholder="请输入名称">
    </div>
    <div class="form-group">
        <label>价格</label>
        <input type="text" class="form-control" name="price"
               placeholder="请输入价格">
    </div>
    <div class="form-group">
        <label>分类</label>
        <input type="text" class="form-control" name="category"
               placeholder="请输入分类">
    </div>
    <div class="form-group">
        <label for="inputfile">提交图片文件</label>
        <input type="file" id="inputfile">
        <p class="help-block"> </p>
    </div>
    <button type="submit" class="btn btn-default">提交</button>
    <button class="btn btn-default">再次提交</button>
</form>
    <form role="form">
    <div class="form-group">
        <label>提交CDK</label>
        <textarea class="form-control" rows="3"  value=？？name="cdk"  placeholder="请输入CDK"></textarea>
    </div>
    </form>

</body>
</html>
