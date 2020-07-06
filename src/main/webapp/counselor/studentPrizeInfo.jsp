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
				<h5>学生获奖情况管理</h5>
				<form name="studentquery" action="/StudentInfo/CounselorHandler/keyQuery/1" method="post">
					<input type="hidden" name="cid" value="${sessionScope.counselor.cid}">
					<div class="row">
						<div class="col-md-2"><strong>特殊查询条件<br></strong></div>
						<div class="col-md-2">
							<select name="type" class="form-control select select-primary select-block mbl" style="font-weight: 600">
								<option value="all">全部查询</option>
								<option value="sid">学号</option>
								<option value="name">奖项名称</option>
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
						<div class="col-md-1 pos">
							<div style="float: right">
								<a class="btn btn-primary" href="/StudentInfo/CounselorHandler/exportStudentExcel/prize">导出</a>
							</div>
						</div>
					</div>
				</form>

				<div class="row">
					<div class="col-md-12">
						<div class="margin:0 15px">
							<table style="overflow: scroll;"
								class="table table-striped table-hover animated fadeIn">
								<tr>
									<th>学生学号</th>
									<th>学生姓名</th>
									<th>性别</th>
									<th>获奖名称</th>
									<th>获奖等级</th>
									<th>获奖时间</th>
									<th>所在班级</th>
									<th>所在年级</th>
									<th>所在学院</th>
									<th>所在专业</th>
									<th>寝室</th>
									<th>操作</th>
								</tr>
								<c:forEach var="prize" items="${pageInfo.list}"
									varStatus="loop">
									<tr>
										<td>${prize.student.username }</td>
										<td>${prize.student.name }</td>
										<td>
											<c:if test="${prize.student.gender == 1}">
												男
											</c:if>
											<c:if test="${prize.student.gender == 0}">
												女
											</c:if>
										</td>
										<td>${prize.name }</td>
										<td>${prize.level }</td>
										<td>
											<fmt:formatDate value="${prize.date}" pattern="yyyy-MM-dd"/>
										</td>
										<td>${prize.student.myclass }</td>
										<td>${prize.student.grade }</td>
										<td>${prize.student.profession.name }</td>
										<td>${prize.student.college.name }</td>
										<td>${prize.student.room }</td>
										<td>
											<button onclick="deleteStudentPrize('${prize.hid}')" value="删除" class="btn btn-danger" >删除</button>
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
<script>
	$(function () {
		var a;
		a = '${requestScope.msg}';
		if(a != null && a != ''){
			alert(a)
		}
	})
	function deleteStudentPrize(hid) {
		const flag = window.confirm("您确定要删除吗？")
		if(flag){
			window.location.href = "/StudentInfo/CounselorHandler/deleteStudentPrize/"+hid;
		}
	}
</script>
<script src="/StudentInfo/utils/scripts/bganimation.js"></script></body>
</html>