<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Electricity CDK商城 分类</title>
    <!-- JQuery, Bootstrap-->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"
          rel="stylesheet">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- 首页所用样式表 -->
    <link href="css/index_page.css" rel="stylesheet">
</head>

<body>
<%@  include file="header.jsp" %>>

<div class="container">

    <div class="jumbotron">
        <h2>欢迎来到Electricity！</h2>
        <p>下面可按类型或主题浏览</p>
        <a href="#game01">动作类</a>
        <a href="#game02">解谜类</a>
    </div>

    <div class="jumbotron">
    <h1 id="game01" style="font-size: 30px ">动作类</h1>
    </div>
    <div class="row">

        <%@ page import="java.util.*,com.cdkshop.db.*,com.cdkshop.entity.*,java.sql.*" %>
        <%
            Connection con = (Connection) application.getAttribute("connect");
            List<Game> list_game = IndexPageGameFetcher.fetch(con);
            for (Game g : list_game) {
        %>
        <div class="col-md-3">
            <div class="thumbnail">
                <img src="img/<%= g.strPicturePath %>" alt="" style="height: 142px">
                <div class="caption">
                    <h3><%= g.strShortName %>
                    </h3>
                    <p style="margin: 0;">
                        <span class="price_text">￥<%= g.nPrice %></span>
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
        <%}%>
    </div>

<div class="jumbotron">
    <h1 id="game02" style="font-size: 30px ">解谜类</h1>
</div>

</body>

</html>

