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
<title>Insert title here</title>
</head>
<body>

     <jsp:include page="/WEB-INF/views/fragment/topMVC.jsp" />
    
     <jsp:include page="/WEB-INF/views/fragment/topMVC_manager.jsp" />

            <div class="row" style="float:left;">
            
                <div class="container">
                
                    <h3 class="text-center">活動列表</h3>
                    <hr>
                   
                    <br>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>活動標題</th>
                                <th>主辦方編號</th>                                
                                <th>活動目前狀態</th>                               
                                
                                <th>控制活動</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--   列出場地  -->
                            <c:forEach var="act" items="${AllACT}">

                                <tr>
                                    <td>
                                        <c:out value="${act.ACT_TITLE}" />
                                    </td>
                                    <td>
                                        <c:out value="${act.MEMBER_ID}" />
                                    </td>                                  
                                    <td>
                                        <c:out value="${act.act_status.ACT_STATUS_NAME}" />
                                    </td>     
                                                                  
                                   <c:if test="${act.act_status.ACT_STATUS_ID !=5}"> 
                                    <td><a href=javascript:PopupPic('actid=${act.ACT_ID}')>審核</a>
                                    &nbsp;&nbsp;
                                    <a href="Manager_ACT_lock?actid=${act.ACT_ID}">封鎖</a>
                                    </td>
                                    </c:if>
                                    <c:if test="${act.act_status.ACT_STATUS_ID ==5}"> 
                                    <td>已封鎖，無法變更狀態</td>
                                    </c:if>
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