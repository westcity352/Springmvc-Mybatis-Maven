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
    <title>展示学生课程</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入bootstrap -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!-- 引入JQuery  bootstrap.js-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>

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
                        <h1 class="col-md-5">学生课程管理</h1>
                    </div>
                </div>
                <table class="table table-bordered">
                    <tr>
                        <th>id</th>
                        <th>name</th>
                        <th>sex</th>
                        <th>college</th>
                        <th>classes</th>
                        <th>courses</th>
                    </tr>
                    <c:forEach  items="${list}" var="student">
                        <tr>
                            <td>${student.id}</td>
                            <td>${student.name}</td>
                            <td>${student.sex}</td>
                            <td>${student.college}</td>
                            <td>${student.classes}</td>
                            <td>
                                <c:forEach  items="${student.getCourses()}" var="course">
                                ${course.getName()},
                                </c:forEach>
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