<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/utils/image/favicon.ico"
	type="utils/image/x-icon" />
<meta charset="UTF-8">
<title>学生信息管理系统</title>

<script type="text/javascript" src="utils/js/jquery-3.3.1.min.js"></script>
<!-- Loading Bootstrap -->
<link href="utils/css/vendor/bootstrap.min.css" rel="stylesheet">
<!-- Loading Flat UI Pro -->
<link href="utils/css/flat-ui.css" rel="stylesheet">
<!-- Loading Flat UI Pro -->
<link href="utils/css/animate.css" rel="stylesheet">
<script type='text/javascript' src='utils/scripts/particles.js'></script>
<script src="utils/js/bootstrap.min.js"></script>
<style>
.login-plane {
	padding: 2rem;
	margin-top: 3rem;
}

.center-block {
	display: block;
	margin-left: auto;
	margin-right: auto;
}

.center-carousel {
	width: 33%;
	margin-left: auto;
	margin-right: auto;
}

.login-btn {
	width: 100%;
	margin-top: 1rem;
}

.container {
	padding-top: 4rem;
}
</style>

<link href="${pageContext.request.contextPath}/utils/css/animate.css" rel="stylesheet">
</head>
<body style="display: flex;">











	<div id="particles-js">
		<canvas class="particles-js-canvas-el" width="1322" height="774"
			style="width: 100%; height: 100%;">
    </canvas>
	</div>
	<div class="container" id="particles"
		style="position: relative; top: -4rem; margin: auto;">
		<div class="row">
			<div class="col-md-12">
				<h4 class="text-center animated bounceInDown">学生信息管理系统</h4>
			</div>
			<div class="col-md-12">
				<div class="row login-plane animated fadeIn">
					<div class="col-md-4 center-block">
						<form method="post" name="login" id="login" action="">
							<strong>账号信息</strong>
							<div class="form-group has-feedback">
								<input name="" type="text" id="username"
									placeholder="username" class="form-control" m="username"
									onkeyup="value=value.replace(/[\u4e00-\u9fa5]|(^\s+)|(\s+$)/ig,'')"
									maxlength="13" /> <span class="form-control-feedback fui-user"></span>
							</div>
							<div class="form-group has-feedback">
								<input name="" type="password" value="" id="password"
									placeholder="password" class="form-control" m="password"
									onkeyup="this.value=this.value.replace(/(^\s+)|(\s+$)/g,'');"
									maxlength="16" /> <span class="form-control-feedback fui-lock"></span>
							</div>


							<div class="row">
								<div class="col-md-12">
									<strong>角色信息</strong>
								</div>
								<div class="col-md-4">
									<label class="radio" for="radio1"> <input type="radio"
										name="optionsRadios1" value="student" checked="checked"
										id="radio1" data-toggle="radio" class="custom-radio">
										<span class="icons"> <span class="icon-unchecked"></span>
											<span class="icon-checked"></span>
									</span> <font style="vertical-align: inherit;"> <font
											style="vertical-align: inherit;"> 学生 </font>
									</font>
									</label>
								</div>

								<div class="col-md-4">
									<label class="radio" for="radio2"> <input type="radio"
										name="optionsRadios1" value="counselor" id="radio2"
										data-toggle="radio" class="custom-radio"> <span
										class="icons"> <span class="icon-unchecked"></span> <span
											class="icon-checked"></span>
									</span> <font style="vertical-align: inherit;"> <font
											style="vertical-align: inherit;"> 辅导员 </font>
									</font>
									</label>
								</div>
								<div class="col-md-4">
									<label class="radio" for="radio3"> <input type="radio"
										name="optionsRadios1" value="admin" id="radio3"
										data-toggle="radio" class="custom-radio"> <span
										class="icons"> <span class="icon-unchecked"></span> <span
											class="icon-checked"></span>
									</span> <font style="vertical-align: inherit;"> <font
											style="vertical-align: inherit;"> 管理员 </font>
									</font>
									</label>
								</div>
							</div>

							<input class="btn btn-primary btn-wide login-btn" value="LOGIN"
								type="button" onclick="submitHandler()" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		var useridEle = document.getElementById("username");
		var passwordEle = document.getElementById("password");
		var roleRadio = document.getElementsByName("optionsRadios1");

		/*
		 * 点击登录执行的逻辑
		 */
		function submitHandler() {

			if (!vali()) {
				return false;
			}

			var role = 'student';

			for (var i = 0; i < roleRadio.length; i++) {
				if (roleRadio[i].checked) {
					role = roleRadio[i].value;
				}
			}

			var action = null;
			if (role == 'student') {
				action = "${pageContext.request.contextPath}/StudentHandler/login";
				useridEle.name = "username";
				passwordEle.name = "password";
			} else if (role == 'counselor') {
				action = "${pageContext.request.contextPath}/CounselorHandler/login";
				useridEle.name = "username";
				passwordEle.name = "password";
			} else {
				action = "${pageContext.request.contextPath}/AdminHandler/login";
				useridEle.name = "username";
				passwordEle.name = "password";
			}
			document.getElementById("login").action = action;
			$("#login").submit();
			return true;
		}

		function vali() {
			var valiObjs = createInputMsgObj([ 'username', 'password' ])

			for (var i = 0; i < valiObjs.length; i++) {
				console.log(valiObjs[i].el.val())
				if (valiObjs[i].el.val() == null || valiObjs[i].el.val() == '') {
					valiObjs[i].el.css({
						"border-color" : "red"
					})
					console.log(valiObjs[i].el)
					var alertEl = $("<div style=\"position:fixed;top:1rem;right:1rem;\" class=\"alert alert-warning\">"
							+ valiObjs[i].msg + "没有填写！" + "</h5></div>")
					$("body").append(alertEl);
					setTimeout(function() {
						alertEl.remove();
					}, 1000)
					return false;
				}
			}
			return true;
		}

		function createInputMsgObj(ids) {
			var objs = [];

			for (var i = 0; i < ids.length; i++) {

				var obj = {
					el : $("#" + ids[i]),
					msg : $("#" + ids[i]).attr('m')
				}
				objs.push(obj);
			}

			return objs;
		}

	</script>
	<script src="utils/scripts/bganimation.js"></script>
</body>
</html>