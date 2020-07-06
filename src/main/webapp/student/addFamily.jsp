<%--
  Created by IntelliJ IDEA.
  User: EDAT丶ICiT
  Date: 2020/6/19
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"><link rel="shortcut icon" href="/StudentInfo/utils/image/favicon.ico" type="image/x-icon" />
    <meta charset="UTF-8">
    <title>学生信息管理系统</title>

    <script type="text/javascript" src="/StudentInfo/utils/js/jquery-3.3.1.min.js"></script>
    <!-- Loading Bootstrap -->
    <link href="/StudentInfo/utils/css/vendor/bootstrap.min.css" rel="stylesheet">
    <!-- Loading Flat UI Pro -->
    <link href="/StudentInfo/utils/css/flat-ui.css" rel="stylesheet">
    <!-- Loading Flat UI JS -->
    <script type="text/javascript" src="/StudentInfo/utils/scripts/flat-ui.min.js"></script>

    <script type='text/javascript' src='/StudentInfo/utils/scripts/particles.js'></script><link href="/StudentInfo/utils/css/animate.css" rel="stylesheet"></head>

<body><div id="particles-js"><canvas class="particles-js-canvas-el" width="1322" height="774" style="width: 100%; height: 100%;"></canvas></div>
<jsp:include page="studentLeft.jsp" />
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h5>查看家庭信息</h5>
            <p class="alert alert-info">提示：您还没有填入家庭情况信息，请及时填写。且保存过后不能再修改！</p>

            <div class="row">
                <div class="col-md-12" >
                    <div class="margin:0 15px" style="font-size: medium">
                        <form id="form1" type="post" action="${pageContext.request.contextPath}/StudentHandler/addFamily">
                            <input type="hidden" name="sid" value="${sessionScope.student.sid}">
                            <input type="hidden" name="fid" value="${fid}">

                            <div class="row">
                                <div class="col-md-3">监护人姓名:</div>
                                <div class="col-md-3"><input name="fname" type="text" class="form-control"/></div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">家庭住址:</div>
                                <div class="col-md-3"><input name="address" type="text" class="form-control"/></div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">监护人性别:</div>
                                <div class="col-md-3">
                                    <input type="radio" name="fgender" class="gender" value="1">男
                                    <input type="radio" name="fgender" class="gender" value="0">女
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">监护人年龄:</div>
                                <div class="col-md-3"><input name="fage" type="text" class="form-control"/></div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">监护人电话:</div>
                                <div class="col-md-3"><input name="fphone" type="text" class="form-control"/></div>
                            </div>
                            <div class="row">
                                <input id="btn" class="btn btn-primary btn-wide login-btn" type="button" value="保存">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $("#btn").click(function () {
        const flag = confirm("家庭信息只能填写一次，您确认保存吗？");
        if (flag){
            $("#form1").submit();
        }
    })
</script>
</body>
</html>
