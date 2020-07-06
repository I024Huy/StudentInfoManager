<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="shortcut icon" href="/StudentInfo/utils/image/favicon.ico"
	type="image/x-icon" />
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
	<div class="container" style="max-width: 1500px">
		<div class="row">
			<div class="col-md-12">
				<h5>学生信息查询</h5>
				<form name="studentquery" action="/StudentInfo/CounselorHandler/keyQueryStudent/1" method="post">
					<input type="hidden" name="cid" value="${sessionScope.counselor.cid}">
					<div class="row">
						<div class="col-md-2"><strong>特殊查询条件<br></strong></div>
						<div class="col-md-2">
							<select name="key" class="form-control select select-primary select-block mbl" style="font-weight: 600">
								<option value="all">全部查询</option>
								<option value="username">学号</option>
								<option value="name">姓名</option>
								<option value="myclass">班级</option>
								<option value="grade">年级</option>
							</select>
						</div>
						<div class="col-md-4">
							<div class="form-group has-feedback">
								<input type="text" name="value"  placeholder="输入值" class="form-control"/>
							</div>
						</div>
						<div class="col-md-3 pos">
							<input type="submit" class="btn btn-primary" value="查询" />
						</div>
					</div>
				</form>

				<div class="row">
					<div class="col-md-12">
						<div class="margin:0 15px" style="overflow-x: scroll;">
							<table style="overflow-x: scroll;"
								class="table table-striped table-hover animated fadeIn">
								<tr>
									<th>学生学号</th>
									<th>学生姓名</th>
									<th>身份证号</th>
									<th>性别</th>
									<th>年龄</th>
									<th>所在班级</th>
									<th>所在年级</th>
									<th>电话号码</th>
									<th>寝室</th>
									<th>监护人姓名</th>
									<th>家庭住址</th>
									<th>监护人电话</th>
									<th>操作</th>
								</tr>
								<c:forEach var="student" items="${pageInfo.list}"
									varStatus="loop">
									<tr>
										<td>${student.username }</td>
										<td>${student.name }</td>
										<td>${student.IDcard }</td>
										<td>
											<c:if test="${student.gender == 1}">
												男
											</c:if>
											<c:if test="${student.gender == 0}">
												女
											</c:if>
										</td>
										<td>${student.age }</td>
										<td>${student.myclass }</td>
										<td>${student.grade }</td>
										<td>${student.phone }</td>
										<td>${student.room }</td>
										<td>${student.family.fname }</td>
										<td>${student.family.address }</td>
										<td>${student.family.fphone }</td>
										<td>
											<a href="/StudentInfo/CounselorHandler/addStudentPrizeView/${student.username}/${student.name}" class="btn btn-primary" >添加获奖</a>
											<a href="/StudentInfo/CounselorHandler/addStudentAbsentView/${student.username}/${student.name}" class="btn btn-primary" >添加缺旷</a>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		

			<!-- 显示分页信息 -->
	<div class="row">
		<!--分页文字信息  -->
		<div class="col-md-8">当前 ${pageInfo.pageNum}页,总${pageInfo.pages }
			页,总 ${pageInfo.total } 条记录</div>
		<!-- 分页条信息 -->
		<div class="col-md-4">
			<nav aria-label="Page navigation"  style="float: right">
			<ul class="pagination" style="background: darkgray">
				<li><a href="/StudentInfo/CounselorHandler/studentPrize/1">首页</a></li>
				<c:if test="${pageInfo.hasPreviousPage }">
					<li><a href="/StudentInfo/CounselorHandler/studentPrize/${pageInfo.pageNum-1}"
						aria-label="Previous"> <span aria-hidden="true">«</span>
					</a></li>
				</c:if>
 
				<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
					<c:if test="${page_Num == pageInfo.pageNum }">
						<li class="active"><a href="#">${page_Num }</a></li>
					</c:if>
					<c:if test="${page_Num != pageInfo.pageNum }">
						<li><a href="/StudentInfo/CounselorHandler/studentPrize/${page_Num }">${page_Num }</a></li>
					</c:if>
 
				</c:forEach>
				<c:if test="${pageInfo.hasNextPage }">
					<li><a href="/StudentInfo/CounselorHandler/studentPrize/${pageInfo.pageNum+1 }"
						aria-label="Next"> <span aria-hidden="true">»</span>
					</a></li>
				</c:if>
				<li><a href="/StudentInfo/CounselorHandler/studentPrize/${pageInfo.pages}">末页</a></li>
			</ul>
			</nav>
		</div>
	</div>
	
	
	
		
		
		
	</div>
<script src="/StudentInfo/utils/scripts/bganimation.js"></script></body>
</html>