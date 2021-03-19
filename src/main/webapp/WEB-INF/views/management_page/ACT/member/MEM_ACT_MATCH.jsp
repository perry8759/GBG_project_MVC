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
<script src="${pageContext.request.contextPath}/js_index/jquery.js"></script>
<title>Insert title here</title>
<!-- <!--  <script >   --> -->
<!-- // //點選提交按鈕觸發下面的函式 -->
<!-- // function submitit(){   -->
<!-- // //第一個表單 -->
<!-- //   for(var i=1;i<=4;i++){ -->
<!-- // 	  var aaa="matchbean_"+i; -->
<!-- // 	  document.getElementById(aaa).submit();  -->
<!-- //   }  -->
  
<!-- // }   -->
<!-- <!-- </script> -->
<script>
window.onload = function() {	   
	 var sendData = document.getElementById("sendData");
	   if(sendData !=null){
	   sendData.onclick = function() {		   
		   for(var i=1;i<=2;i++){
			   var a="match_seq_"+i;
			   var b="match_time_"+i;
			   var c="match_status_id_"+i;
		   var match_seqValue = document.getElementById(a).value;
			var match_timeValue = document.getElementById(b).value;
			var match_status_idValue = document.getElementById(c).options[document.getElementById(c).selectedIndex].text;
		   
		   var xhr1 = new XMLHttpRequest();
	   		xhr1.open("POST", "MATCH_ACT_AllTeam_one_round/"+match_status_idValue, false);
			var jsonMember = {
			    
			    "match_seq": match_seqValue, 	
			    "match_time": match_timeValue,
			    
	   		}
	   		xhr1.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	   		xhr1.send(JSON.stringify(jsonMember));
		
	   
	   		xhr1.onreadystatechange = function() {
					// 伺服器請求完成
	   		if (xhr1.readyState !=200) {
			    	console.log(xhr1.responseText);
			    			
			    }
	   		
	   		}
	   		window.history.go(0);
		}
	   }
	   }
	   
	   var sendData1 = document.getElementById("sendData1");
	   sendData1.onclick = function() {		   
		   for(var i=1;i<=4;i++){
			   var a="pair_match_id_"+i;
			   var b="pair_match_team_id_"+i;
	
			var pair_match_idValue = document.getElementById(a).options[document.getElementById(a).selectedIndex].text;
			var pair_match_team_idValue = document.getElementById(b).options[document.getElementById(b).selectedIndex].text;
		   var xhr2 = new XMLHttpRequest();
	   		xhr2.open("POST", "MATCH_ACT_AllTeam_one_round_pair/"+pair_match_idValue+"/"+pair_match_team_idValue, false);
			var jsonMember = {
			    
			    "match_pair_score": 0, 	
			    
			    
	   		}
	   		xhr2.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	   		xhr2.send(JSON.stringify(jsonMember));
		
	   
	   		xhr2.onreadystatechange = function() {
					// 伺服器請求完成
	   		if (xhr2.readyState !=200) {
			    	console.log(xhr2.responseText);
			    			
			    }
	   		
	   		}
	   		
		}
	   }
	   
}

</script>

</head>
<body>
<jsp:include page="/WEB-INF/views/fragment/topMVC_final.jsp" />
<section class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/images_index/timo-wagner-RydQGTPRELQ-unsplash.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate pb-5 text-center">            
            <h1 class="mb-3 bread">新增場地</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">場地管理頁面 <i class="ion-ios-arrow-forward"></i></a></span>新增場地 <span> <i class="ion-ios-arrow-forward"></i></span></p>                
          </div>
        </div>
      </div>
    </section>
<%--        <c:forEach var="all" items="${allmatch}"> --%>
<%--        <p><c:out value="${all.team_name}" /><p> --%>
<%--        </c:forEach> --%>
<%--        <c:forEach var="num" begin="1" end="${n}" step="1" > --%>
<%--        <form:form   modelAttribute="matchbean_${num}" id="matchbean_${num}" method="POST" > --%>
<%--        <form:input path="match_seq" type="text" class="form-control" name="sitename" id="sitename" placeholder="場地名稱"/></label> --%>
<%--        <form:input path="match_time" type="text" class="form-control" name="sitename" id="sitename" placeholder="場地名稱"/></label> --%>
<%--        <form:input path="act_id.ACT_ID" items="${act}" value="${act.ACT_ID}" type="text" class="form-control" name="sitename" id="sitename" placeholder="場地名稱"/></label> --%>
<%--        <form:select path="match_status_id.match_status_id" items="${allstatus}" itemLabel="match_status_name" itemValue="match_status_id"> --%>
<%-- 		</form:select> --%>
<%--        </form:form> --%>
<%--       </c:forEach> --%>
<!--       <input type="button"  onClick="submitit()" value="Click Me!"/> -->
<!--      <div> -->
<%--      <c:if test="${empty match_one}"> --%>
<!--      <h1>新增第一輪賽事資訊</h1> -->
<%--      <c:forEach var="num" begin="1" end="${n}" step="1" >      --%>
<!--      <tr height='60'> -->
<!-- 		<td width='200'>&nbsp;</td> -->
<!-- 		<td width='400'> -->
<%-- 			&nbsp;match_seq: <input type="text" name="match_seq_${num}" id='match_seq_${num}'><br> --%>
<!-- 		</td> -->
<!-- 		<td width='200' style="vertical-align:top"> -->
<!-- 			<div id='result1c' style="height: 10px;"></div><br> -->
<!-- 			<div id='result1s' style="height: 10px;"></div> -->
<!-- 		</td>	 -->
<!-- 	</tr> -->
<!-- 	<tr height='60'> -->
<!-- 		<td width='200'>&nbsp;</td> -->
<!-- 		<td width='400'> -->
<%-- 			&nbsp;match_time: <input type="text" name="match_time_${num}" id='match_time_${num}'><br> --%>
<!-- 		</td> -->
<!-- 		<td width='200' style="vertical-align:top"> -->
<!-- 			<div id='result2c' style="height: 10px;"></div><br> -->
<!-- 			<div id='result2s' style="height: 10px;"></div> -->
<!-- 		</td>	 -->
<!-- 	</tr> -->
	
<!-- 	<tr height='60'>		 -->
<!-- 		<td width='200'>&nbsp;</td> -->
<!-- 		<td width='400'> -->
<%-- 			&nbsp;match_status_id: <select id="match_status_id_${num}" name="match_status_id_${num}"> --%>
<%-- 			 <c:forEach var="allstatus" items="${allstatus}" varStatus="s"> --%>
<%-- 			  <option value="${allstatus.match_status_id}">${allstatus.match_status_id}</option>			  --%>
<%--              </c:forEach> --%>
			
<!-- 			</select> -->
<!-- 		</td>	 -->
<!-- 		<td width='200'> -->
<!-- 			<div id='result3c' style="height: 10px;"></div><br> -->
<!-- 			<div id='result3s' style="height: 10px;"></div>			 -->
<!-- 		</td>	 -->
<!-- 	</tr>		 -->
<!-- 			</table>  -->
     
<%--      </c:forEach> --%>
     
<!--      <tr height='50'>		 -->
<!-- 		<td colspan='3' align='center'><button id='sendData'>送出</button></td> -->
<!-- 	</tr> -->
<%-- 	</c:if> --%>
<!-- 	</div> -->
	
<!-- 	<div> -->
<%--      <c:if test="${!empty match_one}"> --%>
    
<%--     <c:forEach var="match_one"  varStatus="statusX" items="${match_one}"> --%>
<%--     ${match_one.match_seq} --%>
<%--     </c:forEach> --%>
<%-- 	</c:if> --%>
<!-- 	</div> -->
	
	
<!-- 	  <div> -->
<!-- 	    <h1>建立場次配對資訊</h1> -->
<%--         <c:forEach var="num1" begin="1" end="${n1}" step="1" > --%>
<!-- 		<td width='400'> -->
<%-- 			場次: <select id="pair_match_id_${num1}" name="pair_match_id_${num1}"> --%>
<%-- 			 <c:forEach var="match_all_one" items="${match_all_one}" varStatus="s"> --%>
<%-- 			  <option value="${match_all_one.match_id}">${match_all_one.match_id}</option>			  --%>
<%--              </c:forEach>	 --%>
<!-- 			</select>			 -->
<%-- 			選擇隊伍: <select id="pair_match_team_id_${num1}" name="pair_match_team_id_${num1}"> --%>
<%-- 			 <c:forEach var="match_all_team" items="${match_all_team}" varStatus="s"> --%>
<%-- 			  <option value="${match_all_team.match_team_id}">${match_all_team.match_team_id}</option>			  --%>
<%--              </c:forEach>			 --%>
<!-- 			</select>	 -->
<!-- 		</td>	 -->
<%-- 	   </c:forEach> --%>
<!-- 	   <tr height='50'>		 -->
<!-- 		<td colspan='3' align='center'><button id='sendData1'>送出</button></td> -->
<!-- 	</tr> -->
<!-- 	 </div> -->
	 
	 
	 <div class="siteadd-main">
        <section id="siteadd">
            <div class="container px-md-0">
                <div class="row d-flex no-gutters">
                    <div class="col-12 align-items-stretch">
                        <div class="contact-wrap w-100 p-md-5 p-4">
                             <h3 class="mb-4 heading">
                                新增第一輪賽事資訊
                            </h3>
                            
                                                       
                                <div class="row jsutify-content-center">
                                   <c:forEach var="num" begin="1" end="${n}" step="1" > 
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label class="label" for="sitename">場次
                                            <input type="text" name="match_seq_${num}" id='match_seq_${num}'></label>
                                        </div>
                                    </div>
                                    <div class="col-md-2 offset-md-1">
                                        <div class="form-group">
                                            <label class="label w-50" for="sitecost">比賽時間
                                                <input type="text" name="match_time_${num}" id='match_time_${num}'></label>
                                        </div>
                                    </div>
                                    <div class="col-md-2 offset-md-.5">
                                        <div class="form-group">
                                            <label class="label" for="accommodate">match_status
                                                  <select id="match_status_id_${num}" name="match_status_id_${num}">
			                                          <c:forEach var="allstatus" items="${allstatus}" varStatus="s">
			                                             <option value="${allstatus.match_status_id}">${allstatus.match_status_id}</option>			 
                                                      </c:forEach>
                                                  </select>
                                            </label>
                                        </div>
                                    </div>
                                    </c:forEach>
                                    <div class="col-md-12">
                                        <div class="form-group ">
                                            <input type="submit" value="送出" class="btn btn-primary" id='sendData'>
                                            <div class="submitting"></div>
                                        </div>
                                    </div>
                                </div>
                                                                                      
                        </div>
                    </div>
                </div>
            </div>
           
        </section>
    </div>
 <!-- loader -->              
  <script src="${pageContext.request.contextPath}/js_index/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/aos.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath}/js_index/google-map.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/main.js"></script>
  <script src="${pageContext.request.contextPath}/js_index/jquery.nice-select.min.js"></script>    
</body>
</html>