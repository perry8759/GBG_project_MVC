<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>act_Detail</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/topMVC_final.jsp" />
	<!-- END header -->
	 <section class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/images_index/hero-1.jpg');"
        data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text align-items-end justify-content-center">
                 <div class="col-md-9 ftco-animate pb-5 text-center">
                    <h1 class="mb-3 bread">賽程表</h1>
                    <p class="breadcrumbs">
                        <span class="mr-2"><a href="index.html">首頁<i class="ion-ios-arrow-forward"></i></a></span> <span
                            class="mr-2">報名賽事<i class="ion-ios-arrow-forward"></i></span> <span class="mr-2">盃賽清單 <i
                                class="ion-ios-arrow-forward"></i></span> <span>賽程表</span>
                </div>
            </div>
        </div>
    </section>
    
    <section class="ftco-section act_schedule">
        <div class="container">
            <div class="row justify-content-center mb-5">
                <div class="col-md-12 text-center heading-section ftco-animate">
                    <span class="subheading">Schedule</span>
                    <h2 class="mb-4">賽程表</h2>
                    <div class="col-12 align-items-stretch">
                        <div class="container px-md-0 act_main_top">
                <div class="row">
                    <div class="col-12 align-items-stretch">
                        <div class="contact-wrap w-100 p-md-5 p-4">
                            <ul class="nav nav-tabs col-12" role="tablist">
                            	<li class="nav-item col-4">
                                	<a class="nav-link " href="">活動簡介</a></li>
                                <li class="nav-item col-4">
                                	<a class="nav-link active"  href="<c:url value='/ACT/MATCH_ACT_sch?Actid=${ActBean.ACT_ID}'/>">賽程表</a></li>  
                                <li class="nav-item col-4">
                                	<a class="nav-link"  href="<c:url value='/ACT/ACT_Qes?Actid=${ActBean.ACT_ID}'/>">留言板</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
                  <c:forEach var="round" begin="1" end="${round}" step="1" varStatus="s">
                        <div class=" bg-white text-dark border-bottom border-top matches">
                            <div class="row justify-content-center pt-3 pb-0 pt-md-3 pb-md-3 match_row mx-0">
                                <div class="col-lg-12 col-12 ">
                                    <div class="row mx-0">
                                        <div class="col-lg-1 col-12 text-center align-self-center match_row_datetime">
                                            <c:forEach var="round_pairr" items="${match_all_round[s.index-1]}" varStatus="sss">
                                            <c:if test="${sss.index==1}"> 
                                            <h5>${round_pairr.match_id.match_O_month+1}/${round_pairr.match_id.match_O_day}</h5>
                                            <h5>${round_pairr.match_id.match_O_hour}:${round_pairr.match_id.match_O_min}</h5>
                                            </c:if>
                                            </c:forEach>
                                        </div>
                                        <div class="col-lg-3 col-2 align-self-center text-right  px-0">
                                            <c:forEach var="round_pairr" items="${match_all_round[s.index-1]}" varStatus="sss">
                                            <c:if test="${sss.index==0}"> 
                                            <h6>${round_pairr.match_team_id.team_name}</h6>
                                            <span>第${round_pairr.match_id.match_round}輪/${round_pairr.match_id.match_seq}場次</span>
                                            </c:if>
                                            </c:forEach>
                                        </div>

                                        <div class="col-lg-4 col-8 align-self-center px-0">
                                            <div class="row mx-0 ">
                                                <div
                                                    class="col-md-4 col-3 text-dark text-right align-self-center mt-md-3 mt-3  pl-4 ">
                                                    <c:forEach var="round_pairr" items="${match_all_round[s.index-1]}" varStatus="sss">
                                                    <c:if test="${sss.index==0}"> 
                                                    <h6>${round_pairr.match_pair_score}</h6>
                                                    </c:if>
                                                    </c:forEach>
                                                </div>
                                                <div class="col-md-4 col-6 text-center align-self-center">
                                                    <h7>VS</h7><br>
                                                    <!-- 活動編號 -->
                                                    <h7>${ActBean.ACT_TITLE}</h7>
                                                </div>
                                                <div
                                                    class="col-md-4 col-3 text-dark text-left align-self-center mt-md-3 mt-3 pr-4 opacity-5 ">
                                                    <c:forEach var="round_pairr" items="${match_all_round[s.index-1]}" varStatus="sss">
                                                    <c:if test="${sss.index==1}"> 
                                                    <h6>${round_pairr.match_pair_score}</h6>
                                                    </c:if>
                                                    </c:forEach>                                                   
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-2 align-self-center text-md-left px-0">
                                            <c:forEach var="round_pairr" items="${match_all_round[s.index-1]}" varStatus="sss">
                                            <c:if test="${sss.index==1}"> 
                                            <h6>${round_pairr.match_team_id.team_name}</h6>
                                            <span>第${round_pairr.match_id.match_round}輪/${round_pairr.match_id.match_seq}場次</span>
                                            </c:if>
                                            </c:forEach>
                                        </div>
                                        

                                    </div>
                                </div>
                            </div>



                        </div>
                          </c:forEach>


                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/fragment/footer.jsp" />
</body>
</html>