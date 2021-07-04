<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    //login 合法检验
    if (session.getAttribute("logined") == null) {
        request.setAttribute("message", "非法访问");
        request.getParameterMap().clear();
        request.getRequestDispatcher("ManagerLogin.jsp").forward(request, response);
    }
%>

<%
    String message = "您已进入后台";
    if (request.getAttribute("message") != null) {
        message = (String) request.getAttribute("message");
    }
    boolean success = true;
    if (request.getAttribute("success") != null) {
        success = (boolean) request.getAttribute("success");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Electricity 后台</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>


<body>
<div style="height: 32px"></div>


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

    <div class="jumbotron">
        <h2>
            Electricity 管理后台
        </h2>
        <form action="ManagerLogout" method="get">
            <button class="btn btn-default" type="submit">退出登录</button>
        </form>
    </div>

    <h2>添加/修改游戏基本信息</h2>
    <form class="form-horizontal" action="GameInfoAddModify" method="post">
        <div class="form-group">
            <label for="game_info_id" class="col-sm-2 control-label">游戏ID(四位字符):</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="game_info_id" placeholder="0000" name="id" required>
            </div>
        </div>
        <div class="form-group">
            <label for="game_info_name" class="col-sm-2 control-label">游戏名称:</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="game_info_name" placeholder="甲乙丙丁" name="name"
                       required>
            </div>
        </div>
        <div class="form-group">
            <label for="game_info_category" class="col-sm-2 control-label">游戏分类(建议未分类):</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="game_info_category" placeholder="未分类"
                       name="category"
                       required>
            </div>
        </div>
        <div class="form-group">
            <label for="game_info_price" class="col-sm-2 control-label">游戏价格(整数):</label>
            <div class="col-sm-6">
                <input type="number" class="form-control" id="game_info_price" placeholder="100" name="price"
                       required>
            </div>
        </div>
        <div class="form-group">
            <label for="game_info_pic_path" class="col-sm-2 control-label">展示图片文件名(/img/下):</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="game_info_pic_path" placeholder="picture.jpg"
                       name="pic_path"
                       required>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-6">
                <button type="submit" class="btn btn-default">提交</button>
            </div>
        </div>
    </form>
    <hr>

    <h2>上传游戏图片</h2>
    <form class="form-inline" action="GamePictureUpload" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <input type="file" name="file" required>
            <p class="help-block">文件名请与上面提交的“展示图片文件名”相同</p>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-6">
                <button type="submit" class="btn btn-default">上传</button>
            </div>
        </div>
    </form>
    <hr>

    <h2>删除游戏</h2>
    <form class="form-horizontal" action="GameDelete" method="post">
        <div class="form-group">
            <label for="game_remove_id" class="col-sm-2 control-label">游戏ID(四位字符):</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="game_remove_id" placeholder="0000" name="id"
                       required>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-6">
                <button type="submit" class="btn btn-default">施行</button>
            </div>
        </div>
    </form>
    <hr>

    <h2>添加游戏CDK</h2>
    <form class="form-horizontal" action="KeyAdd" method="post">
        <div class="form-group">
            <label for="game_cdk_id" class="col-sm-2 control-label">游戏ID(四位字符):</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="game_cdk_id" placeholder="0000" name="id" required>
            </div>
        </div>
        <div class="form-group">
            <label for="game_cdk" class="col-sm-2 control-label">CDK:</label>
            <div class="col-sm-6">
                <textarea class="form-control" id="game_cdk" name="cdk_list" rows="4"></textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-6">
                <button type="submit" class="btn btn-default">提交</button>
            </div>
        </div>
    </form>
    <hr>

    <h2>(演示)为所有游戏生成10个随机CDK</h2>
    <form class="form-horizontal" action="KeyGenerate" method="get">
        <div class="form-group">
            <div class="col-sm-8">
                <button type="submit" class="btn btn-default btn-block">生成</button>
            </div>
        </div>
    </form>
    <hr>

    <p style="text-align: center"><a href="index.jsp">返回首页</a></p>

</div>

<div style="height: 32px"></div>

</body>

</html>
