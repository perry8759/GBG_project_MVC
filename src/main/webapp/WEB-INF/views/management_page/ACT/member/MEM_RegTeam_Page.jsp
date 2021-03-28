<!-- 已報名隊伍 03/25-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>已報名隊伍</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/fragment/topMVC_final.jsp" />

	<jsp:include page="/WEB-INF/views/fragment/sideOption.jsp" />

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('images/dylan-gillis-KdeqA3aTnBY-unsplash.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<h1 class="mb-3 bread">已報名隊伍</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">會員主頁 <i
								class="ion-ios-arrow-forward"></i></a></span><span class="mr-2"><a
							href="index.html">活動管理 <i class="ion-ios-arrow-forward"></i></a></span>
						<span>已報名隊伍</span>
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
											<td class="team_num">隊伍編號</td>
											<td>隊伍名稱</td>
											<td>單位名稱</td>
											<td>審核階段</td>
											<td>選項</td>
										</tr>
									</thead>

									<tbody>
										<form:form method="POST" modelAttribute="actBean">
											<form:hidden path="ACT_ID" />
											<c:forEach var="team" items="${actBean.teams}" varStatus="vs">
												<form:hidden path="teams[${vs.index}].match_team_id" />
												<form:hidden path="teams[${vs.index}].act_id.ACT_ID" />
												<tr class="game-list_row">
													<td class="game-list_site">
														<p class="game-list_summary_division">
															${team.match_team_id}
														</p>
													</td>
													<td class="game-list_site">
													<c:out value="${team.team_name}" /></td>
													<form:hidden path="teams[${vs.index}].team_name" />

													<td class="game-list_site">
													<c:out value="${team.team_unit}" /></td>
													<form:hidden path="teams[${vs.index}].team_unit" />
													
													<td class="game-list_time">
														<c:out value="${team.reg_status_id.regs_status_name}" />
													</td>
													
													<td class="game-list_focus">
														<c:forEach var="status"
															items="${RegStatus}">
															<form:radiobutton
																path="teams[${vs.index}].reg_status_id.reg_status_id"
																value="${status.reg_status_id}" />${status.regs_status_name}
														</c:forEach>
													</td>
												</tr>
											</c:forEach>
											<input type="submit" value="submit" />
										</form:form>
									</tbody>
									
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