<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台登录</title>
</head>
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<body>

<div class="jumbotron">
    <h2>欢迎来到Electricity网站后台！</h2>
    <p>请登录</p>
</div>
<form class="form-horizontal" role="form" method="post" action="HoutaiServlet" margin="centre">
    <div class="form-group" class="col-lg-3">
        <label for="firstname" class="col-sm-2 control-label">用户名</label>
        <div class="col-lg-5">
            <input type="text" class="form-control" id="firstname" name="username"
                   placeholder="请输入用户名">
        </div>
    </div>
    <div class="form-group" class="col-lg-3">
        <label for="lastname" class="col-lg-2 control-label">密码</label>
        <div class="col-lg-5">
            <input type="text" class="form-control" id="lastname" name="password"
                   placeholder="请输入密码">
        </div>
    </div>
    <div class="form-group">
        <div class="col-lg-offset-2 col-lg-10">
            <button type="submit" class="btn btn-default">登录</button>
        </div>
    </div>
</form>
</body>
</html>


