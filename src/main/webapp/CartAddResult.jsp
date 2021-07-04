<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Electricity CDK商城 购买结果</title>
    <!-- JQuery, Bootstrap-->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<!-- JSP Parameter -->
<%
    boolean success = false;
    if (request.getAttribute("success") != null) {
        success = (boolean) request.getAttribute("success");
    }
    String message = "未知错误";
    if (request.getAttribute("message") != null) {
        message = (String) request.getAttribute("message");
    }
%>

<body>

<div style="height: 256px"></div>

<div class="container">

    <% if (success) { %>
    <div class="alert alert-success" role="alert">
        <%=message%>
    </div>
    <% } else { %>
    <div class="alert alert-danger" role="alert">
        <%=message%>
    </div>
    <% } %>

    <button type="button" class="btn btn-success btn-block" onclick="window.history.back()">点击返回之前页面</button>
    <button type="button" class="btn btn-success btn-block" onclick="window.location.href='CartPageServlet'">点击打开购物车
    </button>
</div>

</body>
</html>
