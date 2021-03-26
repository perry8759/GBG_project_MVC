<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add ProductComment</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css_product/STAR1.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
	<div class="container-fluid w-75">
		<div class="row my-5">
			<div class="col-6 mt-5">
				<img width="100%" height="500" src="<c:url value='/product/getCoverPicture?pId=${product.product_id}'/>">
			</div>
			<div class="col-6 mt-5">
				<form:form method='POST' modelAttribute="productCommentBean"
					class='form-horizontal'>
					<form:hidden path="productBean.product_id"  class="form-control"  />
					<h1>${product.product_title}</h1>
					<fieldset>
						<div>
							<label class="control-label col-lg-2 col-lg-2" style="word-break:keep-all" for='title'>
								您對商品的評分: </label>
							<div class="col-lg-10">
								<div class="ratings">
        <div class="empty-stars"></div>
        <div class="full-stars" id="1" style="width:100%"></div>
    </div>
    <div class="ratings">
        <div class="empty-stars" id="6"></div>
        <div class="full-stars"id="2" style="width:100%"></div>
    </div>
    <div class="ratings">
        <div class="empty-stars" id="7"></div>
        <div class="full-stars"id="3" style="width:100%"></div>
    </div>
    <div class="ratings">
        <div class="empty-stars" id="8"></div>
        <div class="full-stars"id="4" style="width:100%"></div>
    </div>
    <div class="ratings">
        <div class="empty-stars" id="9"></div>
        <div class="full-stars"id="5" style="width:100%"></div>
    </div>
    	<form:input id="cc" path="comment_value" type='number' min="1" max="5" class='form:input-large' value="5" style="visibility:hidden"/>
							</div>
							<!-- 					<div class="ratings"> -->
							<!-- 						<div class="empty-stars"></div> -->
							<!-- 						<div class="full-stars" style="width: 70%"></div> -->
							<!-- 					</div> -->
						</div>
						<div>
							<label class="control-label col-lg-2 col-lg-2"style="word-break:keep-all" for='title'>
								您對商品的評論: </label><br>
							<form:textarea id="comment_comment" path="comment_comment"
								 rows="10" cols="60" />
						</div>
						<div class="form-group">
							<div class='col-lg-offset-2 col-lg-10'>
								<input id="btnAdd" type='submit' class='btn btn-primary'
									value="送出評論" />
							</div>
						</div>
					</fieldset>
				</form:form>
			</div>
		</div>
	</div>
</body>
<script>
$(document).ready(function(){
       
            $('#5').click(function(){
 
               $(this).css({
                width : '100%'
                });
                
               $('#4').css({
                width : '100%'
                });
                
               $('#3').css({
                width : '100%'
                });
                
               $('#2').css({
                width : '100%'
                });
                
               $('#1').css({
                width : '100%'
                });
                $('#cc').attr("value","5");

             });
              $('#4').click(function(){
 
               $(this).css({
                width : '100%'
                });
                
               $('#5').css({
                width : '0%'
                });
                
               $('#3').css({
                width : '100%'
                });
                
               $('#2').css({
                width : '100%'
                });
                
               $('#1').css({
                width : '100%'
                });
                $('#cc').attr("value","4");

             });
              $('#3').click(function(){
 
               $(this).css({
                width : '100%'
                });
                
               $('#4').css({
                width : '0%'
                });
                
               $('#5').css({
                width : '0%'
                });
                
               $('#2').css({
                width : '100%'
                });
                
               $('#1').css({
                width : '100%'
                });
                $('#cc').attr("value","3");

             });
             
        $('#2').click(function(){
 
               $(this).css({
                width : '100%'
                });
                
               $('#4').css({
                width : '0%'
                });
                
               $('#3').css({
                width : '0%'
                });
                
               $('#5').css({
                width : '0%'
                });
                
               $('#1').css({
                width : '100%'
                });
                $('#cc').attr("value","2");

             });
             $('#1').click(function(){
 
                $(this).css({
                width : '100%'
                });
                
                $('#4').css({
                width : '0%'
                });
                
                $('#3').css({
                width : '0%'
                });
                
                $('#2').css({
                width : '0%'
                });
                
                $('#5').css({
                width : '0%'
                });
                $('#cc').attr("value","1");

                });
            $('#9').click(function(){
 
                    $('#5').css({
                    width : '100%'
                    });
                    
                    $('#4').css({
                    width : '100%'
                    });
                    
                    $('#3').css({
                    width : '100%'
                    });
                    
                    $('#2').css({
                    width : '100%'
                    });
                    
                    $('#1').css({
                    width : '100%'
                    });
                    $('#cc').attr("value","5");

                    });
        $('#8').click(function(){
                    
                    $('#5').css({
                    width : '0%'
                    });
                    
                    $('#4').css({
                    width : '100%'
                    });
                    
                    $('#3').css({
                    width : '100%'
                    });
                    
                    $('#2').css({
                    width : '100%'
                    });
                    
                    $('#1').css({
                    width : '100%'
                    });
                    $('#cc').attr("value","4");

                    });
        $('#7').click(function(){
                    
                    $('#5').css({
                    width : '0%'
                    });
                    
                    $('#4').css({
                    width : '0%'
                    });
                    
                    $('#3').css({
                    width : '100%'
                    });
                    
                    $('#2').css({
                    width : '100%'
                    });
                    
                    $('#1').css({
                    width : '100%'
                    });
                    $('#cc').attr("value","3");

                    });
            $('#6').click(function(){
                    $('#5').css({
                    width : '0%'
                    });
                    
                    $('#4').css({
                    width : '0%'
                    });
                    
                    $('#3').css({
                    width : '0%'
                    });
                    
                    $('#2').css({
                    width : '100%'
                    });
                    
                    $('#1').css({
                    width : '100%'
                    });
                    $('#cc').attr("value","2");

                    });
        });
</script>
</html>