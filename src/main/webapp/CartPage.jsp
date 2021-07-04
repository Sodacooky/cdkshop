<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Electricity CDK商城 购物车</title>
    <!-- JQuery, Bootstrap-->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<!-- JSP Parameter -->
<%@ page import="java.util.*" %>
<%@ page import="com.cdkshop.entity.*" %>
<%
    Map<Game, Integer> game_list = null;
    if (request.getAttribute("game_list") != null) {
        game_list = (Map<Game, Integer>) request.getAttribute("game_list");
    }
    int sum_price = 0;
%>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">Electricity</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="index.jsp">首页</a></li>
                <li><a href="CartPageServlet">我的购物车</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" role="button"
                       aria-haspopup="true"
                       aria-expanded="false">分类<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <!--后序加入游戏分类-->
                        <li><a href="CategoryPageServlet?category=射击&page=1">射击</a></li>
                        <li><a href="CategoryPageServlet?category=竞速&page=1">竞速</a></li>
                        <li><a href="CategoryPageServlet?category=角色扮演&page=1">角色扮演</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="CategoryPageServlet?category=未分类&page=1">未分类</a></li>
                    </ul>
                </li>
            </ul>
            <!--查询Servlet-->
            <form class="navbar-form navbar-right" action="SearchPageServlet" method="get">
                <div class="form-group">
                    <input type="text" name="search" placeholder="在这里输入要搜索的内容"
                           class="form-control">
                </div>
                <button type="submit" class="btn btn-success">搜索</button>
            </form>
        </div>
    </div>
</nav>

<div style="height: 64px"></div>

<div class="container">
    <table class="table table-striped">
        <thead>
        <tr>
            <th>游戏ID</th>
            <th>游戏名称</th>
            <th>数量</th>
            <th>小计</th>
        </tr>
        </thead>

        <tbody>
        <!-- JSP Print Row -->
        <% if (game_list != null) {
            for (Map.Entry<Game, Integer> pair : game_list.entrySet()) {
                sum_price += pair.getValue() * pair.getKey().nPrice;
        %>
        <tr>
            <th scope="row">
                <%=pair.getKey().strId%>
            </th>
            <td>
                <%=pair.getKey().strName%>
            </td>
            <td>
                <%=pair.getValue()%>
            </td>
            <td><span style="color: orange">￥<%=pair.getKey().nPrice * pair.getValue()%></span></td>
            <td class="pull-right">
                <form class="form-inline" action="CartRemoveServlet" method="post">
                    <input type="hidden" name="id" value="<%=pair.getKey().strId%>">
                    <button type="submit" class="btn btn-danger">删除</button>
                </form>
            </td>
        </tr>
        <% }
        } %>
        </tbody>

    </table>

    <div style="height: 32px"></div>

    <form action="BuyServlet" method="post">
        <p style="font-size: 24px">总价:<span style="color: orange">￥<%=sum_price%></span></p>
        <button class="btn btn-warning" type="submit">支付</button>
        <p class="help-block">支付成功后请立刻复制您的CDK</p>
        <p class="help-block">点击支付按钮即表示您同意承担购买后CDK遗失的责任</p>
    </form>

</div>

</body>
</html>

