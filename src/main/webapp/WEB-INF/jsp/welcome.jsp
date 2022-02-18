<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入bootstrap -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!-- 引入JQuery  bootstrap.js-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style type="text/css">
        body{
            background: url(${pageContext.request.contextPath}/images/background.jpg)no-repeat;
            background-size: 100% 100%;
        }
        #login-box {
            /*border:1px solid #F00;*/
            padding: 35px;
            border-radius:15px;
            background: #56666B;
            color: #fff;
        }
    </style>
    <script type="text/javascript">
        function functionshowAndHidden1() {
            let x =${user.job};
            const p1 = document.getElementById("p1");
            const p2 = document.getElementById("p2");
            if(x=="3"){
                p1.style.display='block';
                p2.style.display='none';
            } else{
                p1.style.display='none';
                p2.style.display='block';
            }
    　　}
    </script>
</head>
<body onload="functionshowAndHidden1()">
<div class="container" id="top">
    <div class="row" style="margin-top: 280px; ">
        <div class="col-md-4"></div>
        <div class="col-md-4" id="login-box">
            <form class="form-horizontal">
                <div class="form-group">
                    <div id="p1">
                        <a href="office.jsp"><h1 align="center" style="color:white">欢迎登陆</h1></a>
                    </div>
                    <div id="p2">
                        <a href="course/selectCourse"><h1 align="center" style="color:white">欢迎登陆</h1></a>
                    </div>
                    </if>
                </div>
            </form>
        </div>
        <div class="col-md-4"></div>
    </div>
</div>
</body>
</html>
