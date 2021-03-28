<!-- 歷史問答紀錄 03/25-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>歷史問答紀錄</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/topMVC_final.jsp" />
	
	<jsp:include page="/WEB-INF/views/fragment/sideOption.jsp" />
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('${pageContext.request.contextPath}/images_index/dylan-gillis-KdeqA3aTnBY-unsplash.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<h1 class="mb-3 bread">歷史問答紀錄</h1>
					<p class="breadcrumbs">
						<span class="mr-2"> <a href="index.html">會員主頁 <i
								class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"> <a
							href="index.html">活動管理 <i class="ion-ios-arrow-forward"></i></a></span>
						<span>歷史問答紀錄</span>
					</p>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section sign_up_team">
		<div class="container">
			<div class="row justify-content-center mb-5">
				<div class="col-md-7 text-center heading-section ftco-animate">
				</div>
			</div>

		</div>
	</section>

	<section class="ftco-section sign_up_list">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="row">
						<div class="col-md-12">
							<div class="sign-up-wrap">
								<table class="game-list">
									<thead>
										<tr class="game-list_head">
											<td>比賽名稱</td>
											<td>發言內容</td>
											<td>選項</td>
										</tr>
									</thead>
									<c:forEach var="act_qes" items="${AllQes}">
										<tbody>
											<c:forEach var="qes" varStatus="vs" items="${act_qes.value}">
												<tr class="game-list_row">
													<td class="game-list_site"><c:if test="${vs.index==0}">
															<c:out value="${act_qes.key.ACT_TITLE}" />
														</c:if> <c:if test="${vs.index!=0}">

														</c:if></td>
													<td class="game-list_name"><p>${qes.value}</p></td>
													<td class="game-list_focus"><a
														href="<c:url value='/ACT/ACT_QesEditForm?qesid=${qes.key.ACT_QES_ID}'/>">修改留言</a>
														<a
														href="<c:url value='/ACT/ACT_QesDelete?qesid=${qes.key.ACT_QES_ID}'/>">刪除留言</a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
					<jsp:include page="/WEB-INF/views/fragment/page.jsp" />
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/fragment/footer.jsp" />
</body>
</html>