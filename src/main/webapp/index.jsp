<%@ page language="java" pageEncoding="utf-8" %>
<%
    RequestDispatcher qd = request.getRequestDispatcher("IndexPageServlet");
    qd.forward(request, response);
%>
