<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input  id="parentIframe" type="hidden"  onclick="opener.window.location.reload();self.close();return false;" value=''/>
</body>
<script>
//一秒後模擬點擊
	setTimeout(function() {
		// IE
		if(document.all) {
			document.getElementById("parentIframe").click();
		}
		// 其它瀏覽器
		else {
			var e = document.createEvent("MouseEvents");
			e.initEvent("click", true, true);
			document.getElementById("parentIframe").dispatchEvent(e);
		}
	}, 1000);
</script>


</html>