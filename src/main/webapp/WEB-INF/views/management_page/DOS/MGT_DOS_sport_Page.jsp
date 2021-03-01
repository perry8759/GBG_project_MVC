<!-- 管理運動種類頁面 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 管理場地頁面 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
      <jsp:include page="/WEB-INF/views/fragment/topMVC.jsp" />
      <jsp:include page="/WEB-INF/views/fragment/topMVC_manager.jsp" />
       <header>
       </header>
       <br>
       <a href="<c:url value='/DOS/DOS_list' />" ><p class="text-center">場地列表</p></a>
       <a href="<c:url value='/DOS/DOS_sport_list' />" ><p class="text-center">場地運動種類列表</p></a>
       
            <div class="row" style="float:left;">
                <div class="container">
                    <h3 class="text-center">運動種類列表</h3>
                    <hr>
                    <div class="container text-left">

                        <a href="DOS_sport_new" class="btn btn-success">加入新運動種類</a>
                    </div>
                    <br>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>運動種類編號</th>
                                <th>運動種類名稱</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--   列出場地  -->
                            <c:forEach var="dos" items="${AllDOS_sport}">

                                <tr>
                                    <td>
                                        <c:out value="${dos.DOS_SPORT_ID}" />
                                    </td>
                                    <td>
                                        <c:out value="${dos.DOS_SPORT_NAME}" />
                                    </td>
                                    
                                    <td><a href="DOS_sport_edit?dos_sport_id=${dos.DOS_SPORT_ID}">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="DOS_sport_delete?dos_sport_id=<c:out value='${dos.DOS_SPORT_ID}' />">Delete</a></td>
                                </tr>
                            </c:forEach>
                            <!-- } -->
                        </tbody>

                    </table>
                </div>
            </div>
        </body>
</html>