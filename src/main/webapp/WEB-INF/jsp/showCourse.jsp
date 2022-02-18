<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%
    String path = request.getContextPath();
// 获得项目完全路径（假设你的项目叫MyApp，那么获得到的地址就是 http://localhost:8080/MyApp/）:
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
        <base href="<%=basePath%>">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>展示课程</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- 引入bootstrap -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <!-- 引入JQuery  bootstrap.js-->
        <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function functionshowAndHidden() {
            let x =${user.job};
            const p1= document.getElementsByClassName("s1");
            for(let i=0;i<p1.length;i++){
                (function (p1) {
                    const p2 = document.getElementById("p2");
                    const p3 = document.getElementById("p3");
                    const p4= document.getElementsByClassName("s2");
                    for(let i=0;i<p4.length;i++) {
                        (function (p4) {
                            if (x == "1") {
                                p1.style.display = 'none';
                                p2.style.display = 'none';
                                p3.style.display = 'none';
                                p4.style.display = 'none';
                            }
                            if (x == "2") {
                                p4.style.display = 'none';
                            }
                        })(p4[i]);
                    }
                })(p1[i]);
            }
        }
    </script>
    <style>
        .s1,.s2{
            width: 50%;
            float: left;
        }

    </style>
</head>
<body  onload="functionshowAndHidden()">
<div class="layui-layout layui-layout-admin">
    <!-- 目录 -->
    <jsp:include page="top.jsp"></jsp:include>
        <%--主体区域--%>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="row">
                        <h1 class="col-md-5">课程管理</h1>
                        <form class="bs-example bs-example-form col-md-5" role="form" style="margin: 20px 0 10px 0;"
                              action="${pageContext.request.contextPath}/selectCourse" id="form1" method="post">
                        </form>
                        <div id="p3">
                            <a href="course/gotoAdd">
                                <button class="btn btn-default col-md-2" style="margin-top: 20px" >添加课程信息</button>
                            </a>
                        </div>
                    </div>
                </div>
                        <table class="table table-bordered">
                            <tr>
                                <th>id</th>
                                <th>name</th>
                                <th>teacher</th>
                                <th>time</th>
                                <th>score</th>
                                <th>
                                    <div id="p2"> operation </div>
                                </th>
                            </tr>
                            <c:forEach  items="${courseList}" var="course">
                                <tr>
                                    <td>${course.id}</td>
                                    <td>${course.name}</td>
                                    <td>${course.teacher}</td>
                                    <td>${course.time}</td>
                                    <td>${course.score}</td>
                                    <td>
                                        <div id="p1" class="s1">
                                            <a href="course/gotoEdit?id=${course.id}">
                                                <button class="btn btn-default btn-xs btn-info"> 修改</button>
                                            </a>
                                        </div>
                                        <div id="p4" class="s2">
                                            <a href="course/deleteCourse?id=${course.id}">
                                                <button class="btn btn-default btn-xs btn-danger btn-primary">删除</button>
                                            </a>
                                        </div>
                                    </td>

                                </tr>
                            </c:forEach>
                            <tr>
                        </table>
            </div>
    <!-- 底部区域 -->
    <div class="layui-footer">
        浙江树人大学信息科技学院@PPPP
    </div>
</div>
    </div>
<script src="../../layui/layui.js" charset="utf-8"></script>
<script>
    //JS
    layui.use(['element', 'layer', 'util'], function(){
        var element = layui.element
            ,layer = layui.layer
            ,util = layui.util
            ,$ = layui.$;

        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function(othis){
                layer.msg('展开左侧菜单的操作', {icon: 0});
            }
            ,menuRight: function(){
                layer.open({
                    type: 1
                    ,content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
                    ,area: ['260px', '100%']
                    ,offset: 'rt' //右上角
                    ,anim: 5
                    ,shadeClose: true
                });
            }
        });
    });
</script>
</body>
</html>