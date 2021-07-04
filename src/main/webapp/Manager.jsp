<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if (session.getAttribute("logined") == null) {
        request.setAttribute("message", "非法访问");
        request.getRequestDispatcher("LoginAuth.jsp").forward(request, response);
    }
%>

<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
