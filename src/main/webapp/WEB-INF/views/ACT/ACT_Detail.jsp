<!-- 詳細活動資訊 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>活動詳細</title>
<style type="text/css">
* {
	box-sizing: border-box;
}

#MainMenu {
	margin: 0px 0px 15px;
	border-bottom: solid 1px #DDDDDD;
}

#fun {
	float: right;
	position: relative;
	padding: 4px 0px;
}

#MainTitle {
	width: calc(100% - 200px);
	font-size: 35px;
}

@media ( max-width :500px) {
	.MainContnet {
		width: calc(100% -120px);
	}
}

a.booking {
	display: block;
	padding: 5px 10px 1px;
	background-color: rgb(255, 146, 7);
	line-height: 18px;
	text-align: center;
}

.SubTitle {
	float: left;
	font-size: 25px;
	color: #009582;
}

.MainTitleTxt {
	width: 100%;
}

.MainItem {
	margin-top: 20px;
	padding-top: 20px;
	width: calc(100%);
	border-top: solid 1px #DDDDDD;
	height: 100%;
}

.Tr {
	display: table-row;
}

.Tr .Td.Title {
	width: 150px;
	font-size: 20px;
	vertical-align: top;
}

.Tr .Td {
	display: table-cell;
	padding: 10px 10px 0px 0px;
	font-size: 17px;
	line-height: 26px;
}

.Content {
	margin-bottom: 10px;
	color: #555555;
	font-size: 17px;
}

.CTitle {
	float: left;
	width: 200px;
	line-height: 23px;
}

.CContent {
	float: left;
	width: calc(100% -200px);
	color: #777777;
}

.allPhoto {
	float: none;
	clear: both;
}

.img-fluid {
	float: left;
	margin: 0px 5px 10px 5px;
	width: calc(100%/ 5 - 10px);
	height: 130px;
	border: solid 1px #DDDDDD;
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/topMVC.jsp" />
	<div id="MainMenu">
	<div id="fun">
		<a href="<c:url value='/ACT/ACT_reg?Actid=${ActBean.ACT_ID}'/>" class="booking" >報名活動</a>
		<a href="<c:url value='/ACT/ACT_Qes?Actid=${ActBean.ACT_ID}'/>" class="booking" >留言板</a>
	</div>
		<h1 id="MainTitle" style="margin-top: 0px">
			<div class="MainTitleTxt">
				<c:out value="${ActBean.ACT_TITLE}" />
			</div>
		</h1>
	</div>
	<div class="MainContent" style="margin-top: 20px">
		<div class="MainItem">
			<div class="Tr">
				<h2 class="Td Title">比賽簡介</h2>
				<div class="Td">
					<div class="Content">
						<c:out value="${ActBean.ACT_DESC}" />
					</div>
				</div>
			</div>
			<div class="Tr">
				<h2 class="Td Title">主辦方名稱</h2>
				<div class="Td">
					<div class="Content">
						<c:out value="${ActBean.MEMBER_ID}" />
					</div>
				</div>
			</div>
			<div class="Tr">
				<h2 class="Td Title">球類類型</h2>
				<div class="Td">
					<div class="Content">
						<c:out value="${ActBean.dos_sport.DOS_SPORT_NAME}" />
					</div>
				</div>
			</div>
			<div class="Tr">
				<h2 class="Td Title">報名費用</h2>
				<div class="Td">
					<div class="Content">
						<c:out value="${ActBean.ACT_PAY}" />
					</div>
				</div>
			</div>
			<div class="Tr">
				<h2 class="Td Title">場地</h2>
				<div class="Td">
					<div class="Content">
						<c:out value="${ActBean.dos_id.DOS_NAME}" />
					</div>
				</div>
			</div>
		</div>
		<div class="MainItem">
			<div class="Tr">
				<h2 class="Td Title">人數限制</h2>
				<div class="Td">
					<div class="Content">
						<div class="CTitle">每隊最大上限人數</div>
						<div class="CContent">
							<c:out value="${ActBean.ACT_MAX_TEAM}" />
						</div>
					</div>
					<div class="Content">
						<div class="CTitle">最大上限人數</div>
						<div class="CContent">
							<c:out value="${ActBean.ACT_MAX_PNUM}" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="MainItem">
			<div class="Tr">
				<h2 class="Td Title">時程安排</h2>
				<div class="Td">
					<div class="Content">
						<div class="CTitle">開放報名時間</div>
						<div class="CContent">
							<c:out value="${ActBean.ACT_SIGN_O}" />
						</div>
					</div>
					<div class="Content">
						<div class="CTitle">報名截止時間</div>
						<div class="CContent">
							<c:out value="${ActBean.ACT_SIGN_C}" />
						</div>
					</div>
					<div class="Content">
						<div class="CTitle">活動開始時間</div>
						<div class="CContent">
							<c:out value="${ActBean.ACT_RUN_O}" />
						</div>
					</div>
					<div class="Content">
						<div class="CTitle">活動結束時間</div>
						<div class="CContent">
							<c:out value="${ActBean.ACT_RUN_C}" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="MainItem">
			<div class="Tr">
				<div class="Td">
					<div class="Content">
						<div class="CTitle">報名簡章</div>
						<div class="CContent">
							<a>文件下載</a>
<%-- 							<c:out value="${ActBean.ACT_MAX_TEAM}" /> --%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>