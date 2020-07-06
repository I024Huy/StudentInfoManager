<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"><link rel="shortcut icon" href="/StudentInfo/utils/image/favicon.ico" type="image/x-icon" />
<meta charset="UTF-8">
<title>学生信息管理系统</title>

<!-- 标题图标、CSS、js、jQ
<link href="/online/image/favicon.ico" rel="shortcut icon">
<link rel="stylesheet" type="text/css" href="/online/css/main.css">
<script src="/online/js/fun.js" type="text/javascript"></script> -->
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
			<div class="row"><div class="col-md-12" >
			<h5>管理个人信息</h5>
						<div class="margin:0 15px"><table  style="overflow:scroll;" class="table table-striped table-hover animated fadeIn">

				<thead>
					<tr>
						<th>/</th>
						<th>信息</th>
						<th>介绍</th>
					</tr>
				</thead>
				<tr>
					<td>学号</td>
					<td>${requestScope.student.username}</td>
					<td>学生信息唯一标示</td>
				</tr>

				<tr>
					<td>姓名</td>
					<td>${requestScope.student.name }</td>
					<td>不可修改</td>
				</tr>

				<tr>
					<td>身份证</td>
					<td>${requestScope.student.IDcard }</td>
					<td>不可修改</td>
				</tr>

				<tr>
					<td>性别</td>
					<td>
						<c:if test="${requestScope.student.gender == 1}">
							男
						</c:if>
						<c:if test="${requestScope.student.gender == 0}">
							女
						</c:if>
					</td>
					<td>不可修改</td>
				</tr>

				<tr>
					<td>密码</td>
					<td>${requestScope.student.password }</td>
					<td><a class="btn btn-default" href="/StudentInfo/StudentHandler/changePassword">修改 </a></td>
				</tr>

				<tr>
					<td>年龄</td>
					<td>${requestScope.student.age }</td>
					<td>不可修改</td>
				</tr>

				<tr>
					<td>电话号码</td>
					<td>${requestScope.student.phone }</td>
					<td>不可修改</td>
				</tr>

				<tr>
					<td>邮箱</td>
					<td>${requestScope.student.email }</td>
					<td>不可修改</td>
				</tr>

				<tr>
					<td>宿舍</td>
					<td>${requestScope.student.room }</td>
					<td>不可修改</td>
				</tr>

				<tr>
					<td>所在年级</td>
					<td>${requestScope.student.grade }</td>
					<td>不可修改</td>
				</tr>

				<tr>
					<td>班级</td>
					<td>${requestScope.student.myclass }</td>
					<td>不可修改</td>
				</tr>


				<tr>
					<td>所在专业</td>
					<td>${requestScope.student.profession.name }</td>
					<td>不可修改</td>
				</tr>
				<tr>
					<td>所在学院</td>
					<td>${requestScope.student.college.name }</td>
					<td>不可修改</td>
				</tr>


			</table></div></div></div>
			</div></div></div>
<script src="/StudentInfo/utils/scripts/bganimation.js"></script></body>
</html>