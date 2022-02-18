<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>文件管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入bootstrap -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!-- 引入JQuery  bootstrap.js-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style>

    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <!-- 目录 -->
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
                <li class="layui-nav-item"><a href="course/gotoFile">最新实习消息</a></li>
                <li class="layui-nav-item"><a href="loginOut">退出系统</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->

        <button type="button" class="layui-btn layui-btn-normal" style="margin: 20px">实习文件上传</button>
        <form action="file/upload" method="post" enctype="multipart/form-data">
            <a href="javascript:;" class="a-upload"
            style=".a-upload {
    padding: 4px 10px;
    height: 20px;
    line-height: 20px;
    position: relative;
    cursor: pointer;
    color: #888;
    background: #fafafa;
    border: 1px solid #ddd;
    border-radius: 4px;
    overflow: hidden;
    display: inline-block;
    *display: inline;
    *zoom: 1
}

.a-upload  input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
    filter: alpha(opacity=0);
    cursor: pointer
}

.a-upload:hover {
    color: #444;
    background: #eee;
    border-color: #ccc;
    text-decoration: none
}"><input type="file" name="upload" style="margin: 20px"></a>
            <input type="submit" value="点击此处开始上传" style="margin: 20px">
        </form>
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend>分界线</legend>
        </fieldset>
        <button type="button" class="layui-btn layui-btn-normal" style="margin: 20px">实习文件下载</button>
        <form action="file/download" method="post" enctype="multipart/form-data">
            <input type="submit" value="点击此处开始下载" style="margin: 20px">
        </form>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        浙江树人大学信息科技学院@PPPP
    </div>
</div>
<script src="layui/layui.js"></script>
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
//选完文件后不自动上传
        upload.render({
            elem: '#test8'
            ,url: 'D:/IDEA 2020/Final/final/target/sy11/uploads' //改成您自己的上传接口
            ,auto: false
            //,multiple: true
            ,bindAction: '#test9'
            ,done: function(res){
                layer.msg('上传成功');
                console.log(res)
            }
        });
        });
</script>
</body>
</html>