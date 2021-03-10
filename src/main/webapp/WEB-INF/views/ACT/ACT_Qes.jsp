<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.custom {
	box-shadow: inset 0px 0px 5px 1px #000;
	　
}

.searchform {
	border: 1px solid red;
	z-index: 2;
	top: 30%;
	padding: 10px 10px;
	width: 50%;
	background-color: rgba(255, 255, 255, 0.95);
	background-size: 100% auto;
	border-radius: 10px;
	box-shadow: 0px 0px 800px rgba(0, 0, 0, 0.5);
}

.search {
	border: 1px solid red;
	float: left;
	width: calc(100% -150px);
}

.container {
	width: 80%;
	height: auto;
	display: flex;
	flex-direction: row;
	flex-flow: wrap;
	margin: 20px auto;
}

.dos {
	position: relative;
	font-size: 20px;
	vertical-align: top;
	padding: 10px 10px 15px;
	margin: 0px 1% 40px 1%;
	width: calc(85%/ 3);
	color: #333333;
	background-color: #FFFFFF;
	box-shadow: 0px 0px 15px rgb(0 0 0/ 20%);
	box-sizing: border-box;
	cursor: pointer;
}

@media ( max-width :700px) {
	.dos {
		width: calc(85%/ 2);
	}
}

@media ( max-width :550px) {
	.dos {
		width: 100%;
	}
}

.Image {
	position: relative;
	width: 100%;
}

.CMContent {
	border: 1px solid red;
	margin: 20px;
}

.CMDiv {
	border: 1px solid red;
	margin: 0px auto;
	padding: 35px;
	width: 100%;
	max-width: 900px;
	height: auto;
}

.Item {
	float: left;
	position: relative;
	display: flex;
	flex-direction: row;
	flex-flow: wrap;
	margin: 0px 5px 5px 0px;
	padding: 10px;
	width: calc(50% - 8px);
	font-size: 15px;
}

.Item select {
	width: 100%;
	padding: 10px 8px 10px 10px;
	border-radius: 5px;
	background-color: #00c2a9;
}

.divform {
	float: left;
	width: calc(100% - 140px);
}
</style>

<title>所有活動留言</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/topMVC.jsp" />
	<div class="alert alert-light" role="alert">
		<a href="<c:url value='ACT_QesForm?Actid=${Actid}'/>"
			class="alert-link justify-content-end">新增留言</a>
	</div>
	<div class="container">
		<c:forEach var="qes" varStatus="statusX" items="${Qes}">
			<div class="dos">
				<div class="thumbnail custom">
					<div class="caption">
						<h3>發言者: ${qes.key}</h3>
						<c:forEach var="comment" varStatus="statusX" items="${qes.value}">
							<p>發問: ${comment}</p>
						</c:forEach>
					</div>
				</div>
			</div>

		</c:forEach>
	</div>
</body>
</html>