<%--
  Created by IntelliJ IDEA.
  User: EDAT丶ICiT
  Date: 2020/6/22
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
	<title>学生信息管理系统</title>
	<script type="text/javascript" src="/StudentInfo/utils/js/jquery-3.3.1.min.js"></script>
	<!-- Loading Bootstrap -->
	<link href="/StudentInfo/utils/css/vendor/bootstrap.min.css" rel="stylesheet">
	<!-- Loading Flat UI Pro -->
	<link href="/StudentInfo/utils/css/flat-ui.css" rel="stylesheet">
	<!-- Loading Flat UI JS -->
	<script type="text/javascript" src="/StudentInfo/utils/scripts/flat-ui.min.js"></script>


	<script type='text/javascript' src='/StudentInfo/utils/scripts/particles.js'></script><link href="/StudentInfo/utils/css/animate.css" rel="stylesheet"></head>

<style>
	.black_overlay2{
		display: none;
		position: absolute;
		top: 0%;
		left: 0%;
		width: 100%;
		height: 100%;
		background-color: black;
		z-index:1001;
		-moz-opacity: 0.8;
		opacity:.80;
		filter: alpha(opacity=80);
	}
	.white_content2 {
		display: none;
		position: absolute;
		top: 10%;
		left: 25%;
		width: 50%;
		height: 80%;
		border: 16px solid lightblue;
		background-color: white;
		z-index:1002;
		overflow: auto;
	}
</style>
</head>

<body>
<%--弹出框~~~~~~~--%>
<div id="fade2" class="black_overlay2">
</div>
<div id="MyDiv2" class="white_content2">
	<div style="text-align: right; cursor: default; height: 40px;" id="move2">
		<a class="btn btn-sm btn-danger">
			<span style="font-size: 16px;" onclick="CloseDiv2('MyDiv2','fade2')">close</span>
		</a>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="row"><div class="col-md-12" >
					<h3>添加辅导员信息</h3>
					<form action="/StudentInfo/AdminHandler/counselorManager/addCounselorInfo" method="post">
						<div class="margin:0 15px"><table  style="overflow:scroll;" class="table table-striped table-hover animated fadeIn">
							<tr>
								<td colspan="2"><h5>个人信息</h5></td>
							</tr>
							<tr>
								<td>辅导员工号</td>
								<td><input class="form-control" type="text" id="username2" name="username" maxlength="13" placeholder="请输入学生学号" required/></td>
							</tr>
							<tr>
								<td>密码</td>
								<td><input class="form-control" type="text" name="password" maxlength="10" placeholder="请输入学生姓名" required/></td>

							</tr>
							<tr>
								<td>姓名</td>
								<td><input class="form-control" type="text" name="name" maxlength="10" placeholder="请输入学生姓名" required/></td>

							</tr>
							<tr>
								<td>性别</td>
								<td>
									<input type="radio" name="gender" value="1">男<input type="radio" name="gender" value="0">女
								</td>

							</tr>
							<tr>
								<td>年龄</td>
								<td><input class="form-control" type="text" name="age" placeholder="请输入年龄" required></td>
							</tr>
							<tr>
								<td>电话号码</td>
								<td><input class="form-control" type="text" name="phone" placeholder="请输入电话号码" required pattern="^1(3|4|5|6|7|8|9)\d{9}$"></td>
							</tr>
							<tr>
								<td>邮箱</td>
								<td><input class="form-control" type="text" name="email" placeholder="电子邮箱格式如：***.@qq.com" required pattern="^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$"></td>
							</tr>
							<tr>
								<td>家庭住址</td>
								<td><input class="form-control" type="text" name="address"></td>
							</tr>

						</table></div>
						<input type="submit" value="保存" style="margin-left: 340px;" class="btn btn-sm btn-success">
					</form></div></div>
			</div></div></div>
</div>

<script>
	//弹出隐藏层
	function ShowDiv2(show_div2,bg_div2){
		document.getElementById(show_div2).style.display='block';
		document.getElementById(bg_div2).style.display='block' ;
		var bgdiv = document.getElementById(bg_div2);
		bgdiv.style.width = document.body.scrollWidth;
	};
	//关闭弹出层
	function CloseDiv2(show_div2,bg_div2)
	{
		document.getElementById(show_div2).style.display='none';
		document.getElementById(bg_div2).style.display='none';
	};
	$("#username2").on("blur",function() {
		$.ajax({
			url:"/StudentInfo/AdminHandler/counselorManager/getCounselorByUsername",
			type:"post",
			data:{"username":$("#username2").val()},
			success:function (result) {
				if(result == "1"){
					alert('此辅导员学工号已存在,请重新输入');
				}
			},
			error:function () {
				alert('此辅导员学工号已存在,请重新输入!');
			},
			dataType:"json"
		})
	});

</script>
</html>
