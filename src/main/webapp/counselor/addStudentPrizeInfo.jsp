<%--
  Created by IntelliJ IDEA.
  User: EDAT丶ICiT
  Date: 2020/6/21
  Time: 20:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"><link rel="shortcut icon" href="/StudentInfo/utils/image/favicon.ico" type="image/x-icon" />
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
<div class="container">
    <div class="row">
        <div class="col-md-12" style="margin-left: 260px">
            <h5>添加学生获奖信息</h5>
            <form action="/StudentInfo/CounselorHandler/addStudentPrizeInfo" method="post" name="form1">
                <div class="row">
                    <div class="col-md-6">
                        <h6>学号</h6>
                        <input type="text" name="username" id="username" class="form-control" maxlength="13"/>
                        <span id="countsid" style="color: #ff0000;"></span>
                        <h6>姓名</h6>
                        <input type="text" id="sname" name="sname" class="form-control"  maxlength="10"/>


                        <h6>奖项名称</h6>
                        <input type="text" name="name" id="name" class="form-control"/>

                        <h6>奖项等级</h6>
                        <select name="level" id="level"
                                class="form-control select select-primary select-block mbl">
                            <option value="" selected>-请选择等级-</option>
                            <option value="一等奖">一等奖</option>
                            <option value="二等奖">二等奖</option>
                            <option value="三等奖">三等奖</option>
                            <option value="other">其他</option>
                        </select>
                        <input id="in" type="text" style="display: none">

                        <h6>获奖日期</h6>
                        <input type="date" name="date" id="date" class="form-control">

                    </div>
                    <div class="col-md-12">
                        <br> <input type="submit" id="btn"
                                    class="btn btn-primary btn-wide login-btn" value="添加"  style="margin-left: 190px;"/>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>
<script>
    $(function () {
        if(${not empty msg}){
            alert("${msg}")
        }
        if(${not empty username}){
            $("#username").val(${username});
            $("#sname").val('${name}');
        }
    });
    $("#level").change(function () {
        var val = $("#level").val();
        if (val === "other"){
            $("#in").show().prop("name","level");
            $("#level").prop("name","");
        }
    });
    $("#username").on("blur",function () {
        const username = $("#username").val();
        $.ajax({
            url:"/StudentInfo/CounselorHandler/getStudentByUsername",
            type:"post",
            data:{"username":username,"cid":'${sessionScope.counselor.cid}'},
            success:function (result) {
                if (result.name != null && result.name != ''){
                    $("#sname").val(result.name);
                    $("#sname").prop("readonly","readonly")
                }else {
                    alert("无此学生学号,或此学生不是你管辖的学生")
                }

            },
            error:function () {
                alert("无此学生学号！")
            }
        })
    })
</script>
</body>
</html>
