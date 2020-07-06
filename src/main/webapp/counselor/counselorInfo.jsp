<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<jsp:include page="counselorLeft.jsp" />
<div class="container">
		<div class="row">
			<div class="col-md-12">
			<div class="row"><div class="col-md-12" >
			<h5>个人信息管理</h5>
						<div class="margin:0 15px"><table  style="overflow:scroll;" class="table table-striped table-hover animated fadeIn">

				<thead>
					<tr>
						<th>/</th>
						<th>信息</th>
						<th>介绍</th>
					</tr>
				</thead>
				<tr>
					<td>辅导员账号</td>
					<td>${requestScope.counselor.username}</td>
					<td>辅导员信息唯一标示</td>
				</tr>

				<tr>
					<td>姓名</td>
					<td>${requestScope.counselor.name }</td>
					<td>不可修改</td>
				</tr>

				<tr>
					<td>性别</td>
					<td>
						<c:if test="${requestScope.counselor.gender == 1}">
							男
						</c:if>
						<c:if test="${requestScope.counselor.gender == 0}">
							女
						</c:if>
					</td>
					<td>不可修改</td>
				</tr>

				<tr>
					<td>密码</td>
					<td>${requestScope.counselor.password }</td>
					<td><a class="btn btn-default" href="/StudentInfo/CounselorHandler/changePassword">修改 </a></td>
				</tr>

				<tr>
					<td>年龄</td>
					<td>${requestScope.counselor.age }</td>
					<td>不可修改</td>
				</tr>

				<tr>
					<td>电话号码</td>
					<td>${requestScope.counselor.phone }</td>
					<td>不可修改</td>
				</tr>

				<tr>
					<td>邮箱</td>
					<td>${requestScope.counselor.email }</td>
					<td>不可修改</td>
				</tr>

				<tr>
					<td>家庭住址</td>
					<td>${requestScope.counselor.address }</td>
					<td>不可修改</td>
				</tr>


			</table></div></div></div>
			</div></div></div>
	
<script src="/StudentInfo/utils/scripts/bganimation.js"></script>
</body>
</html>