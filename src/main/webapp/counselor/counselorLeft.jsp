<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-inverse navbar-expand-lg" role="navigation">
    <a class="navbar-brand" href="/StudentInfo/counselor/counselorFace.jsp">学生信息管理系统</a>
    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar-collapse-01"></button>
    <div class="collapse navbar-collapse" id="navbar-collapse-01">
        <ul class="nav navbar-nav mr-auto">
            <li><a href="/StudentInfo/CounselorHandler/counselorInfo"><strong>本人信息管理</strong></a></li>
            <li><a href="/StudentInfo/CounselorHandler/studentInfo/1"><strong>学生信息查询</strong></a></li>
            <li><a href="/StudentInfo/CounselorHandler/studentPrize/1"><strong>查询学生获奖情况</strong></a></li>
            <li><a href="/StudentInfo/CounselorHandler/addStudentPrizeView"><strong>添加学生获奖情况</strong></a></li>
            <li><a href="/StudentInfo/CounselorHandler/absentInfo/1"><strong>查询学生缺旷情况</strong></a></li>
            <li><a href="/StudentInfo/CounselorHandler/addStudentAbsentView"><strong>添加学生缺旷情况</strong></a></li>
        </ul>
        <p class="navbar-text navbar-right">你好！ ${sessionScope.counselor.name} &nbsp;辅导员&nbsp;&nbsp;<a
                href="/StudentInfo/CounselorHandler/logout" class="navbar-link" href="#">注销</a></p>
    </div> <!--/.navbar-collapse -->
</nav>
<!-- /navbar -->

