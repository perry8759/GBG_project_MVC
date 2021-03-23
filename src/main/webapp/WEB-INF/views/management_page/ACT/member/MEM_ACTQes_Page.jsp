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
</head>
<body>

     <jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
    
     <jsp:include page="/WEB-INF/views/fragment/sideOption.jsp" />

            <div class="row" style="float:left;">
            
                <div class="container">
                
                    <h3 class="text-center">歷史問答紀錄</h3>
                    <hr>                  
                    <br>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                            	<th>比賽名稱</th>   
                                <th>發言內容</th>                          
<!--                                 <th>留言狀態</th>     //DB未改                           -->
                                
                                <th>選項</th>
                            </tr>
                        </thead>
                        
                            <!--   列出留言  -->
                            
                            <c:forEach var="act_qes" items="${AllQes}">
                            <tbody>
                                <c:forEach var="qes" varStatus="vs" items="${act_qes.value}">
                                <tr>
                                	<td>
                                	 <c:if test="${vs.index==0}">
                                        <c:out value="${act_qes.key.ACT_TITLE}" />
                                     </c:if>
                                     <c:if test="${vs.index!=0}">
                                     
                                     </c:if>
                                    </td> 
                                	<td>
										<p>${qes.value}</p>
									</td>
                                	<td>
                                    	<a href="<c:url value='/ACT/ACT_QesEditForm?qesid=${qes.key.ACT_QES_ID}'/>">修改留言</a>
                                    	<a href="<c:url value='/ACT/ACT_QesDelete?qesid=${qes.key.ACT_QES_ID}'/>">刪除留言</a>
                                	</td>
								 </tr>  
								</c:forEach>
                            </tbody>
                            </c:forEach>
                            
                        

                    </table>
                </div>
            </div>
           
        </body>
</html>