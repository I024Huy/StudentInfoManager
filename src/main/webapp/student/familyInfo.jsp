<%--
  Created by IntelliJ IDEA.
  User: EDAT丶ICiT
  Date: 2020/6/18
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="shortcut icon" href="/StudentInfo/utils/image/favicon.ico" type="image/x-icon"/>
    <meta charset="UTF-8">
    <title>学生信息管理系统</title>

    <!-- 标题图标、CSS、js、jQ
    <link href="/online/image/favicon.ico" rel="shortcut icon">
    <link rel="stylesheet" type="text/css" href="/online/css/main.css">
    <script src="/online/js/fun.js" type="text/javascript"></script>-->
    <script type="text/javascript" src="/StudentInfo/utils/js/jquery-3.3.1.min.js"></script>
    <!-- Loading Bootstrap -->
    <link href="/StudentInfo/utils/css/vendor/bootstrap.min.css" rel="stylesheet">
    <!-- Loading Flat UI Pro -->
    <link href="/StudentInfo/utils/css/flat-ui.css" rel="stylesheet">
    <!-- Loading Flat UI JS -->
    <script type="text/javascript" src="/StudentInfo/utils/scripts/flat-ui.min.js"></script>

    <script type='text/javascript' src='/StudentInfo/utils/scripts/particles.js'></script>
    <link href="/StudentInfo/utils/css/animate.css" rel="stylesheet">
</head>

<body>
<div id="particles-js">
    <canvas class="particles-js-canvas-el" width="1322" height="774" style="width: 100%; height: 100%;"></canvas>
</div>
<jsp:include page="studentLeft.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-12">
                    <h5>家庭情况信息</h5>
                    <div class="margin:0 15px">
                        <table style="overflow:scroll;" class="table table-striped table-hover animated fadeIn">

                            <thead>
                            <tr>
                                <th>/</th>
                                <th>信息</th>
                            </tr>
                            </thead>
                            <tr>
                                <td>监护人姓名</td>
                                <td>${requestScope.family.fname}</td>
                            </tr>

                            <tr>
                                <td>家庭住址</td>
                                <td>${requestScope.family.address }</td>
                            </tr>

                            <tr>
                                <td>监护人性别</td>
                                <td>
                                    <c:if test="${requestScope.family.fgender == 1}">
                                        男
                                    </c:if>
                                    <c:if test="${requestScope.family.fgender == 0}">
                                        女
                                    </c:if>
                                </td>
                            </tr>

                            <tr>
                                <td>监护人年龄</td>
                                <td>${requestScope.family.fage }</td>
                            </tr>

                            <tr>
                                <td>监护人电话</td>
                                <td>${requestScope.family.fphone }</td>
                                </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
