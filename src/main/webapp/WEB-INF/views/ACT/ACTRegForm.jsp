<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>報名活動表單</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/topMVC_final.jsp" />

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('<c:url value="/images_index/hero-1.jpg"/>');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<h1 class="mb-3 bread">報名表單</h1>
					<p class="breadcrumbs">
						<span class="mr-2"> <a href="/">首頁<i
								class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2">報名賽事<i
							class="ion-ios-arrow-forward"></i></span> <span class="mr-2">盃賽清單<i
							class="ion-ios-arrow-forward"></i></span> <span class="mr-2">賽事詳情
							<i class="ion-ios-arrow-forward"></i>
						</span> <span>報名表單</span>
				</div>
			</div>
		</div>
	</section>


	<div class="act_reg">
		<section>
			<div class="container px-md-0">
				<div class="row d-flex no-gutters">
					<form:form method="POST" modelAttribute="RegVo">
						<div class="col-12 align-items-stretch">

							<div class="act_reg_box contact-wrap w-100 p-md-5 p-4">
								<h3 class="mb-4 heading" id="fake">填寫表單</h3>
								<form:hidden path="match_team_id" />
								<dl class="act_from_content">
									<div class="act_form_item">
										<dt>隊伍名稱</dt>
										<dd>
											<div class="act_input">
												<form:input path="team_name" class="form-control"
													value="${RegVo.team_name}" />
											</div>
										</dd>
									</div>
									<div class="act_form_item">
										<dt>單位名稱</dt>
										<dd>
											<div class="act_input">
												<form:input path="team_unit" class="form-control"
													value="${RegVo.team_unit}" />
											</div>
										</dd>
									</div>
									<div class="act_form_item">
										<dt>聯絡人</dt>
										<dd>
											<div>
												<span> ${sessionScope.LoginOK.member_user_name}</span>
											</div>
										</dd>
									</div>
									<div class="act_form_item">
										<dt>電子信箱</dt>
										<div>
											<span> ${sessionScope.LoginOK.member_email}</span>
										</div>
									</div>
									<div class="act_form_item">
										<dt>電話</dt>
										<div>
											<span> ${sessionScope.LoginOK.member_mobile_phone}</span>
										</div>
									</div>
									<div class="act_form_item">
										<dt>報名活動</dt>
										<div>
											<span> ${ActBean.ACT_TITLE}</span>
											<form:hidden path="act_id"
												value="${ActBean.ACT_ID}" />
										</div>
									</div>
								</dl>
							</div>

							<div class="act_reg_box contact-wrap w-100 p-md-5 p-4">
								<h3 class="mb-4 heading" id="mem_fake">隊員資料</h3>
								<div class="container px-md-0">
									<div class="row d-flex no-gutters">
										<c:forEach var="member" items="${RegVo.members_account}"
											varStatus="vs">
											<!-- 									======= -->
												<div class="col-md-4 players_box">
													<table>
														<tbody>
															<tr>
																<td class="team_member">
																	<div>
																		<table>
																			<tbody>
																				<tr>
																					<td class="list_title">帳號:</td>
																					<td><form:input
																							path="members_account[${vs.index}]"
																							class="form-control"
																							value="${member}" 
																							id="account" /></td>
																				</tr>
																				<c:if test="${action eq 'insert'}">
																					<tr>
																						<td class="list_title">姓名:</td>
																						<td><input id="team_player" type="text"
																							class="player_name"></td>
																					</tr>
																					<tr>
																						<td class="list_title">性別:</td>
																						<td><select name="player_gender">
																								<option value="1">男</option>
																								<option value="0">女</option>
																						</select></td>
																					</tr>
																					<tr>
																						<td class="list_title">球衣號碼:</td>
																						<td><input id="player_num" type="text"
																							class="player_num"></td>
																					</tr>
																					<tr>
																						<td class="list_title">連絡電話:</td>
																						<td><input id="player_pho" type="text"
																							class="player_phone"></td>
																					</tr>
																				</c:if>
																			</tbody>
																		</table>
																	</div>
																</td>
																<td></td>
															</tr>
														</tbody>
													</table>
												</div>
											<!--                                     ============= -->
										</c:forEach>
										<div class="col-md-12">
											<div class="form-group ">
												<input type="submit" value="送出" class="btn btn-primary">
												<div class="submitting"></div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</form:form>
				</div>
			</div>
		</section>
	</div>

	<jsp:include page="/WEB-INF/views/fragment/footer.jsp" />
<script>
$(document).ready(function(){
 $('#fake').click(function(){
	 $('#team_name').attr('value',"java015");
	  $('#team_unit').attr('value',"National Taipei University of Technology");	
     });
 $('#mem_fake').click(function(){
	  $('#team_player').attr('value',"康堉恮");
	  $('#player_num').attr('value',"15");
	  $('#player_pho').attr('value',"0912345678");
	  $('#account').attr('value',"gbgtest06");
     });
});
</script>
</body>
</html>