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
                
                    <h3 class="text-center">主辦活動列表</h3>
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
                                <th>活動標題</th>                              
                                <th>活動目前狀態</th>                               
                                
                                <th>選項</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="act" items="${AllACT}">

                                <tr>
                                    <td>
                                    <a href="<c:url value='/ACT/ACT_Main/${act.ACT_ID}'/>">
                                        <c:out value="${act.ACT_TITLE}" /></a>
                                    </td>                               
                                    <td>
                                        <c:out value="${act.act_status.ACT_STATUS_NAME}" />
                                    </td>     
                                    <td>
                                    <a href="<c:url value='/ACT/ActEdit?actid=${act.ACT_ID}'/>">修改活動資訊</a>
                                    &nbsp;&nbsp;
                                    <a href="<c:url value='/ACT/CheckRegTeamState?actid=${act.ACT_ID}'/>">查看已報名隊伍</a>
                                    <a href="<c:url value='/ACT/EditActNew?actid=${act.ACT_ID}'/>">修改活動公告</a>
                                    </td>
                              </tr>      
                            </c:forEach>
							
                            <!-- } -->
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