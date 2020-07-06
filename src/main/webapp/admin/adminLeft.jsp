<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-inverse navbar-expand-lg" role="navigation">
  <a class="navbar-brand" href="/StudentInfo/admin/adminFace.jsp">学生信息管理系统</a>
  <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar-collapse-01"></button>
  <div class="collapse navbar-collapse" id="navbar-collapse-01">
  <ul class="nav navbar-nav mr-auto" >

      <li><a href="/StudentInfo/AdminHandler/studentManager/queryStudentInfoList/1"><strong>学生信息管理</strong></a></li>
		
      <li><a href="/StudentInfo/AdminHandler/counselorManager/queryCounselorInfoList/1"><strong>辅导员信息管理</strong></a>  </li>

      <li><a href="/StudentInfo/AdminHandler/changePasswordView"><strong>修改密码</strong></a></li>

  </ul>
	<p class="navbar-text navbar-right">你好！${sessionScope.admin.name}管理员&nbsp;&nbsp;<a href="/StudentInfo/AdminHandler/logout" class="navbar-link" href="#">注销</a></p>
  </div>
</nav>



