<!-- 管理活動頁面 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
	});
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/fragment/topMVC.jsp" />

	<jsp:include page="/WEB-INF/views/fragment/topMVC_member.jsp" />

	<div class="row" style="float: left;">

		<div class="container">

			<h3 class="text-center">已報名隊伍列表</h3>
			<hr>
			<br>
			<div id="tabs">
				<ul>
					<li><a href="#tabs-1">審核中</a></li>
					<li><a href="#tabs-2">未繳款</a></li>
					<li><a href="#tabs-3">繳款完成</a></li>
					<!--  篩選功能還未做 -->
				</ul>
			</div>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>隊伍名稱</th>
						<th>單位名稱</th>
						<th>審核階段</th>
						<th>選項</th>
					</tr>
				</thead>
				<tbody>
				
				<form:form  method="POST" modelAttribute="actBean">
					<form:hidden path="ACT_ID"/>
					<c:forEach var="team" items="${actBean.teams}" varStatus="vs">
						<form:hidden path="teams[${vs.index}].match_team_id"/>
						<form:hidden path="teams[${vs.index}].act_id.ACT_ID"/>
						<tr>
							<td><c:out value="${team.team_name}" /></td>
							<form:hidden path="teams[${vs.index}].team_name"/>
							<td><c:out value="${team.team_unit}" /></td>
							<form:hidden path="teams[${vs.index}].team_unit"/>
							<td><c:out value="${team.reg_status_id.regs_status_name}" /></td>
							<td>
							<c:forEach var="status" items="${RegStatus}">
								<form:radiobutton path="teams[${vs.index}].reg_status_id.reg_status_id"
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
</body>

</html>