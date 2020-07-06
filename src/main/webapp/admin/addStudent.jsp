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
					<h3>添加学生信息</h3>
					<form action="/StudentInfo/AdminHandler/studentManager/addStudentInfo" method="post">
						<div class="margin:0 15px"><table  style="overflow:scroll;" class="table table-striped table-hover animated fadeIn">
							<tr>
								<td colspan="2"><h5>个人信息</h5></td>
							</tr>
							<tr>
								<td>学号</td>
								<td><input class="form-control" type="text" id="username2" name="username" maxlength="13" placeholder="请输入学生学号" required/></td>
							</tr>
							<tr>
								<td>姓名</td>
								<td><input class="form-control" type="text" name="name" maxlength="10" placeholder="请输入学生姓名" required/></td>

							</tr>
							<tr>
								<td>身份证</td>
								<td><input class="form-control" type="text" name="IDcard" maxlength="18" placeholder="请输入身份证号码" required/></td>

							</tr>
							<tr>
								<td>性别</td>
								<td>
									<input type="radio" name="gender" value="1">男<input type="radio" name="gender" value="0">女
								</td>

							</tr>
							<tr>
								<td>密码</td>
								<td><input class="form-control" type="text" name="password" placeholder="请输入初始密码" required></td>
							</tr>
							<tr>
								<td>年龄</td>
								<td><input class="form-control" type="text" name="age" placeholder="请输入年龄" required></td>
							</tr>
							<tr>
								<td>专业id</td>
								<td><input class="form-control" type="text" id="zid2" name="zid" placeholder="请输入学生所在专业编号" required/></td>
							</tr>
							<tr>
								<td>所在专业</td>
								<td><input readonly="readonly" class="form-control"
										   type="text" id="zname2"></td>
							</tr>
							<tr>
								<td>所在学院</td>
								<td><input readonly="readonly" class="form-control" type="text" id="xname2"></td>
							</tr>
							<tr>
								<td>班级</td>
								<td><input class="form-control" type="text" name="myclass" placeholder="请输入班级" required></td>
							</tr>
							<tr>
								<td>年级</td>
								<td><input class="form-control" type="text" name="grade" placeholder="请输入所在年级" required></td>
							</tr>
							<tr>
								<td>寝室</td>
								<td><input class="form-control" type="text" name="room" placeholder="请输入寝室地点" required></td>
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
								<td colspan="2"><h5>辅导员信息</h5></td>
								<input type="hidden" name="cid" id="cid2">
							</tr>
							<tr>
								<td>所属辅导员号</td>
								<td><input class="form-control" type="text" id="cusername2" placeholder="请输入学生所属辅导员编号" required></td>
							</tr>
							<tr>
								<td>所属辅导员姓名</td>
								<td><input readonly="readonly" class="form-control" type="text" id="cname2"></td>
							</tr>
							<tr>
								<td>所属辅导员电话</td>
								<td><input readonly="readonly" class="form-control" type="text" id="cphone2"></td>
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
	//改变专业zid时，填充专业名称
	$("#zid2").on("blur",function() {
		$.ajax({
			url:"/StudentInfo/AdminHandler/studentManager/getProfessionById",
			type:"post",
			data:{"zid":$("#zid2").val()},
			success:function (result) {
				$("#zname2").val(result.zname);
				$("#xname2").val(result.xname);
			},
			error:function () {
				$("#zname2").val('');
				$("#xname2").val('');
				alert('不存在此专业,请确认后输入');
			},
			dataType:"json"
		})
	});

	$("#cusername2").on("blur",function () {
		$.ajax({
			url:"/StudentInfo/AdminHandler/studentManager/getCounselorById",
			type:"post",
			data:{"username":$("#cusername2").val()},
			success:function (result) {
				$("#cid2").val(result.cid);
				$("#cname2").val(result.name);
				$("#cphone2").val(result.phone);
			},
			error:function () {
				$("#cname2").val('');
				$("#cphone2").val('');
				alert('不存在此辅导员,请确认后输入');
			},
			dataType:"json"
		})
	});
	$("#username2").on("blur",function() {
		$.ajax({
			url:"/StudentInfo/AdminHandler/studentManager/getStudentByUsername",
			type:"post",
			data:{"username":$("#username2").val()},
			success:function (result) {
				if(result == "1"){
					alert('此学号已存在,请重新输入');
				}
			},
			error:function () {
				alert('此学号已存在,请重新输入!');
			},
			dataType:"json"
		})
	});

</script>
</html>
