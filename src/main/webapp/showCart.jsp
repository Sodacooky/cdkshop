<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>您的购物车</title>
</head>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="css/index_page.css" rel="stylesheet">
<body>
    <%@include file="header.jsp"%>
    <div class="page-header">
         <br>
            <h1> <label style="font-size: 60px;">您的购物车</label></h1>
    </div>
    <div class="row">
        <div style="background-color: rgba(18,74,158,0.1);margin-left: 0;margin-right: 0;margin-top: 16px;">
            <div class="row">
                <div class="good">
                    <div class="col-lg-6">
                        <img src="img/gbf.jpg" width="180px">
                        <a>gbf</a>
                        <label style="font-size: 16px;">数量 1</label>
                    </div>
                    <div class="col-lg-6">
                        <form class="form-inline" sytle="margin: centre">
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="" aria-describedby="helpId">
                                <button type="submit" class="btn btn-primary">更改</button>
                                <label style="font-size: 16px;">小计 50 </label>
                            </div>
                        </form>
<%--                        <button type="button" class="btn btn-primary" class="delete">移除</button>--%>
                    </div>
                    <span class="editdelete">移除</span>           </div>
            </div>
        </div>
        <%--实现移除--%>
        <script>
            $(".editdelete").on("click", function () {
                $(this).parent().remove();
            });
        </script>

</body>
</html>
