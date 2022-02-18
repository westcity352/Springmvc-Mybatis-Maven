<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>修改课程</title>
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

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="panel-body">
            <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/course/editCourse" id="editfrom" method="post">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">课程号</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="inputEmail3" name="id" placeholder="请输入学号" value="${id}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">课程名称</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputPassword3" name="name" placeholder="请输入课程名称" value="${name}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label" name="grade">授课老师编号</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputPassword4" name="teacher" placeholder="请输入老师编号" value="${teacher}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">上课时间</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="time" placeholder="请输入上课时间" value="${time}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">学分：</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" name="score" placeholder="请输入学分" value="${score}">
                    </div>
                </div>
                <div class="form-group" style="text-align: center">
                    <button class="btn btn-default" type="submit">提交</button>
                    <button class="btn btn-default" type="reset">重置</button>
                </div>
            </form>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        浙江树人大学信息科技学院@PPPP
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