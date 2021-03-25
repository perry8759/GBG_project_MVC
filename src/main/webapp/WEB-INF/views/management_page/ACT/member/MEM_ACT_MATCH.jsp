<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		   for(var i=1;i<=${round};i++){
			   var rm=${round_main}[0];
			   for(var y=1;y<=${round_main}[i-1];y++){			   
			   var a="match_seq_"+y+"_"+i;
			   var b="match_time_"+y+"_"+i;
			   var c="match_status_id_"+y+"_"+i;
			   var d="act_id_"+y+"_"+i;
		   var match_seqValue = document.getElementById(a).value;
			var match_timeValue = document.getElementById(b).value;
			var match_status_idValue = document.getElementById(c).options[document.getElementById(c).selectedIndex].value;
		    var act_idValue=document.getElementById(d).value;
		   
		    
		   var xhr1 = new XMLHttpRequest();
	   		xhr1.open("POST", "MATCH_ACT_AllTeam_round_/"+i+"/"+match_status_idValue+"/"+act_idValue, false);
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
	   }
	   
	   var sendData1 = document.getElementById("sendData1");
	   if(sendData1  !=null){
	   sendData1.onclick = function() {		   
		   for(var i=1;i<=${round};i++){
			   for(var y=1;y<=${round_pair}[i-1];y++){
				  
			   var a="pair_match_id_"+y+"_"+i;
			   var b="pair_match_team_id_"+y+"_"+i;
			if(document.getElementById(a) !=null && document.getElementById(b) !=null){
			var pair_match_idValue = document.getElementById(a).options[document.getElementById(a).selectedIndex].value;
			var pair_match_team_idValue = document.getElementById(b).options[document.getElementById(b).selectedIndex].value;
			
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
	   		window.history.go(0);
			}
		}
	   }
	   
}
}
	   
	   var sendData2 = document.getElementById("sendData2");
	   if(sendData2  !=null){
	   sendData2.onclick = function() {		   
		   for(var i=1;i<=${round};i++){
			   for(var y=1;y<=${round_pair}[i-1];y++){
				  
			   var a="match_score_"+y+"_"+i;
			   var b="match_id_pair_"+y+"_"+i;			
			   var scoreValue="";
			   var pair_idValue="";
			   var scoreValue1 = document.getElementById(a);
			   var pair_idValue1 = document.getElementById(b);
			   if (scoreValue1 != null) {
				   scoreValue = scoreValue1.value;
				}
				else {
					scoreValue = 0;
				}
			   if (pair_idValue1 != null) {
				   pair_idValue = pair_idValue1.value;
				}
				else {
					pair_idValue = 0;
				}
			   
			   
			   if(scoreValue !=null && pair_idValue !=null){
		   var xhr2 = new XMLHttpRequest();
	   		xhr2.open("POST", "MATCH_ACT_AllTeam_round_pair_updatescore/"+pair_idValue+"/"+scoreValue, false);
			var jsonMember = {
			    
			    	
			    
			    
	   		}
	   		xhr2.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	   		xhr2.send(JSON.stringify(jsonMember));
		
	   
	   		xhr2.onreadystatechange = function() {
					// 伺服器請求完成
	   		if (xhr2.readyState !=200) {
			    	console.log(xhr2.responseText);
			    			
			    }
	   		
	   		}
	   		window.history.go(0);
			   }
			
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
	 
	
	   <c:if test="${empty match_one}">
	 <div class="siteadd-main">
        <section id="siteadd">
            <div class="container px-md-0">
                <div class="row d-flex no-gutters">
                    <div class="col-12 align-items-stretch">
                        <div class="contact-wrap w-100 p-md-5 p-4">
                           <c:forEach var="round" begin="1" end="${round}" step="1" varStatus="s">
                             <h3 class="mb-4 heading">                             
                                新增第${round}輪賽事資訊(待改-必須為該主辦會員.活動)
                            </h3>
                           
                                 
                                 <c:forEach var="num" begin="1" end='${round_main[s.index-1]}' step="1" varStatus="s"> 
                                   
                                <div class="row jsutify-content-center">
                                    
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label class="label" for="sitename">場次
                                            <input type="text" name="match_seq_${num}_${round}" id='match_seq_${num}_${round}' class="form-control" placeholder="場次"></label>                                         
                                        </div>
                                    </div>
                                    <div class="col-md-2 offset-md-.5">
                                        <div class="form-group">                                         
                                              <div class="form-group">
                                            <label class="label" for="sitecost">活動編號                                                                                       
                                                <input type="text"  class="form-control"  id='act_id_${num}_${round}'  value="${actt.ACT_ID}" disabled></label>                                              
                                        </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2 offset-md-.5">
                                        <div class="form-group">
                                            <label class="label w-50" for="sitecost">比賽時間
                                                <input type="text" name="match_time_${num}_${round}" id='match_time_${num}_${round}' class="form-control" placeholder="比賽時間"></label>
                                        </div>
                                    </div>
                                    <div class="col-md-2 offset-md-.5">
                                        <div class="form-group">
                                            <label class="label" for="accommodate">match_status</label>
                                               <div>
                                                  <select id="match_status_id_${num}_${round}" name="match_status_id_${num}_${round}">
			                                          <c:forEach var="allstatus" items="${allstatus}" varStatus="s">
			                                             <option value="${allstatus.match_status_id}">${allstatus.match_status_name}</option>			 
                                                      </c:forEach>
                                                  </select>
                                              </div>
                                        </div>
                                    </div>
                                    
                                    </div>
                                  
                                    </c:forEach>
                                    
                                    
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
                </section>
            </div>
           </c:if>
           
       
       <c:if test="${!empty match_one}">
       <div class="siteadd-main">
        <section id="siteadd">
            <div class="container px-md-0">
                <div class="row d-flex no-gutters">
                    <div class="col-12 align-items-stretch">
                        <div class="contact-wrap w-100 p-md-5 p-4">
                             
                             <h3 class="mb-4 heading">                             
                                查看所有場次賽事資訊(待改-必須為該主辦會員.活動)
                            </h3>
                            
                                 <c:forEach var="match_one"  items="${match_one}" varStatus="s">                      
                                <div class="row jsutify-content-center">
                                    
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label class="label" for="sitename">場次
                                            <input type="text"  class="form-control" placeholder="${match_one.match_seq}" disabled></label>
                                        </div>
                                    </div>
                                    <div class="col-md-2 offset-md-.5">
                                        <div class="form-group">
                                            <label class="label" for="sitecost">比賽時間
                                                <input type="text"  class="form-control" placeholder="${match_one.match_time}" disabled></label>
                                        </div>
                                    </div>
                                    <div class="col-md-2 offset-md-.5">
                                        <div class="form-group">
                                            <label class="label" for="sitecost">目前場次狀態
                                                <input type="text"  class="form-control" placeholder="${match_one.match_status_id.match_status_name}" disabled></label>
                                        </div>
                                    </div>
                                    
                                    </div>
                                    
                                    </c:forEach>
                                    
                                   
                    
                                </div>
                                                                                      
                        </div>
                    </div>
                </div>
                </section>
            </div>
            </c:if>
       
       <c:if test="${!empty match_one}">
       <div class="siteadd-main">
        <section id="siteadd">
            <div class="container px-md-0">
                <div class="row d-flex no-gutters">
                    <div class="col-12 align-items-stretch">
                        <div class="contact-wrap w-100 p-md-5 p-4">
                        <c:forEach var="round" begin="1" end="${round}" step="1" varStatus="s">
                         
                             <h3 class="mb-4 heading">
                                 <c:if test="${empty match_pair_round[s.index-1]}">
                                建立第${round}輪配對資訊(待改-必須為該主辦會員.活動，才能使用場次順序)
                                </c:if>
                            </h3>
                            <c:if test="${empty match_pair_round[s.index-1]}">
                                 <c:forEach var="num1" begin="1" end='${round_pair[s.index-1]}' step="1" varStatus="ss">
                                     <c:if test="${empty match_pair_round[s.index-1]}">                      
                                <div class="row jsutify-content-center">
                                    
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label class="label" for="sitename">場次</label>
                                            <div id='select_pair_match_id_${num1}_${round}'></div>
                                        </div>
                                    </div>
                                    <div class="col-md-2 offset-md-.5">
                                        <div class="form-group">
                                            <label class="label w-50" for="sitecost">場次選擇</label>
                                              <div>
                                                <select id="pair_match_id_${num1}_${round}" name="pair_match_id_${num1}_${round}" onchange="isSelect()">
                                                   <option value="">請選擇</option>
			                                       <c:forEach var="match_all_one" items="${match_all_one}" varStatus="s">
			                                         <option value="${match_all_one.match_id}">${match_all_one.match_seq}</option>			 
                                                   </c:forEach>	
			                                    </select>
                                              </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2 offset-md-.5">
                                        <div class="form-group">
                                            <label class="label" for="accommodate">隊伍選擇</label>
                                              <div>
                                                 <select id="pair_match_team_id_${num1}_${round}" name="pair_match_team_id_${num1}_${round}"  >
                                                     <option value="">請選擇</option>
			                                        <c:forEach var="match_all_team" items="${match_all_team}" varStatus="s">
			                                           <option value="${match_all_team.match_team_id}">${match_all_team.team_name}</option>			 
                                                    </c:forEach>			
			                                     </select>	
                                              </div>
                                        </div>
                                    </div>                                   
                                    </div>                                   
                                    </c:if>                                                                      
                                    </c:forEach> 
                                    <div class="col-md-12">
                                        <div class="form-group ">
                                            <input type="submit" value="新增配對" class="btn btn-primary" id='sendData1'>
                                            <div class="submitting"></div>
                                        </div>
                                    </div>
                                    </c:if>
                                    
                                    <c:if test="${!empty match_pair_round[s.index-1]}"> 
                                    <h3 class="mb-4 heading">
                                    
                                          第${round}輪配對資訊(待改-必須為該主辦會員.活動，才能使用場次順序)
                                   
                                    </h3>
                                        <c:forEach var="round_pairr" items="${match_pair_round[s.index-1]}" varStatus="sss">                     
                                <div class="row jsutify-content-center">
                                    
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label class="label" for="sitename">場次</label>
                                            <div id='select_pair_match_id_${num1}_${round}'>${round_pairr.match_id.match_seq}</div>
                                        </div>
                                    </div>                                   
                                    <div class="col-md-2 offset-md-.5">
                                        <div class="form-group">                                         
                                              <div class="form-group">
                                            <label class="label" for="sitecost">所選隊伍                                                                                         
                                                <input type="text"  class="form-control" placeholder="${round_pairr.match_team_id.team_name}" disabled></label>                                              
                                        </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2 offset-md-.5">
                                        <div class="form-group">                                         
                                              <div class="form-group">
                                            <label class="label" for="sitecost">分數                                                                                         
                                                <input type="text"  class="form-control"  id='match_score_${sss.index+1}_${round}' placeholder="${round_pairr.match_pair_score}" value="${round_pairr.match_pair_score}"></label>                                              
                                        </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2 offset-md-.5">
                                        <div class="form-group">                                         
                                              <div class="form-group">
                                            <label class="label" for="sitecost">配對編號                                                                                       
                                                <input type="text"  class="form-control"  id='match_id_pair_${sss.index+1}_${round}'  value="${round_pairr.match_pair_id}" disabled></label>                                              
                                        </div>
                                        </div>
                                    </div>
                                    </div>
                                    </c:forEach>
                                   
                                    </c:if>
                                                                     
                                   </c:forEach>     
                                    <c:if test="${fn:length(match_pair_round)==round}">
                                   <div class="col-md-12">
                                        <div class="form-group ">
                                            <input type="submit" value="送出分數" class="btn btn-primary" id='sendData2'>
                                            <div class="submitting"></div>
                                        </div>
                                    </div>
                                   </c:if>
                                 
                                   
<%--                                    <c:if test="${empty match_pair_round[match_pair_round.size-1]}">  --%>
<!--                                     <div class="col-md-12"> -->
<!--                                         <div class="form-group "> -->
<!--                                             <input type="submit" value="送出" class="btn btn-primary" id='sendData1'> -->
<!--                                             <div class="submitting"></div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<%--                                     </c:if> --%>
                                </div>
                                                                                      
                        </div>
                    </div>
                </div>
                </section>
            </div>
          </c:if>

    <script>
    function isSelect() {
    	for(var i=1;i<=${round};i++){
    		for(var y=1;y<=${round_pair}[i-1];y++){
        var a="pair_match_id_"+y+"_"+i;
    	var b="select_pair_match_id_"+y+"_"+i;
    	if(document.getElementById(a) !=null && document.getElementById(b) !=null){
    		document.getElementById(b).innerHTML = document.getElementById(a).options[document.getElementById(a).selectedIndex].innerText;
    	}
    		}
    }
    }
    </script>
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