<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>top</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
</head>
<body>
<div class="layui-header">
    <div class="layui-logo layui-hide-xs layui-bg-black">在线教育实训平台</div>
    <!-- 头部区域（可配合layui 已有的水平导航） -->
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item layui-hide layui-show-md-inline-block">
            <a href="javascript:;">
                <img src="${pageContext.request.contextPath}/images/touxiang.jpg" class="layui-nav-img">${user.name}
            </a>
        </li>
        <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
            <a href="javascript:;">
                <i class="layui-icon layui-icon-more-vertical"></i>
            </a>
        </li>
    </ul>
</div>

<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree" lay-filter="test">
            <li class="layui-nav-item layui-nav-itemed">
                <a class="">实训课程管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="course/selectCourse">课程显示</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item layui-nav-itemed">
                <a class="">实训学生管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="course/testFindStudent">显示选课学生</a></dd>
                    <dd><a href="student/testFindCourse">显示学生选课</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="course/gotoFile">最新实习消息</a></li>
            <li class="layui-nav-item"><a href="loginOut">退出系统</a></li>
        </ul>
    </div>
</div>

<script src="../../layui/layui.js"></script>
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
