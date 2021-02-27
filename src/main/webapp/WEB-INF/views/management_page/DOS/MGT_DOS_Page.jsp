<!-- 管理場地頁面 -->
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
       <header>
       </header>
       <br>
       <a href="<c:url value='/DOS/DOS_list' />" ><p class="text-center">場地列表</p></a>
       <a href="<c:url value='/DOS/DOS_sport_list' />" ><p class="text-center">場地運動種類列表</p></a>
       
            <div class="row">
                <div class="container">
                    <h3 class="text-center">場地列表</h3>
                    <hr>
                    <div class="container text-left">

                        <a href="DOS_new" class="btn btn-success">加入新場地</a>
                    </div>
                    <br>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>場地名稱</th>
                                <th>場地地址</th>
                                <th>場地最大人數</th>
                                <th>場地管理員</th>
                                <th>場地聯絡人</th>
                                <th>場地聯絡人電話</th>
                                <th>場地費用</th>
                                <th>場地備註</th>
                                <th>場地交通資訊</th>
                                <th>場地運動種類</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--   列出場地  -->
                            <c:forEach var="dos" items="${AllDOS}">

                                <tr>
                                    <td>
                                        <c:out value="${dos.DOS_NAME}" />
                                    </td>
                                    <td>
                                        <c:out value="${dos.DOS_ADDR}" />
                                    </td>
                                    <td>
                                        <c:out value="${dos.DOS_CY}" />
                                    </td>
                                   
                                     <td>
                                        <c:out value="${dos.DOS_AD}" />
                                    </td>
                                     <td>
                                        <c:out value="${dos.DOS_OFFICER}" />
                                    </td>
                                     <td>
                                        <c:out value="${dos.DOS_PHONE}" />
                                    </td>
                                     <td>
                                        <c:out value="${dos.DOS_PAY}" />
                                    </td>
                                     <td>
                                        <c:out value="${dos.DOS_PS}" />
                                    </td>
                                     <td>
                                        <c:out value="${dos.DOS_TRANS}" />
                                    </td>
                                     <td>
                                        <c:out value="${dos.dos_sport_id.DOS_SPORT_NAME}" />
                                    </td>
                                    <td><a href="DOS_edit?dosid=${dos.DOS_ID}">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="DOS_delete?dosid=<c:out value='${dos.DOS_ID}' />">Delete</a></td>
                                </tr>
                            </c:forEach>
                            <!-- } -->
                        </tbody>

                    </table>
                </div>
            </div>
        </body>
</html>