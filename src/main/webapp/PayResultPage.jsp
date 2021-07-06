<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>支付结束</title>
    <!-- JQuery, Bootstrap-->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<!-- JSP Parameter -->
<%@ page import="java.util.*" %>
<%@ page import="java.nio.file.attribute.AclEntryType" %>
<%
    Map<String, List<String>> cdk_list = null;
    if (request.getAttribute("cdk_list") != null) {
        cdk_list = (Map<String, List<String>>) request.getAttribute("cdk_list");
    }
    String message = "null";
    if (request.getAttribute("message") != null) {
        message = (String) request.getAttribute("message");
    }
    boolean success = false;
    if (request.getAttribute("success") != null) {
        success = (boolean) request.getAttribute("success");
    }
%>

<body>

<div style="height: 32px"></div>

<div class="container">
    <div class="jumbotron">
        <h2>
            <%=message%>
        </h2>
        <%
            if (success) {
        %>
        <p>
            请注意立刻复制保存您的CDK。
        </p>
        <button class="btn btn-danger" onclick="window.location.href='index.jsp'">返回首页</button>
        <% } else { %>
        </h2>
        <p>
            请刷新网站后重试。
        </p>
        <button class="btn btn-default" onclick="window.location.href='index.jsp'">返回首页</button>
        <% } %>
    </div>

    <%
        if (success) {
            for (Map.Entry<String, List<String>> entry : cdk_list.entrySet()) {
    %>
    <div style="height: 32px"></div>
    <table class="table table-condensed">
        <thead>
        <tr>
            <th>
                <%=entry.getKey()%>
            </th>
        </tr>
        </thead>
        <tbody>
        <% for (String key : entry.getValue()) { %>
        <tr>
            <td>
                <%=key%>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <%
            }//end for map
        }//end if success
    %>

</div>

</body>
</html>
