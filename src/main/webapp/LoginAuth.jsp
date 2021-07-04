<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if (session.getAttribute("logined") != null) {
        request.getRequestDispatcher("Manager.jsp").forward(request, response);
    }

    String message = null;
    if (request.getAttribute("message") != null) {
        message = (String) request.getAttribute("message");
    }
%>

<html>
<head>
    <title>Electricity 后台</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>

<div style="height: 32px"></div>

<div class="container">

        <% if (message != null) { %>
    <div class="alert alert-danger" role="alert">
        <%=message%>
    </div>
        <% } %>

    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <form class="form-signin" action="ManagerLogin" method="post">
                <h2 class="form-signin-heading">请进行身份验证</h2>
                <input type="text" class="form-control" placeholder="用户名" name="username" value="admin" required=""
                       autofocus="">
                <input type="password" class="form-control" placeholder="密码" name="password" required="">
                <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
            </form>
        </div>
    </div>

</body>
</html>


