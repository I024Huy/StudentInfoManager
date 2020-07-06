<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="shortcut icon" href="/StudentInfo/utils/image/favicon.ico" type="image/x-icon"/>
    <meta charset="UTF-8">
    <title>学生信息管理系统</title>

    <script type="text/javascript" src="/StudentInfo/utils/js/jquery-3.3.1.min.js"></script>

    <!-- Loading Bootstrap -->
    <link href="/StudentInfo/utils/css/vendor/bootstrap.min.css" rel="stylesheet">
    <!-- Loading Flat UI Pro -->
    <link href="/StudentInfo/utils/css/flat-ui.css" rel="stylesheet">
    <!-- Loading Flat UI JS -->
    <script type="text/javascript" src="/StudentInfo/utils/scripts/flat-ui.min.js"></script>


    <script type='text/javascript' src='/StudentInfo/utils/scripts/particles.js'></script>
    <link href="/StudentInfo/utils/css/animate.css" rel="stylesheet">
</head>

<body>
<div id="particles-js">
    <canvas class="particles-js-canvas-el" width="1322" height="774" style="width: 100%; height: 100%;"></canvas>
</div>
<jsp:include page="counselorLeft.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h5>修改密码</h5>
            <form type="post">
                <div class="row">

                    <div class="col-md-3"><input type="password" id="cpassword" name="cpassword" class="form-control"
                                                 onkeyup="this.value=this.value.replace(/(^\s+)|(\s+$)/g,'');"
                                                 maxlength="20"/></div>
                    <div class="col-md-3"><input id="btn" type="button" class="btn btn-primary btn-wide login-btn" value="确定修改"/>
                    </div>

                </div>
            </form>

        </div>
    </div>
</div>


<script type="text/javascript" src="/StudentInfo/utils/scripts/flat-ui.js"></script>
<script src="/StudentInfo/utils/scripts/bganimation.js"></script>
<script>
	$("#btn").click(function () {
        var pwd = $("#cpassword").val();
		$.ajax({
			url:"${pageContext.request.contextPath}/CounselorHandler/modifyPassword",
			type:"post",
			data:{"cid":${sessionScope.counselor.cid},"cpassword":pwd},
			success:function (result) {
				if(result == 1){
					alert("修改成功，请重新登陆！");
					window.location.href="/StudentInfo/index.jsp";
				}else{
					window.location.href="/StudentInfo/fail.jsp?msg=‘fail to modify’"
				}
			},
            error:function(e){
                alert(e)
            },
            dataType:"json"
		})
	})
</script>
</body>
</html>