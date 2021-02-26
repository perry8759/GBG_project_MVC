<!-- 所有活動的主頁 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style type="text/css">
       .Main{
         background-color: #FFFFFF;
         border: 1px solid #e5e5e5;
         margin-bottom: 10px;
         clear: both;
         overflow: hidden;
       }
       .master{
              width:900px;
              margin:50px auto;
       }
       .Main_Box{
         background-color: #FFFFFF;
         border: 1px solid #e5e5e5;
         margin-bottom: 50px;
         clear: both;
         overflow: hidden;   
         margin-left: auto;
         margin-right: auto;
         
       }
       .C_Box{
         padding: 12px 8px;
         border-bottom: 1px dotted #CCCCCC;
         overflow: auto;
       }
       .T_Box{
         margin-bottom: 8px;
         padding-bottom: 0;
         width: calc(100% - 220px);
         float: left;
         font-weight: bold;
         font-size: 18px;
         line-height: 150%;
       }
       .Con_Box{
         float: left;
         width: calc(100% - 220px);
         font-size: 16px;
         line-height: 1.5;
       }
       .pages {
               
              color: #666;
              text-decoration: none;
              
                   
       }
</style>
</head>
<body>
<jsp:include page="/fragment/topMVC.jsp" />
<c:set var="funcName" value="CHE" scope="session"/>
            <div class="Main">
            <div class="master"  >
            <c:forEach var="act" items="${Act}" varStatus="st">
           
           
          <div class="Main_Box">
              <div class="C_Box">
                   <div class="T_Box">${act.ACT_TITLE}</div>
                   <div class="T_Box"><c:out value="${act.dos_id.DOS_ID}"/></div>          
                   <div class="Con_Box">
                       <table>
                             <tr>
                                 <td style="width:150px;">比賽縣市:</td>
                                 <td style="width:300px;">比賽時間:${act.ACT_RUN_O}</td>
                                 <td style="width:300px;">${act.act_status.ACT_STATUS_NAME}</td>
                             </tr>
                       </table>
                   </div>
                   
              </div>
              
          </div>
          
          </c:forEach>
          </div>
          <div style="height:150px"></div>
          <div class="master">
              <div style="text-align:center;margin-bottom:150px;">
                <a href="?start=0" >[首頁]</a>
                <a href="?start=${pre}" class="pages" >上一頁</a>
                <a href="?start=${next}" class="pages" >下一頁</a>
                <a href="?start=${last}" >[最後一頁]</a>
              </div>
          </div>
          </div>
        
           
</body>


</html>