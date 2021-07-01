<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Electricity CDK商城</title>
	<!-- JQuery, Bootstrap-->
	<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- 首页所用样式表 -->
	<link href="css/index_page.css" rel="stylesheet">
</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
					aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" alt="蒸汽平台精神续作——电气平台">Electricity</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="#">首页</a></li>
					<li><a href="购物车.html">我的购物车</a></li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">分类<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<!--后序加入游戏分类-->
							<li><a href="#">动作类</a></li>
							<li><a href="#">射击类</a></li>
							<li><a href="#">解谜类</a></li>
						</ul>
					</li>
				</ul>
				<!--查询Servlet-->
				<form class="navbar-form navbar-right">
					<div class="form-group">
						<input type="text" name="category_search" placeholder="在这里输入要搜索的内容" class="form-control">
					</div>
					<button type="submit" class="btn btn-success">搜索</button>
				</form>
			</div>
		</div>
	</nav>
	
	<div class="container">
        <div class="jumbotron">
            <h2>欢迎来到Electricity！</h2>
            <p>在这里你可以买到超低价的游戏激活CDK！看看下面这些最新上架的游戏吧！</p>
        </div>
        <div class="row">
            <!-- FOR JSP -->
			<% for(int i=0;i!=8;i++){ %>
            <div class="col-md-3">
                <div class="thumbnail">
                    <img src="img/pic.jpg">
                    <div class="caption">
                        <h3>东方虹龙洞</h3>
                        <p style="margin: 0px;">
                            <span class="price_text">￥50</span>
                        </p>
                        <form>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">购买</span>
                                    <input type="number" class="form-control" name="amount" value="1"
                                        aria-describedby="basic-addon2">
                                    <input type="hidden" name="id" value="0001">
                                    <span class="input-group-addon" id="basic-addon2">份</span>
                                </div>
                            </div>
                            <div><button type="submit" class="btn btn-default">加入购物车</button></div>
                        </form>
                    </div>
                </div>
            </div>
			<% } %>

</body>

</html>