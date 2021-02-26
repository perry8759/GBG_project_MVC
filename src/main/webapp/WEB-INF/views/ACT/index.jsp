<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<html>
<head>
<title>Ajax</title>
<script src="./jquery.js"></script>
<script type="text/javascript">
    window.onload=ShowHello;
    setInterval(ShowHello, 3000);
    function ShowHello(){

		
			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath }/ajax',
				headers : {
					Accept : "application/json; charset=utf-8",
					"Content-Type" : "application/json; charset=utf-8"
				},
				dataType: "text",  //返回的資料類型
				 timeout: 1500, 
				async: false, // 異步請求
				success : function(result) {
					var dos = $.parseJSON(result);
					console.log(dos);
					var s = '';
					for(var i = 0; i < dos.length; i++) {
						s += 'Id: ' + dos[i].ID + '<br>';
						s += 'Name: ' + dos[i].NAME + '<br>';
						for(var y=0;y<dos[i].dos_pic_id.length;y++){
						    s += 'dos_pic_id: ' + dos[i].dos_pic_id[y]+ '<br>';
						}
						s += '----------------------<br>';
					}
					$('#result').html(s);
					
				}
			});
		

	}
</script>
</head>
<body>

	<h3>Return Object List in Ajax</h3>
	<form>
		<input type="button" value="Dislay" id="buttonDisplay">
		<br>
		<div id="result"></div>
	</form>

</body>
</html>