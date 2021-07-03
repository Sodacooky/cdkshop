<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Electricity CDK商城</title>
    <!-- JQuery, Bootstrap-->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"
          rel="stylesheet">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- 首页所用样式表 -->
    <link href="css/index_page.css" rel="stylesheet">
</head>

<!-- JSP Parameter -->
<%@ page import="java.util.*" %>
<%@ page import="com.cdkshop.entity.*" %>
<%
    int page_amount = 0;
    if (request.getAttribute("page_amount") != null) {
        page_amount = (Integer) request.getAttribute("page_amount");
    }
    int now_page = 0;
    if (request.getAttribute("now_page") != null) {
        now_page = (Integer) request.getAttribute("now_page");
    }
    String message_title = "欢迎来到Electricity！";
    if (request.getAttribute("message_title") != null) {
        message_title = (String) request.getAttribute("message_title");
    }
    String message_content = "在这里你可以买到超低价的游戏激活CDK！看看下面这些最新上架的游戏吧！";
    if (request.getAttribute("message_content") != null) {
        message_content = (String) request.getAttribute("now_page");
    }
    String now_query = "%";
    if (request.getAttribute("now_query") != null) {
        now_query = (String) request.getAttribute("now_query");
    }
    List<Game> list_game = null;
    if (request.getAttribute("list_game") != null) {
        list_game = (List<Game>) request.getAttribute("list_game");
    }
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
                <li><a href="#">首页</a></li>
                <li><a href="#">我的购物车</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" role="button"
                       aria-haspopup="true"
                       aria-expanded="false">分类<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <!--后序加入游戏分类-->
                        <li><a href="CategoryPage/category=射击&page=1">射击</a></li>
                        <li><a href="CategoryPage/category=射击&page=1"></a></li>
                        <li><a href="CategoryPage/category=射击&page=1"></a></li>
                    </ul>
                </li>
            </ul>
            <!--查询Servlet-->
            <form class="navbar-form navbar-right">
                <div class="form-group">
                    <input type="text" name="category_search" placeholder="在这里输入要搜索的内容"
                           class="form-control">
                </div>
                <button type="submit" class="btn btn-success">搜索</button>
            </form>
        </div>
    </div>
</nav>


<div style="height: 64px"></div>

<div class="container">

    <!-- Message From JSP -->
    <div class="jumbotron">
        <h2>
            <%= message_title %>
        </h2>
        <p>
            <%= message_content %>
        </p>
    </div>


    <!-- Game List From JSP -->
    <div class="row">
        <%
            for (Game g : list_game) {
        %>
        <div class="col-md-3">
            <div class="thumbnail">
                <img src="img/<%= g.strPicturePath %>" alt="" style="height: 142px">
                <div class="caption">
                    <h3><%= g.strShortName %>
                    </h3>
                    <p style="margin: 0;">
                        <span style="color:orange;font-size:24px;vertical-align: middle;">￥<%= g.nPrice %></span>
                        <span class="label label-default">库存: <%= g.nAmount %></span>
                    <form>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">购买</span>
                                <input type="number" class="form-control" name="amount" value="1"
                                       aria-describedby="basic-addon2">
                                <input type="hidden" name="id" value="<%= g.strId %>">
                                <span class="input-group-addon" id="basic-addon2">份</span>
                            </div>
                        </div>
                        <div>
                            <button type="submit" class="btn btn-default">加入购物车</button>
                        </div>
                    </form>
                    </p>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div><!-- end row -->

    <!-- Page Navi From JSP -->
    <nav aria-label="...">
        <ul class="pager">
            <%
                if (now_page > 1) {
            %>
            <li class="previous"><a href="CategoryPage?category=<%=now_query%>&page=<%=now_page-1%>"><span
                    aria-hidden="true">&larr;</span>
                上一页</a></li>
            <% } else { %>
            <li class="previous disabled"><a href="#"><span aria-hidden="true">&larr;</span> 上一页</a></li>
            <% } %>

            <% if (now_page + 1 > page_amount) { %>
            <li class="next"><a href="CategoryPage?category=<%=now_query%>&page=<%=now_page+1%>"> 下一页<span
                    aria-hidden="true">&rarr;</span></a></li>
            <% } else { %>
            <li class="next disabled"><a href="#"> 下一页<span aria-hidden="true">&rarr;</span></a></li>
            <% } %>
        </ul>
    </nav>

</div><!-- end container -->


</body>

</html>
