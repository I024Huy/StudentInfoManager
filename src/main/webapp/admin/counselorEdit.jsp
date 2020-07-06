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
    .black_overlay{
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
    .white_content {
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
<div id="fade" class="black_overlay">
</div>
<div id="MyDiv" class="white_content">
    <div style="text-align: right; cursor: default; height: 40px;" id="move">
        <a class="btn btn-sm btn-danger">
            <span style="font-size: 16px;" onclick="CloseDiv('MyDiv','fade')">close</span>
        </a>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="row"><div class="col-md-12" >
                    <h3>修改辅导员信息</h3>
                    <form action="/StudentInfo/AdminHandler/counselorManager/saveCounselorInfo" method="post">
                    <div class="margin:0 15px"><table  style="overflow:scroll;" class="table table-striped table-hover animated fadeIn">
                        <input type="hidden" name="cid" id="cid">
                        <tr>
                            <td>辅导员工号</td>
                            <td><input class="form-control" type="text" id="username" name="username" ></input></td>
                        </tr>
                        <tr>
                            <td>密码</td>
                            <td><input class="form-control" type="text" id="password" name="password" /></td>
                            
                        </tr>
                        <tr>
                            <td>姓名</td>
                            <td><input class="form-control" type="text" id="name" name="name" /></td>
                            
                        </tr>
                        <tr>
                            <td>性别</td>
                            <td>
                                <input type="radio" class="gender1" name="gender" value="1">男<input type="radio" class="gender2" name="gender" value="0">女
                            </td>
                            
                        </tr>
                        <tr>
                            <td>年龄</td>
                            <td><input class="form-control" type="text" id="age" name="age"></td>
                        </tr>

                        <tr>
                            <td>电话号码</td>
                            <td><input class="form-control" type="text" id="phone" name="phone"></td>
                        </tr>
                        <tr>
                            <td>邮箱</td>
                            <td><input class="form-control" type="text" id="email" name="email"></td>
                        </tr>
                        <tr>
                            <td>家庭住址</td>
                            <td><input class="form-control" type="text" id="address" name="address"></td>
                        </tr>

                    </table></div>
                        <input type="submit" value="保存" style="margin-left: 340px;" class="btn btn-sm btn-success">
                    </form></div></div>
            </div></div></div>
</div>

<script>
    var oldUsername;
    //弹出隐藏层
    function ShowDiv(show_div,bg_div,cid){
        $.ajax({
            url:"/StudentInfo/AdminHandler/counselorManager/getCounselorInfoByCid",
            type:"post",
            data:{"cid":cid},
            success:function (result) {
                document.getElementById(show_div).style.display='block';
                document.getElementById(bg_div).style.display='block' ;
                var bgdiv = document.getElementById(bg_div);
                bgdiv.style.width = document.body.scrollWidth;
                $("#"+bg_div).height($(document).height());
                $("#cid").val(result.cid);
                oldUsername = result.username;
                $("#username").val(result.username);
                $("#name").val(result.name);
                if (result.gender === '1'){
                    $(".gender1").prop("checked",true);
                }else {
                    $(".gender2").prop("checked",true);
                };
                $("#password").val(result.password);
                $("#age").val(result.age);
                $("#phone").val(result.phone);
                $("#email").val(result.email);
                $("#address").val(result.address);
            },
            error:function (obj){
                alert(obj);
            },
            dataType:"json"
        });

    };
    $("#username").on("blur",function() {
        if (oldUsername != $("#username").val()){
            $.ajax({
                url:"/StudentInfo/AdminHandler/counselorManager/getCounselorByUsername",
                type:"post",
                data:{"username":$("#username").val()},
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
        }
    });

    //关闭弹出层
    function CloseDiv(show_div,bg_div)
    {
        document.getElementById(show_div).style.display='none';
        document.getElementById(bg_div).style.display='none';
    };

</script>
</html>
