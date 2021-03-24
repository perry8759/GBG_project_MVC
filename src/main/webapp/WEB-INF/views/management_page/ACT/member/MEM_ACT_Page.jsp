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

    <jsp:include page="/WEB-INF/views/fragment/topMVC_final.jsp" />
    
<%--      <jsp:include page="/WEB-INF/views/fragment/sideOption.jsp" /> --%>
     <section class="hero-wrap hero-wrap-2"
        style="background-image: url('${pageContext.request.contextPath}/images_index/dylan-gillis-KdeqA3aTnBY-unsplash.jpg');"
        data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text align-items-end justify-content-center">
                <div class="col-md-9 ftco-animate pb-5 text-center">
                    <h1 class="mb-3 bread">活動管理</h1>
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.html">會員主頁 <i
                                    class="ion-ios-arrow-forward"></i></a></span> <span>活動管理 </span>
                    </p>
                </div>
            </div>
        </div>
    </section>
<%--      <jsp:include page="/WEB-INF/views/fragment/topMVC_manager.jsp" /> --%>
 
<!--             <div class="row" style="float:left;"> -->
            
            <section class="ftco-section act_main_list">
        <div class="container">
            <div class="row justify-content-center mb-5">
                <div class="act_title col-md-7 text-center heading-section ftco-animate">

                    <h2 class="mb-4">我舉辦/參加的活動</h2>
                </div>
            </div>
            <div class="row justify-content-center mb-5">
                <div class="col-12 act_box">
                    <div class="container">
                        <div class="row justify-content-center mbt-5">
                            <c:forEach var="act" items="${AllACT}"> 
                            <div class="col-3 offset-md-1 act_mgt_main active">
                                <div class="act_main_img">
                                    <img src="${pageContext.request.contextPath}/images_index/joey-huang-1_R0BMGwiZI-unsplash.jpg" alt="">
                                </div>
                                <div class="cont">
                                    <h4 class="title fadeInUp">${act.ACT_TITLE}<a href="#"></a></h4>
                                    <ul class="desc fadeInUp">
                                        
                                        <li><a href="<c:url value='/ACT/ActEdit?actid=${act.ACT_ID}'/>">修改活動資訊</a></li>
                                        <li><a href="<c:url value='/ACT/CheckRegTeamState?actid=${act.ACT_ID}'/>">查看已報名隊伍</a></li>
                                        <li><a href="<c:url value='/ACT/EditActNew?actid=${act.ACT_ID}'/>">修改活動資訊</a></li>
                                        <li><a href="<c:url value='/MATCH_ACT_AllTeam?actid=${act.ACT_ID}'/>">新增/查看賽事資訊</a></li>
                                    </ul>
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>     
<!--                     <div id="tabs"> -->
<!--                            <ul> -->
<!--                              <li><a href="#tabs-1">報名進行中</a></li> -->
<!--                              <li><a href="#tabs-2">活動進行中</a></li> -->
<!--                              <li><a href="#tabs-3">已結束</a></li> -->
<!--                              篩選功能還未做 -->
<!--                            </ul> -->
<!--                     </div> -->

		<jsp:include page="/WEB-INF/views/fragment/footer.jsp" />
</body>
</html>