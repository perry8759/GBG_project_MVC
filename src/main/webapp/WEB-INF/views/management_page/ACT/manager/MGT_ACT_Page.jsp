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
<script src="${pageContext.request.contextPath}/js_index/jquery.js"></script>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">   
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $(function() {
    $("#tabs").tabs();
  } );
  
  
window.onload = function() {	   
		var alink = document.getElementById("lock");		
		alink.onclick = function() {
			var xhr = new XMLHttpRequest();
			  xhr.open('GET', "<c:url value='/ACT_LOCK_LIST' />", true);			  
			  xhr.send();
			  xhr.onreadystatechange = function() {
			    // 伺服器請求完成
			    if (xhr.readyState == 4 && xhr.status == 200) {
			    	console.log(JSON.parse(xhr.responseText));
			    	displayACT_lock(xhr.responseText);					
			    }
			  }
		}
		
		var blink = document.getElementById("nopass");		
		blink.onclick = function() {
			var xhr = new XMLHttpRequest();
			  xhr.open('GET', "<c:url value='/ACT_NOPASS_LIST' />", true);			  
			  xhr.send();
			  xhr.onreadystatechange = function() {
			    // 伺服器請求完成
			    if (xhr.readyState == 4 && xhr.status == 200) {
			    	console.log(JSON.parse(xhr.responseText));
			    	displayACT_nopass(xhr.responseText);					
			    }
			  }
		}
		
		var clink = document.getElementById("pass");		
		clink.onclick = function() {
			var xhr = new XMLHttpRequest();
			  xhr.open('GET', "<c:url value='/ACT_PASS_LIST' />", true);			  
			  xhr.send();
			  xhr.onreadystatechange = function() {
			    // 伺服器請求完成
			    if (xhr.readyState == 4 && xhr.status == 200) {
			    	console.log(JSON.parse(xhr.responseText));
			    	displayACT_pass(xhr.responseText);					
			    }
			  }
		}
		
		
}




	  
	  
function displayACT_lock(responseData){
	var acts = JSON.parse(responseData);
	var segment = "<table class='table table-bordered'> <thead><tr> " 
	              + "<th>活動標題</th>"
	              + "<th>主辦方編號</th>"
	              +"<th>活動目前狀態</th>"
	              +"<th>控制活動</th>"
	              + "<tr></thead>";
	for(i = 0; i < acts.length; i++){
		var act = acts[i];
		segment += "<tr><td>" +  act.act_TITLE + "</td>" 
		                      + "<td>" +  act.member_ID + "</td>" 
		                      + "<td>" +  act.act_status.act_STATUS_NAME+ "</td>" 
		                      + "<td>" +  "已封鎖" + "</td>" 
		                      +"<tr>"
	}
	segment += "</table>";
	act_lockdata.innerHTML = segment;
}

function displayACT_nopass(responseData){
	var acts = JSON.parse(responseData);
	var segment = "<table class='table table-bordered'> <thead><tr> " 
	              + "<th>活動標題</th>"
	              + "<th>主辦方編號</th>"
	              +"<th>活動目前狀態</th>"
	              +"<th>控制活動</th>"
	              + "<tr></thead>";
	for(i = 0; i < acts.length; i++){
		var act = acts[i];
		segment += "<tr><td>" +  act.act_TITLE + "</td>" 
		                      + "<td>" +  act.member_ID + "</td>" 
		                      + "<td>" +  act.act_status.act_STATUS_NAME + "</td>" 
		                      + "<td>" +  "<a href=javascript:PopupPic('actid="+act.act_ID+"')>待審核</a>" + "</td>" 
		                      +"<tr>"
	}
	segment += "</table>";
	act_nopassdata.innerHTML = segment;
}

function displayACT_pass(responseData){
	var acts = JSON.parse(responseData);
	var segment = "<table class='table table-bordered'> <thead><tr> " 
	              + "<th>活動標題</th>"
	              + "<th>主辦方編號</th>"
	              +"<th>活動目前狀態</th>"
	              +"<th>控制活動</th>"
	              + "<tr></thead>";
	for(i = 0; i < acts.length; i++){
		var act = acts[i];
		segment += "<tr><td>" +  act.act_TITLE+ "</td>" 
		                      + "<td>" +  act.member_ID + "</td>" 
		                      + "<td>" +  act.act_status.act_STATUS_NAME + "</td>" 
		                      + "<td>" +  "查看詳細資料" + "</td>" 
		                      +"<tr>"
	}
	segment += "</table>";
	act_passdata.innerHTML = segment;
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
            <h1 class="mb-3 bread">活動管理</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">後臺主頁 <i class="ion-ios-arrow-forward"></i></a></span> <span>活動管理頁面 <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>
    <br>
     <jsp:include page="/WEB-INF/views/fragment/topMVC_manager.jsp" />
     
            <div class="row" style="float:left;width:60%">
            
                <div class="container">
                
                    <h3 class="text-center">活動列表</h3>
                    <hr>                  
                    <br>
                    <div id="tabs">
                           <ul>
                             <li><a href="#act_data" >查看所有活動</a></li>
                             <li><a href="#act_lockdata" id="lock">已封鎖</a></li>
                             <li><a href="#act_nopassdata" id="nopass">未審核</a></li>
                             <li><a href="#act_passdata" id="pass">已通過</a></li>                            
                           </ul>
                    <div id='act_data'>                         
	                </div>
                    <div id='act_lockdata'>                         
	                </div>
	                <div id='act_nopassdata'>                         
	                </div>
	                 <div id='act_passdata'>                         
	                </div>
	                </div>
	                
<!--                     <table class="table table-bordered"> -->
<!--                         <thead> -->
<!--                             <tr> -->
<!--                                 <th>活動標題</th> -->
<!--                                 <th>主辦方編號</th>                                 -->
<!--                                 <th>活動目前狀態</th>                                -->
                                
<!--                                 <th>控制活動</th> -->
<!--                             </tr> -->
<!--                         </thead> -->
<!--                         <tbody> -->
<!--                               列出場地  -->
<%--                             <c:forEach var="act" items="${AllACT}"> --%>
<!--                                 <tr> -->
<!--                                     <td> -->
<%--                                         <c:out value="${act.ACT_TITLE}" /> --%>
<!--                                     </td> -->
<!--                                     <td> -->
<%--                                         <c:out value="${act.MEMBER_ID}" /> --%>
<!--                                     </td>                                   -->
<!--                                     <td> -->
<%--                                         <c:out value="${act.act_status.ACT_STATUS_NAME}" /> --%>
<!--                                     </td>      -->
                                                                  
<%--                                    <c:if test="${act.act_status.ACT_STATUS_ID !=5}">  --%>
<!--                                     <td><a href=javascript:PopupPic('actid=${act.ACT_ID}')>審核</a> -->
<!--                                     &nbsp;&nbsp; -->
<%--                                     <a href="Manager_ACT_lock?actid=${act.ACT_ID}">封鎖</a> --%>
<!--                                     </td> -->
<%--                                     </c:if> --%>
<%--                                     <c:if test="${act.act_status.ACT_STATUS_ID ==5}">  --%>
<!--                                     <td>已封鎖，無法變更狀態</td> -->
<%--                                     </c:if> --%>
<!--                                 </tr> -->
<%--                             </c:forEach> --%>
<!--                             } -->
<!--                         </tbody> -->

<!--                     </table> -->
                </div>
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
        <script >
            function PopupPic(sURL) { 
                window.open("Manager_ACT_list_detail?"+sURL,"詳細資料","resizable=1,height=600,width=600,location=no"); 
            } 
            
            //載入畫面即列出表格
            var xhrr = new XMLHttpRequest();
            xhrr.open('GET', "<c:url value='/ACT_LIST' />", true);			  
            xhrr.send();
            xhrr.onload = function() {
              // 伺服器請求完成
              if (xhrr.readyState == 4 && xhrr.status == 200) {
              	console.log(JSON.parse(xhrr.responseText));
              	var acts = JSON.parse(xhrr.responseText);
              	var segmentt = "<table class='table table-bordered'> <thead><tr> " 
              	              + "<th>活動標題</th>"
              	              + "<th>主辦方編號</th>"
              	              +"<th>活動目前狀態</th>"
              	              +"<th>控制活動</th>"
              	              + "<tr></thead>";
              	for(i = 0; i < acts.length; i++){
              		var act = acts[i];
              		segmentt += "<tr><td>" +  act.act_TITLE + "</td>" 
              		                      + "<td>" +  act.member_ID + "</td>" 
              		                      + "<td>" +  act.act_status.act_STATUS_NAME + "</td>";
              	    if(act.act_status.act_STATUS_ID=='2' || act.act_status.act_STATUS_ID=='1' || act.act_status.act_STATUS_ID=='3'){
              	    	 segmentt += "<td>" +  "查看詳細資料" + "</td>" 
                           +"<tr>";
              	    }
              	    else if(act.act_status.act_STATUS_ID=='5'){
              	    	segmentt += "<td>" +  "已封鎖" + "</td>" 
                          +"<tr>";
              	    }
              	    else{
              	    	segmentt += "<td>" +  "<a href=javascript:PopupPic('actid="+act.act_ID+"')  style='text-decoration:underline;'>待審核</a>" + "</td>" 
                          +"<tr>";
              	    }
              	}
              	segmentt += "</table>";
              	act_data.innerHTML = segmentt;					
              }
            }
       </script>
</html>