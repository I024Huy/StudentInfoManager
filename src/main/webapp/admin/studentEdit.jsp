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
                    <h3>修改学生信息</h3>
                    <form action="/StudentInfo/AdminHandler/studentManager/saveStudentInfo" method="post">
                    <div class="margin:0 15px"><table  style="overflow:scroll;" class="table table-striped table-hover animated fadeIn">
                        <input id="old" type="hidden" name="oldUsername">
                        <tr>
                            <td colspan="2"><h5>个人信息</h5></td>
                        </tr>
                        <tr>
                            <td>学号</td>
                            <td><input class="form-control" type="text" id="username" name="username" ></input></td>
                        </tr>
                        <tr>
                            <td>姓名</td>
                            <td><input class="form-control" type="text" id="name" name="name" /></td>
                        </tr>
                        <tr>
                            <td>身份证</td>
                            <td><input class="form-control" type="text" id="card" name="IDcard" /></td>
                            
                        </tr>
                        <tr>
                            <td>性别</td>
                            <td>
                                <input type="radio" class="gender1" name="gender" value="1">男<input type="radio" class="gender2" name="gender" value="0">女
                            </td>
                            
                        </tr>
                        <tr>
                            <td>密码</td>
                            <td><input class="form-control" type="text" id="password" name="password"></td>
                        </tr>
                        <tr>
                            <td>年龄</td>
                            <td><input class="form-control" type="text" id="age" name="age"></td>
                        </tr>
                        <tr>
                            <td>班级</td>
                            <td><input class="form-control" type="text" id="myclass" name="myclass"></td>
                        </tr>
                        <tr>
                            <td>年级</td>
                            <td><input class="form-control" type="text" id="grade" name="grade"></td>
                        </tr>
                        <tr>
                            <td>专业id</td>
                            <td><input class="form-control" type="text" id="zid" name="profession.zid"/></td>
                        </tr>
                        <tr>
                            <td>所在专业</td>
                            <td><input readonly="readonly" class="form-control"
                                       type="text" id="zname" name="profession.name"></td>
                        </tr>
                        <tr>
                            <td>所在学院</td>
                            <td><input readonly="readonly" class="form-control" type="text" id="xname" name="college.name"></td>
                        </tr>
                        <tr>
                            <td>寝室</td>
                            <td><input class="form-control" type="text" id="room" name="room"></td>
                        </tr>
                        <tr>
                            <td>电话号码</td>
                            <td><input class="form-control" type="text" id="phone" name="phone"></td>
                        </tr>
                        <tr>
                            <td>邮箱</td>
                            <td><input class="form-control" type="text" id="email" name="email"></td>
                        </tr>


                        <tr >
                            <td colspan="2"><h5>家庭信息</h5></td>
                        </tr>
                        <tr>
                            <td>监护人id</td>
                            <td><input readonly="readonly" class="form-control" type="text" id="fid" name="family.fid"></td>
                        </tr>
                        <tr>
                            <td>监护人姓名</td>
                            <td><input class="form-control" type="text" id="fname" name="family.fname"></td>
                        </tr>
                        <tr>
                            <td>家庭地址</td>
                            <td><input class="form-control" type="text" id="address" name="family.address"></td>
                        </tr>
                        <tr>
                            <td>监护人性别</td>
                            <td>
                                <input type="radio" id="fgender3" class="fgender" name="family.fgender" value="1">男<input type="radio" id="fgender4" class="fgender" name="family.fgender" value="0">女
                            </td>
                        </tr>
                        <tr>
                            <td>监护人年龄</td>
                            <td><input class="form-control" type="text" id="fage" name="family.fage"></td>
                        </tr>
                        <tr>
                            <td>监护人电话</td>
                            <td><input class="form-control" type="text" id="fphone" name="family.fphone"></td>
                        </tr>

                        <tr>
                            <td colspan="2"><h5>辅导员信息</h5></td>
                        </tr>
                        <tr>
                            <td>辅导员号</td>
                            <td><input class="form-control" type="text" id="cusername" name="counselor.username"></td>
                        </tr>
                        <tr>
                            <td>辅导员姓名</td>
                            <td><input readonly="readonly" class="form-control" type="text" id="cname" name="counselor.name"></td>
                        </tr>
                        <tr>
                            <td>辅导员电话</td>
                            <td><input readonly="readonly" class="form-control" type="text" id="cphone" name="counselor.phone"></td>
                        </tr>

                    </table></div>
                        <input type="submit" value="保存" style="margin-left: 340px;" class="btn btn-sm btn-success">
                    </form></div></div>
            </div></div></div>
</div>

<script>
    var oldUsername;
    //弹出隐藏层
    function ShowDiv(show_div,bg_div,sid){
        $.ajax({
            url:"/StudentInfo/AdminHandler/studentManager/getStudentInfoBySid",
            type:"post",
            data:{"sid":sid},
            success:function (result) {
                document.getElementById(show_div).style.display='block';
                document.getElementById(bg_div).style.display='block' ;
                var bgdiv = document.getElementById(bg_div);
                bgdiv.style.width = document.body.scrollWidth;
                $("#"+bg_div).height($(document).height());
                oldUsername = result.username;
                $("#old").val(result.username);
                $("#username").val(result.username);
                $("#name").val(result.name);
                $("#card").val(result.idcard);
                if (result.gender === '1'){
                    $(".gender1").prop("checked",true);
                }else {
                    $(".gender2").prop("checked",true);
                };
                $("#password").val(result.password);
                $("#age").val(result.age);
                $("#myclass").val(result.myclass);
                $("#grade").val(result.grade);
                $("#zid").val(result.profession.zid);
                $("#zname").val(result.profession.name);
                $("#xid").val(result.college.xid);
                $("#xname").val(result.college.name);
                $("#room").val(result.room);
                $("#phone").val(result.phone);
                $("#email").val(result.email);
                $("#fid").val(result.family.fid);
                $("#fname").val(result.family.fname);
                $("#address").val(result.family.address);
                if (result.family.fgender === '1'){
                    $("#fgender3").prop("checked",true);
                }else {
                    $("#fgender4").prop("checked",true);
                };
                $("#fage").val(result.family.fage);
                $("#fphone").val(result.family.fphone);
                $("#cusername").val(result.counselor.username);
                $("#cname").val(result.counselor.name);
                $("#cphone").val(result.counselor.phone);
            },
            dataType:"json"
        })
    };

    //关闭弹出层
    function CloseDiv(show_div,bg_div)
    {
        document.getElementById(show_div).style.display='none';
        document.getElementById(bg_div).style.display='none';
    };
    $("#username").on("blur",function() {
        if (oldUsername != $("#username").val()){
            $.ajax({
                url:"/StudentInfo/AdminHandler/studentManager/getStudentByUsername",
                type:"post",
                data:{"username":$("#username").val()},
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
        }
    });
    //改变专业zid时，填充专业名称
    $("#zid").on("blur",function() {
        $.ajax({
            url:"/StudentInfo/AdminHandler/studentManager/getProfessionById",
            type:"post",
            data:{"zid":$("#zid").val()},
            success:function (result) {
                $("#zname").val(result.zname);
                $("#xname").val(result.xname);
            },
            error:function () {
                $("#zname").val('');
                $("#xname").val('');
                alert('不存在此专业,请确认后输入');
            },
            dataType:"json"
        })
    });

    $("#cusername").on("blur",function () {
        $.ajax({
            url:"/StudentInfo/AdminHandler/studentManager/getCounselorById",
            type:"post",
            data:{"username":$("#cusername").val()},
            success:function (result) {
                $("#cname").val(result.name);
                $("#cphone").val(result.phone);
            },
            error:function () {
                $("#cname").val('');
                $("#cphone").val('');
                alert('不存在此辅导员,请确认后输入');
            },
            dataType:"json"
        })
    });

</script>
</html>
