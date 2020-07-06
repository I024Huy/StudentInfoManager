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
<jsp:include page="adminLeft.jsp"/>
<script>
    $(function () {
        var a;
        a = '${requestScope.msg}';
        if(a != null && a != ''){
            alert(a)
        }
    })
</script>
<div class="container" style="max-width: 1450px">
    <div class="row">
        <div class="col-md-12">
            <h5>学生管理</h5>

            <form name="studentquery" action="/StudentInfo/AdminHandler/studentManager/queryStudentInfoListByKeyWorld/1"
                  method="post">
                <div class="row">
                    <div class="col-md-3">
                        <strong>查询条件<br></strong>
                        <select name="key" class="form-control select select-primary select-block mbl">
                            <option value="all">全部学生</option>
                            <option value="sid">按学号查询</option>
                            <option value="name">按姓名查询</option>
                            <option value="xname">按学院查询</option>
                            <option value="zname">按专业查询</option>
                            <option value="myclass">按班级查询</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <strong>条件</strong>
                        <div class="form-group has-feedback">
                            <input type="text" name="value" placeholder="输入值" class="form-control"/>
                        </div>
                    </div>
                    <div class="col-md-2 pos">
                        <br>
                        <input type="submit" class="btn btn-primary" value="查询"/>
                    </div>
                    <div class="col-md-3 pos">
                        <br>
                        <a class="btn btn-primary" style="float: right" href="/StudentInfo/AdminHandler/exportExcel/student">
                            导出
                        </a>
                        <button type="button" class="btn btn-warning" aria-label="Left Align" style="float: right" onclick="ShowDiv2('MyDiv2','fade2')">
                            <span class="glyphicon glyphicon-plus" aria-hidden="true">新增</span>
                        </button>
                    </div>
                </div>
            </form>

        </div>
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-12">
                    <div class="margin:0 15px" style="overflow-x: scroll;">
                        <table style="overflow:scroll;" class="table table-striped table-hover animated fadeIn">
                            <tr>
                                <th>学号</th>
                                <th>姓名</th>
                                <th>身份证</th>
                                <th>性别</th>
                                <th>密码</th>
                                <th>年龄</th>
                                <th>班级</th>
                                <th>专业</th>
                                <th>学院</th>
                                <th>操作</th>
                            </tr>
                            <c:forEach var="student" items="${requestScope.pageInfo.list}">
                                <tr>
                                    <td>${student.username}</td>
                                    <td>${student.name }</td>
                                    <td>${student.IDcard}</td>
                                    <td>
                                        <c:if test="${student.gender == '1'}">
                                            男
                                        </c:if>
                                        <c:if test="${student.gender == '0'}">
                                            女
                                        </c:if>
                                    </td>
                                    <td>${student.password}</td>
                                    <td>${student.age}</td>
                                    <td>${student.myclass}</td>
                                    <td>${student.profession.name}</td>
                                    <td>${student.college.name}</td>

                                    <td>
                                        <button id="edit" class="btn btn-sm btn-primary"
                                                onclick="ShowDiv('MyDiv','fade','${student.sid}')">
                                            查看详情/修改
                                        </button>
                                        <button id="delete" onclick="deleteStudent(${student.sid})"
                                           class="btn btn-sm btn-danger delete_bnt"> 删除
                                        </button>
                                    </td>
                                </tr>

                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 显示分页信息 -->
    <div class="row">
        <!--分页文字信息  -->
        <div class="col-md-6">当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
            页,总 ${pageInfo.total } 条记录
        </div>
        <!-- 分页条信息 -->
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination bg-primary">
                    <li><a href="/StudentInfo/AdminHandler/studentManager/queryStudentInfoList/1">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage }">
                        <li>
                            <a href="/StudentInfo/AdminHandler/studentManager/queryStudentInfoList/${pageInfo.pageNum-1}'"
                               aria-label="Previous"> <span aria-hidden="true">«</span>
                            </a></li>
                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                        <c:if test="${page_Num == pageInfo.pageNum }">
                            <li class="active"><a href="#">${page_Num }</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum }">
                            <li>
                                <a href="/StudentInfo/AdminHandler/studentManager/queryStudentInfoList/${page_Num }">${page_Num }</a>
                            </li>
                        </c:if>

                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage }">
                        <li>
                            <a href="/StudentInfo/AdminHandler/studentManager/queryStudentInfoList/${pageInfo.pageNum+1 }"
                               aria-label="Next"> <span aria-hidden="true">»</span>
                            </a></li>
                    </c:if>
                    <li><a href="/StudentInfo/AdminHandler/studentManager/queryStudentInfoList/${pageInfo.pages}">末页</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>


</div>
<script>
    $(function () {
        if(${msg != null}){
            alert(${msg});
        }
    })
    function deleteStudent(sid) {
		const flag = window.confirm("您确定要删除此学生吗？");
        if(flag){
            window.location.href = "/StudentInfo/AdminHandler/studentManager/deleteStudent/"+sid
        }
	}
</script>

<jsp:include page="studentEdit.jsp"/>
<jsp:include page="addStudent.jsp"/>


<script>
    $("select").select2({dropdownCssClass: 'dropdown-inverse'});
</script>
<script src="/StudentInfo/utils/scripts/bganimation.js"></script>
</body>
</html>