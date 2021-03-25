<!-- 詳細活動資訊 03/24-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

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
                    <h1 class="mb-3 bread">賽事詳情</h1>
                    <p class="breadcrumbs">
                        <span class="mr-2"><a href="<c:url value="/"/>">首頁<i class="ion-ios-arrow-forward"></i></a></span> <span
                            class="mr-2">報名賽事<i class="ion-ios-arrow-forward"></i></span> <span class="mr-2">盃賽清單 <i
                                class="ion-ios-arrow-forward"></i></span> <span>賽事詳情</span>
                </div>
            </div>
        </div>
    </section>
    <section class="ftco-section act_main_list">
        <div class="container">
            <div class="row justify-content-center mb-5">
                <div class="act_title col-md-7 text-center heading-section ftco-animate">

                    <h2 class="mb-4"><c:out value="${ActBean.ACT_TITLE}" /></h2>
                </div>
            </div>
            <div class="container px-md-0 act_main_top">
                <div class="row">
                    <div class="col-12 align-items-stretch">
                        <div class="contact-wrap w-100 p-md-5 p-4">
                            <ul class="nav nav-tabs col-12" role="tablist">
                            	<li class="nav-item col-4">
                                	<a class="nav-link active" href="BasketballDoslist.html">活動簡介</a></li>
                                <li class="nav-item col-4">
                                	<a class="nav-link"  href="Tabletennis.html">賽程表</a></li>
                                <li class="nav-item col-4">
                                	<a class="nav-link"  href="<c:url value='/ACT/ACT_Qes?Actid=${ActBean.ACT_ID}'/>">留言板</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>


            <div id="act_detail_main">

                <div class="container px-md-0 col-md-12 act_itr">
                    <div class="row d-flex no-gutters">
                        <div class="col-md-6 offset-md-1 act_left">
                            <div class="row no-gutters align-items-center">



                                <div class="text ftco-animate act_itr_main">
                                    <div class="announcement">
                                        <span class="title">最新公告</span>
                                        <ul class="announcementList">
                                            <li><a href="#">
                                                    <time>2021.3.12</time>
                                                    <p class="cement-title">【爆卦】場地積水,主辦忘擬定備案,參加者恐成最大贏家</p>
                                                </a>
                                            </li>

                                        </ul>
                                    </div>
                                    <div class="act-mine">
                                        <span class="title">賽事資訊</span>
                                        <div class="act-1">
                                            <div>比賽地點</div>
                                            <ul class="mt-2">
                                            <a href="<c:url value='/DOS/DOS_detail?DOSID=${ActBean.dos_id.DOS_ID}'/>">
                                            	<span class="actsite">${ActBean.dos_id.DOS_NAME}</span>
                                            </a>
                                            </ul>
                                        </div><br>

    								<div class="act-1">
										<div>聯絡資訊</div>
										<ul class="name mt-2">
											<span class="mr-1">聯絡人:</span>
											<span>${MemberBean.member_real_name}</span>
										</ul>
										<ul class="phone">
											<span class="mr-1">室內電話:</span>
											<span>${MemberBean.member_fixed_line_telephone}</span>
										</ul>
										<ul class="line">
											<span class="mr-1">手機:</span>
											<span>${MemberBean.member_mobile_phone}</span>
										</ul>
										<ul class="email">
											<span class="mr-1">email:</span>
											<span>${MemberBean.member_email}</span>
										</ul>
									</div>

                                       	<div class="act-1">
										<div>可參加隊伍數</div>
										<ul class="teamnum mt-2">
											<span class="mr-1">隊伍數:</span>
											<span>${ActBean.ACT_MAX_PNUM}</span>
										</ul>
									</div>
                                        <div class="act-1">
                                            <div>賽事簡介</div>
                                            <ul class="trn mt-2"><span>就是一場比賽沒有任何反應</span></ul>
                                        </div>

                                        <div class="act-1">
										<div>報名費用</div>
										<ul class="prcie mt-2">
											<span> ${ActBean.ACT_PAY}/組 </span>
										</ul>
									</div>
                                        <div class="act-1">
                                            <div>報名簡章下載</div>
                                            <ul class="itr mt-2"><a download href="#">下載簡章</a></ul>
                                        </div>


                                    </div>


                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 act_right">





                            <div class="sign_situation d-flex justify-content-between ">

                                <div class="act_situation">
                                    <div><span>${ActBean.act_status.ACT_STATUS_NAME}</span></div>
                                </div>
                                <div class="act_btn">
                                    <a href="<c:url value='/ACT/ACT_reg?Actid=${ActBean.ACT_ID}'/>" class="btn apply_btn">報名活動</a>

                                </div>
                                <div class="act_btn">
                                    <a href="<c:url value='/ACT/ACT_follow/${ActBean.ACT_ID}'/>" class="btn apply_btn">關注賽事</a>

                                </div>
                                <br>

                            </div>
                            <div>活動編號:<span>${ActBean.ACT_ID}</span></div>







                            <div><span class="title">報名狀況</span>
                                <div class="signup_detail">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <th style="width: 150px;">組別</th>
                                                <th style="width: 100px;">隊伍上限</th>
                                                <th style="width: 90px;">已報名</th>
                                                <th>核准參賽</th>
                                            </tr>
                                            <tr class="tr_even">
                                                <th>
                                                    <div style="cursor:pointer;" onclick="window.location.href='#';">
                                                        社會男子單打
                                                    </div>
                                                </th>
                                                <th>36</th>
                                                <th>
                                                    <div style="cursor:pointer;" onclick="window.location.href='#';">40
                                                    </div>
                                                </th>
                                                <th>
                                                    <div style="cursor:pointer;" onclick="window.location.href='#';">36
                                                    </div>
                                                </th>
                                            </tr>
                                            <tr class="tr_odd">
                                                <th>
                                                    <div style="cursor:pointer;" onclick="window.location.href='#';">
                                                        社會女子單打
                                                    </div>
                                                </th>
                                                <th>36</th>
                                                <th>
                                                    <div style="cursor:pointer;" onclick="window.location.href='#';">24
                                                    </div>
                                                </th>
                                                <th>
                                                    <div style="cursor:pointer;" onclick="window.location.href='#';">20
                                                    </div>
                                                </th>
                                            </tr>
                                            <tr class="tr_even">
                                                <th>
                                                    <div style="cursor:pointer;" onclick="window.location.href='#';">
                                                        社會男子雙打
                                                    </div>
                                                </th>
                                                <th>16</th>
                                                <th>
                                                    <div style="cursor:pointer;" onclick="window.location.href='#';">20
                                                    </div>
                                                </th>
                                                <th>
                                                    <div style="cursor:pointer;" onclick="window.location.href='#';">16
                                                    </div>
                                                </th>
                                            </tr>

                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th colspan="2">參賽隊伍:72</th>
                                                <th colspan="2">參賽人數:94</th>

                                            </tr>
                                        </tfoot>
                                    </table>


                                </div>
                            </div>


                            <div class="apply-time">
                                <div><span class="title">行事曆</span>

                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
		</div>
    </section>
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/fragment/footer.jsp" />
</body>
</html>