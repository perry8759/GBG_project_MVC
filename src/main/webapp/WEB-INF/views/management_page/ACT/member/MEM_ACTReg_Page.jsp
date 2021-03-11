<!-- 管理活動頁面 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/css/jquery.js"></script>
<script>
  $(function() {
    $("#tabs").tabs();
  } );
  </script>
</head>
<body>

     <jsp:include page="/WEB-INF/views/fragment/topMVC.jsp" />
    
     <jsp:include page="/WEB-INF/views/fragment/topMVC_member.jsp" />

            <div class="row" style="float:left;">
            
                <div class="container">
                
                    <h3 class="text-center">報名隊伍列表</h3>
                    <hr>                  
                    <br>
                    <div id="tabs">
                           <ul>
                             <li><a href="#tabs-1">報名進行中</a></li>
                             <li><a href="#tabs-2">活動進行中</a></li>
                             <li><a href="#tabs-3">已結束</a></li>
                            <!--  篩選功能還未做 -->
                           </ul>
                    </div>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                            	<th>隊伍名稱</th>   
                                <th>活動標題</th>                          
                                <th>活動目前狀態</th>                               
                                
                                <th>選項</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--   列出場地  -->
                            <c:forEach var="team" items="${AllTeam}">

                                <tr>
                                	<td>
                                        <c:out value="${team.team_name}" />
                                    </td> 
                                    <td>
                                    <a href="<c:url value='/ACT/ACT_Main/${team.act_id.ACT_ID}'/>">
                                        <c:out value="${team.act_id.ACT_TITLE}" /></a>
                                    </td>                               
                                    <td>
                                        <c:out value="${team.act_id.act_status.ACT_STATUS_NAME}" />
                                    </td>     
                                 <!-- 判斷權限 -->
                                   <c:if test="${sessionScope.LoginOK.member_perm_id.member_perm_id ==1 }">
                                    <td>
                                 <!-- 依活動狀態決定是否可更改報名資料 -->
                                    <a href="<c:url value='/ACT//ACT_regEdit?teamid=${team.match_team_id}'/>">修改報名資訊</a>
                                    </td>
                                    </c:if>
                              </tr>      
                            </c:forEach>
                        </tbody>

                    </table>
                </div>
            </div>
           
        </body>
        <script >
            function PopupPic(sURL) { 
                window.open("Manager_ACT_list_detail?"+sURL,"詳細資料","resizable=1,height=600,width=600,location=no"); 
            } 
       </script>
</html>