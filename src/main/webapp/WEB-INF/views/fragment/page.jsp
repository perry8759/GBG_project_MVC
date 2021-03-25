<!-- footer 03.24 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="row mt-5 mb-5">
		<div class="col text-center">
			<div class="block-sport-dos">
				<ul>
					<li><a
						href="?start=${pre}&sportid=${sportid}&state=${state.ACT_STATUS_ID}&order=${order}">&lt;</a></li>
					<c:forEach items="${allpage}" var="item">
						<li><a
							href="?start=${(item-1)*5}&sportid=${sportid}&state=${state.ACT_STATUS_ID}&order=${order}">${item}</a></li>
					</c:forEach>
					<li><a
						href="?start=${next}&sportid=${sportid}&state=${state.ACT_STATUS_ID}&order=${order}">&gt;</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>