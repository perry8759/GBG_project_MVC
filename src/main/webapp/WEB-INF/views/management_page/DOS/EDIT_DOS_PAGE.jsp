<!-- 編輯場地頁面 -->
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
</head>
<body>
<jsp:include page="/WEB-INF/views/fragment/topMVC_final.jsp" />
 <section class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/images_index/timo-wagner-RydQGTPRELQ-unsplash.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate pb-5 text-center">
            <c:if test="${dosBean.DOS_ID == null}">
            <h1 class="mb-3 bread">新增場地</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">場地管理頁面 <i class="ion-ios-arrow-forward"></i></a></span>新增場地 <span> <i class="ion-ios-arrow-forward"></i></span></p>
            </c:if>
            <c:if test="${dosBean.DOS_ID != null}">
            <h1 class="mb-3 bread">編輯場地</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">場地管理頁面 <i class="ion-ios-arrow-forward"></i></a></span>編輯場地 <span> <i class="ion-ios-arrow-forward"></i></span></p>
            </c:if>
          </div>
        </div>
      </div>
    </section>
                                                   
        
        <div class="siteadd-main">
        <section id="siteadd">
            <div class="container px-md-0">
                <div class="row d-flex no-gutters">
                    <div class="col-12 align-items-stretch">
                        <div class="contact-wrap w-100 p-md-5 p-4">
                             <h3 class="mb-4 heading" id="submit1">
                                <c:if test="${dosBean.DOS_ID != null}">
                                    編輯場地
                                </c:if>
                                <c:if test="${dosBean.DOS_ID == null}">
                                    新增場地
                                </c:if>
                            </h3>
                            <form:form   modelAttribute="dosBean" method="POST" >
                            <c:if test="${dosBean.DOS_ID != null}">
                                  <form:hidden path="DOS_ID"/>                           
                            </c:if>                           
                                <div class="row jsutify-content-center">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label class="label" for="sitename">場地名稱
                                                <form:input path="DOS_NAME" type="text" class="form-control" name="sitename" id="dosname" placeholder="場地名稱"/></label>
                                        </div>
                                    </div>
                                    <div class="col-md-2 offset-md-1">
                                        <div class="form-group">
                                            <label class="label w-50" for="sitecost">租場費用
                                                <form:input path="DOS_PAY" type="text" class="form-control" name="sitecsot" id="doscost" placeholder="租場費用"/></label>
                                        </div>
                                    </div>
                                    <div class="col-md-2 offset-md-.5">
                                        <div class="form-group">
                                            <label class="label" for="accommodate">容納人數
                                                <form:input path="DOS_CY" type="text" class="form-control" name="accommodate" id="accommodate" placeholder="容納人數"/></label>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="label" for="phone" id="connection">聯絡方式
                                                <form:input path="DOS_PHONE" type="text" class="form-control" name="phone" id="phone" placeholder="手機"/>
                                            </label>
                                            <label class="label" for="line" id="line">
                                                <form:input path="DOS_OFFICER" type="text" class="form-control" name="line" id="officer" placeholder="聯絡人"/>
                                            </label>
                                            <label class="label" for="line" id="line">
                                                <form:input path="DOS_AD" type="text" class="form-control" name="line" id="ad" placeholder="管理人"/>
                                            </label>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label class="label" for="address" id="traffic">場地地址</label>
                                            <form:input path="DOS_ADDR" type="text" class="form-control w-50" name="address" id="address" placeholder="地址"/>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label class="label" for="sport" id="sport">運動種類</label>
                                            <div>
                                            <form:select path="dos_sport.DOS_SPORT_ID" type="text" class="form-control " name="sport" id="sport" items="${dos_sport}" itemLabel="DOS_SPORT_NAME" itemValue="DOS_SPORT_ID" >
							                </form:select>
							                </div>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label class="label" for="#">場地簡介</label>
                                            <form:textarea path="DOS_PS" name="
                                        site_introduction" class="form-control" id="site_introduction" cols="20" rows="4" placeholder="場地簡介"/></textarea>
                                        </div>
                                    </div>
                                     <div class="col-md-8">
                                        <div class="form-group">
                                            <label class="label" for="#">交通方式</label>
                                            <form:textarea path="DOS_TRANS" name="
                                        site_introduction" class="form-control" id="site_trans" cols="20" rows="4" placeholder="交通方式"/></textarea>
                                        </div>
                                    </div>
                                                                        
                                    <div class="col-md-12">
                                        <div class="form-group ">
                                            <input type="submit" value="送出" class="btn btn-primary">
                                            <div class="submitting"></div>
                                        </div>
                                    </div>
                                </div>
                                </form:form>                                                         
                        </div>
                    </div>
                </div>
            </div>
           
        </section>
    </div>
   <script>
   $(document).ready(function(){
	   $('#submit1').click(function(){
	         $('#dosname').attr('value',"百齡球場");
	         $('#doscost').attr('value',"100");
	         $('#accommodate').attr('value',"200");
	         $('#phone').attr('value',"09123456");
	         $('#officer').attr('value',"金城舞");
	         $('#ad').attr('value',"陳曉明");
	         $('#address').attr('value',"台北市士林區通河東街一段158號");
	         $('#site_introduction').val("場地尺寸 \r有伸縮座椅:60m*29.5m \r無伸縮座椅:76m*41.5m \r固定座位數 \rB1（地下室）　無設置固定座位，由廠商自行規劃 伸縮座椅　　　\r總計2,486個座位 二樓　　　　　\r總計6,137個座位 三樓　　　　　\r總計3,854個座位 總計12,477個座位");
	         $('#site_trans').val("為提倡桌球運動風氣，將賽程分兩階段實施，以擴大推廣運動人口，培植有潛力的學生，\r提升運動競賽技術水準，促進學生身心健康及增進同學之情誼");
	      
	       });
	  });
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