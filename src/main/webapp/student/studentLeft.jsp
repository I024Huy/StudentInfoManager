<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<nav class="navbar navbar-inverse navbar-expand-lg" role="navigation">
  <a class="navbar-brand" href="${pageContext.request.contextPath}/student/studentFace.jsp">学生信息管理系统</a>
  <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar-collapse-01"></button>
  <div class="collapse navbar-collapse" id="navbar-collapse-01">
  <ul class="nav navbar-nav mr-auto">
	  		<li><a href="/StudentInfo/StudentHandler/studentInfo/${sessionScope.student.sid}"><strong>个人信息管理</strong></a>
	  		<li><a href="/StudentInfo/StudentHandler/familyInfo/${sessionScope.student.sid}"><strong>家庭信息管理</strong></a>
	  		<li><a href="/StudentInfo/StudentHandler/getPrize/${sessionScope.student.sid}/1"><strong>查看获奖信息</strong></a>
	  		<li><a href="/StudentInfo/StudentHandler/changePassword"><strong>密码修改</strong></a>

    </ul>
	<p class="navbar-text navbar-right">你好！${sessionScope.student.name}同学&nbsp;&nbsp;  <a href="/StudentInfo/StudentHandler/logout" class="navbar-link" href="#">注销</a></p>

  </div> <!--/.navbar-collapse -->
</nav><!-- /navbar -->



