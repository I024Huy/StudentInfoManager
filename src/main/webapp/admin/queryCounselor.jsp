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
<link href="../image/favicon.ico" rel="shortcut icon">
<link rel="stylesheet" type="text/css" href="../css/main.css">
<script src="../js/fun.js" type="text/javascript"></script> -->
<script type="text/javascript" src="/StudentInfo/utils/js/jquery-3.3.1.min.js"></script>
<!-- Loading Bootstrap -->
		<link href="/StudentInfo/utils/css/vendor/bootstrap.min.css" rel="stylesheet">
		<!-- Loading Flat UI Pro -->
		<link href="/StudentInfo/utils/css/flat-ui.css" rel="stylesheet">
		<!-- Loading Flat UI JS -->
		<script type="text/javascript" src="/StudentInfo/utils/scripts/flat-ui.min.js"></script>	


<script type='text/javascript' src='/StudentInfo/utils/scripts/particles.js'></script><link href="/StudentInfo/utils/css/animate.css" rel="stylesheet"></head>

<body><div id="particles-js"><canvas class="particles-js-canvas-el" width="1322" height="774" style="width: 100%; height: 100%;"></canvas></div>
<jsp:include page="adminLeft.jsp" />
<script>
	$(function () {
		var a;
		a = '${requestScope.msg}';
		if(a != null && a != ''){
			alert(a)
		}
	})
</script>
<div class="container">
		<div class="row">
			<div class="col-md-12">
			<h5>教师管理</h5>
			<form name="queryCounselor" action="/StudentInfo/AdminHandler/counselorManager/keyQuery/1" method="post">
				<div class="row">
					<div class="col-md-3">
							<strong>查询条件<br></strong>
						<select name="key" class="form-control select select-primary select-block mbl">
							<option value="all">全部教师</option>
							<option value="username">辅导员工号查询</option>
							<option value="name">姓名查询</option>
						</select>
					</div>
					<div class="col-md-4">
								<strong>条件</strong>
							<div class="form-group has-feedback">
						<input type="text" name="value"  placeholder="输入值" class="form-control"/>
						</div>
					</div>
					<div class="col-md-2 pos">
						<br>
						<input type="submit" class="btn btn-primary" value="查询" />
					</div>
					<div class="col-md-3 pos">
						<br>
						<a class="btn btn-primary" aria-label="Left Align" style="float: right" href="/StudentInfo/AdminHandler/exportExcel/counselor">
							<span class="glyphicon glyphicon-plus" aria-hidden="true">导出</span>
						</a>
						<button type="button" class="btn btn-warning" aria-label="Left Align" style="float: right" onclick="ShowDiv2('MyDiv2','fade2')">
							<span class="glyphicon glyphicon-plus" aria-hidden="true">新增</span>
						</button>
					</div>
				</div>
				</form>
			
			</div>
			<div class="col-md-12">
			<div class="row">
			<div class="col-md-12" >
						<div class="margin:0 15px" style="overflow-x: scroll;">
			<table  style="overflow:scroll;" class="table table-striped table-hover animated fadeIn">
			<tr>
				<th>辅导员工号</th>
				<th>密码</th>
				<th>姓名</th>
				<th>性别</th>
				<th>年龄</th>
				<th>电话</th>
				<th>邮箱</th>
				<th>家庭住址</th>
				<th>操作</th>
			</tr>
			<c:forEach var="counselor" items="${requestScope.pageInfo.list}">
				<tr>
					<td>${counselor.username }</td>
					<td>${counselor.password }</td>
					<td>${counselor.name }</td>
					<td>
						<c:if test="${counselor.gender == '1'}">男</c:if>
						<c:if test="${counselor.gender == '0'}">女</c:if>

					</td>
					<td>${counselor.age}</td>
					<td>${counselor.phone}</td>
					<td>${counselor.email}</td>
					<td>${counselor.address}</td>

					<td>
						<button class="btn btn-sm btn-primary" onclick="ShowDiv('MyDiv','fade',${counselor.cid})">
							修改
						</button>
						<button class="deleteCss btn btn-sm btn-danger" onclick="deleteCounselor('${counselor.cid}')">
							删除
						</button>
					</td>
				</tr>

			</c:forEach>
		</table></div></div></div>
			</div>
	</div>
	
	
	
		<!-- 显示分页信息 -->
	<div class="row">
		<!--分页文字信息  -->
		<div class="col-md-6">当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
			页,总 ${pageInfo.total } 条记录</div>
		<!-- 分页条信息 -->
		<div class="col-md-6">
			<nav aria-label="Page navigation">
			<ul class="pagination bg-primary">
				<li><a href="/StudentInfo/AdminHandler/counselorManager/queryCounselorInfoList/1">首页</a></li>
				<c:if test="${pageInfo.hasPreviousPage }">
					<li><a href="/StudentInfo/AdminHandler/counselorManager/queryCounselorInfoList/${pageInfo.pageNum-1}"
						aria-label="Previous"> <span aria-hidden="true">«</span>
					</a></li>
				</c:if>
 
				<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
					<c:if test="${page_Num == pageInfo.pageNum }">
						<li class="active"><a href="#">${page_Num }</a></li>
					</c:if>
					<c:if test="${page_Num != pageInfo.pageNum }">
						<li><a href="/StudentInfo/AdminHandler/counselorManager/queryCounselorInfoList/${page_Num }">${page_Num }</a></li>
					</c:if>
 
				</c:forEach>
				<c:if test="${pageInfo.hasNextPage }">
					<li><a href="/StudentInfo/AdminHandler/counselorManager/queryCounselorInfoList/${pageInfo.pageNum+1}"
						aria-label="Next"> <span aria-hidden="true">»</span>
					</a></li>
				</c:if>
				<li><a href="/StudentInfo/AdminHandler/counselorManager/queryCounselorInfoList/${pageInfo.pages}">末页</a></li>
			</ul>
			</nav>
		</div>
	</div>
	
	<jsp:include page="counselorEdit.jsp"/>
	<jsp:include page="addCounselor.jsp"/>
	
</div>
<script>
	function deleteCounselor(cid) {
		const flag = window.confirm("您确定要删除此辅导员信息吗？");
		if (flag){
			window.location.href = "/StudentInfo/AdminHandler/counselorManager/deleteCounselorByCid/"+cid;
		}
	}
</script>
<script>
	$("select").select2({dropdownCssClass: 'dropdown-inverse'});
</script>
</html>