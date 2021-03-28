<!-- 所有場地資訊 使用usebean 因無需要即時更新-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
     <jsp:useBean id="memberService" class="com.web.GBG_project.DOS.service.impl.DOSServiceImpl" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>

  <jsp:include page="/WEB-INF/views/fragment/topMVC_final.jsp" />
   <section class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/images_index/timo-wagner-RydQGTPRELQ-unsplash.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate pb-5 text-center">
            <h1 class="mb-3 bread">場地清單</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">首頁 <i class="ion-ios-arrow-forward"></i></a></span> <span>場地清單 <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>
<!--     ============================= -->
 <section class="ftco-section ftco-degree-bg">
    <div class="container-fluid">
      <div class="position-relative pt-10 pb-8">
        <div class="header-text">
          <div class="d-flex justify-content-center">
            <form action="<c:url value='/DOS/search_dos'/>" class="search-box">
              <div class="input-form">
                <input type="text" placeholder="想去哪裡打球?">
              </div>
              <div class="select-form">
                <div class="select-itms">
                  <select name="select" id="select1">
                    <option value="">台北市</option>
                    <option value="">新北市</option>
                    <option value="">台南市</option>
                    <option value="">高雄市</option>
                  </select>
                </div>
              </div>
              <div class="search-form-dos">
                <button class="btn">
                  Search
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <div class="container px-md-0">
      <div class="row">
        <div class="col-12 align-items-stretch">
          <div class="contact-wrap w-100 p-md-5 p-4">
            <ul class="nav nav-tabs col-12" role="tablist">
              <li class="nav-item col-4"><a class="nav-link" data-toggle="tab" role="tab" aria-selected="false"
                  href="BasketballDoslist.html">籃球</a></li>
              <li class="nav-item col-4"><a class="nav-link" data-toggle="tab" role="tab" aria-selected="false"
                  href="Tabletennis.html">桌球</a></li>
              <li class="nav-item col-4"><a class="nav-link active" data-toggle="tab" role="tab" aria-selected="true"
                  href="VolleyballDoslist.html">排球</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="container">
      <div class="row">
<!--       --------------------- -->
        <div class="col-md-12">
          <div class="row">
            <div class="col-md-4 d-flex">
              <div class="site ftco-animate">
                <div class="img d-flex align-items-center justify-content-center"
                  style="background-image: url(images/volleyball-1.jpg);">
                  <div class="desc">
                    <p class="meta-prod d-flex">
                      <a href="#" class="d-flex align-items-center justify-content-center"><span
                          class="flaticon-writing"></span></a>
                      <a href="#" class="d-flex align-items-center justify-content-center"><span
                          class="flaticon-heart"></span></a>
                      <a href="#" class="d-flex align-items-center justify-content-center"><span
                          class="flaticon-view"></span></a>
                    </p>
                  </div>
                </div>
                <div class="text text-center">
                  <span class="category">新莊體育場</span>
                  <h2>參加人數:9</h2>
                  <p class="mb-0"><span class="price price">$529.00</span></p>
                </div>
              </div>
            </div>
            </div>
            <jsp:include page="/WEB-INF/views/fragment/page.jsp" />
        </div>
     <!--       --------------------- -->
      </div>
    </div>
  </section>

  <jsp:include page="/WEB-INF/views/fragment/footer.jsp" />
  <script src="${pageContext.request.contextPath}/js_index/jquery.nice-select.min.js"></script>    
  <script>
  jQuery(document).ready(function($){
	    $('select').niceSelect();
	});
  
  </script> 
<script>

</script>
</body>
</html>