<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<style type="text/css">
	#main {
		position:relative;
		top: 50px;
	    width:100%;
	    text-align:center;
	}
	#content {
	  
	  border: 2px;
	  width: 500px ;
	  margin-left: 450px ;
	  margin-right: auto ;
	  margin-top: 200px;
	  
	  
	}
	
	img{
		width: 100px;
		height: 40px;
		margin-left: 650px;
	  	margin-right: auto ;
	  	margin-top: 20px;
		
	}
	
	#inputText{
		width: 180px;
		colspan: 2;
		align: LEFT;
	}
	
	body {
	  background-image: url('/MemberSystem/images/2299.jpg');
	  background-repeat: no-repeat;
	  background-attachment: fixed;
	  background-size: cover;
	  
	}
	table{
		border-width: 2;
		background: #0000;
		width: 500px;
		border-style: inset;
		border-color: #000;
	  	border-radius: 30px;
	  	background-color: rgba(255, 200, 200, 0.8);
	
	}
</style>
</head>
<body>
	<form action="login" method="POST">
  <div id='content'>
    <table>
         <tr>
             <th width="180">&nbsp;</TH>
             <th width="180">&nbsp;</TH>
         </tr>
         <tr>
         </tr>
         <tr height='10'>
             <TD align="CENTER" colspan='2'>&nbsp;</TD>
         </tr>
         <tr>
             <td width="180" align="right">User Name：　</TD>
             <td id='inputText'>
             	<input  type="text" name="userId" size="20" value="${userId}">
             <td>${AccountEmptyError}</td>
         </tr>
         <tr>
             <td width="180" align="right">Password：　</td>
             <td id='inputText' >
             	<input  type="password" name="pswd"  size="20" value="${pswd}">
             </td>
             <td>${PasswordEmptyError}</td>
         </tr>  
        <tr>
	        <td colspan="2" align="center">
	        	<input type="submit" value="Login">
	        </td>
        </tr>
        <tr>
        	<td>${LoginError}</td>
        </tr>
    </table>
  </div>
</form>
</body>
</html>