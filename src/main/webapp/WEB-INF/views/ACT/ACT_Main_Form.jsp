<!-- 建立活動表單 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.act_org .heading{
    text-align:center;
    margin-top: 5rem;
        font-weight: 700;
        text-transform: uppercase;
        color: black;
}
.act_org{
    margin: 0 100px;
}
.act_from_content input{
    padding: 0 1rem;
    border-bottom: 1px solid rgba(117, 117, 117, 0.507);
    color: rgb(0, 0, 0);
    font-size: 20px;
}
.act_from_content span{
    padding: 0 1rem;
    color: rgb(0, 0, 0);
    font-size: 20px;
}

.act_from_content dt{
    font-size: 25px;
}


.act_Introduction{
    width: 70%;
}


.act_org .act_org_timetable{
    border: 1px solid #000;
    height: 500px;
    margin-top: 3rem;

}
}
</style>

<script src="${pageContext.request.contextPath}/js_index/jquery.js"></script>
 <script src="${pageContext.request.contextPath}/css_index/jquery.datetimepicker.full.min.js"></script> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css_index/jquery.datetimepicker.css" >

</head>
<body>
<jsp:include page="/WEB-INF/views/fragment/topMVC_final.jsp" />    
  <section class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/images_index/timo-wagner-RydQGTPRELQ-unsplash.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text align-items-end justify-content-center">
                <div class="col-md-9 ftco-animate pb-5 text-center">
                    <h1 class="mb-3 bread">活動主辦表單</h1>
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.html">首頁 <i class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2">場地清單 <i class="ion-ios-arrow-forward"></i></span><span>場地頁面 <i class="ion-ios-arrow-forward"></i></span></p>
                </div>
            </div>
        </div>
    </section>





<div class="act_org">
   
        <section>
         <form:form  method="POST" modelAttribute="actBean" enctype="multipart/form-data">
            <div class="container px-md-0">
                <h3 class="mb-4 heading">主辦活動</h3>
                <div class="row d-flex no-gutters">
                
                    <div class="col-8 align-items-stretch">
                        <div class="act_org_box contact-wrap w-100 p-md-5 p-4">
                                <form>
                                <form:hidden path="MEMBER_ID"  class="form-control"  />
                                <form:hidden path="ACT_ID"  class="form-control"  />
                                <form:hidden path="dos_id.DOS_ID"  class="form-control"  />
                                <dl class="act_from_content">
                                    <div class="act_form_item">
                                        <dt id="submit1">活動標題</dt>
                                        <dd>
                                            <div class="act_input">
                                                <form:input path="ACT_TITLE"  class="form-control"  id="act_title"/>
                                            </div>
                                        </dd>
                                    </div>
                                     <div class="act_form_item">
                                        <dt>參加隊伍上限</dt>
                                        <dd>
                                            <div class="act_input">
                                                <form:input path="ACT_MAX_TEAM"  class="form-control"  id="act_max_team"/>
                                            </div>
                                        </dd>
                                    </div>
                                    <div class="act_form_item">
                                        <dt>最大上限人數</dt>
                                        <dd>
                                            <div class="act_input">
                                                <form:input path="ACT_MAX_PNUM"  class="form-control"  id="act_max_pnum"/>
                                            </div>
                                        </dd>
                                    </div>
                                    <div class="act_form_item">
                                        <dt>報名費用</dt>
                                        <dd>
                                            <div class="act_input">
                                                <form:input path="ACT_PAY"  class="form-control"  id="act_pay"/>
                                            </div>
                                        </dd>
                                    </div>
                                    <div class="act_form_item">
                                        <dt>球類類型</dt>
                                        <dd>
                                            <div class="ball_select">
                                                <form:select path="dos_sport.DOS_SPORT_ID" items="${dos_sport}" itemLabel="DOS_SPORT_NAME" itemValue="DOS_SPORT_ID">
		                                        </form:select>
                                            </div>
                                        </dd>
                                    </div>
                                    
                                    <div class="act_form_item">
                                        <dt>賽制</dt>
                                        <dd>
                                            <div class="ball_select">
                                                <form:select path="act_rule.ACT_RULE_ID" items="${act_rule}" itemLabel="ACT_RULE_NAME" itemValue="ACT_RULE_ID">
		                                        </form:select>
                                            </div>
                                        </dd>
                                    </div>
                                   
                                    <div class="act_form_item">
                                        <dt>場地</dt>
                                        <div>
                                            <span><c:out value="${actBean.dos_id.DOS_NAME}"/></span>
                                        </div>
                                    </div>
                                    <div class="act_form_item">
                                        <dt>活動簡介</dt>
                                        <div>
                                            <form:textarea path="ACT_DESC" name="
                                        site_introduction" class="form-control" id="site_introduction" cols="20" rows="4"/>
                                        </div>
                                    </div>
                                </dl>
                            </form>
                        </div>
                        <div class="act_org_box contact-wrap w-100 p-md-5 p-4">
                            <h3 class="mb-4 update_heading">上傳文件</h3>
                            <div class="container px-md-0">
                                <div class="row d-flex no-gutters">
                                        
                                        <div class="form-group">
                                            <label class="label" for="exampleFormControlFile1">比賽LOGO</label>
                                            <form:input path="uploadImage" type="file" accept=".png,.jpg" class="form-control-file" id="exampleFormControlFile1"/>
                                        </div>
                                     <div class="form-group">
                                            <label class="label" for="exampleFormControlFile2">競賽章程</label>
                                            <form:input path="uploadFile" type="file"  class="form-control-file" id="exampleFormControlFile2"/>
                                        </div>
                                </div>
                                        <div class="">
                                            <input type="submit" value="送出" class="btn btn-primary">                                         
                                            <div class="submitting"></div>
                                            
                                        </div> 
                                        
                                            
                                           
                                         
                            </div>                                                                                                     
                        </div>
                        
                    </div>
                    <div class="col-4 align-items-stretch">
                        <div class="act_org_timetable w-100 p-md-5 p-4">                           
                             <div class="form-group">
    
         <dt>開始報名時間</dt>
        <form:input path="ACT_SIGN_O" class="form-control form_datetime" id="time" name="time"  data-date-format="yyyy-mm-dd hh:ii:00" autocomplete="off"/>
        <span class="input-group-addon">
            <span class="glyphicon glyphicon-calendar"></span>
        </span>
    
</div>
		   
		   <div class="form-group">
    <dt>結束報名時間</dt>
		   <form:input path="ACT_SIGN_C" class="form-control form_datetime1" id="time1" name="time1"  data-date-format="yyyy-mm-dd hh:ii:00" autocomplete="off"/>
		 <span class="input-group-addon">
            <span class="glyphicon glyphicon-calendar"></span>
        </span>
    
</div>

<div class="form-group">
    <dt>開始比賽時間</dt>
		   <form:input path="ACT_RUN_O" class="form-control form_datetime2" id="time2" name="time2"  data-date-format="yyyy-mm-dd hh:ii:00" autocomplete="off"/>
		 <span class="input-group-addon">
            <span class="glyphicon glyphicon-calendar"></span>
        </span>
    
</div>


<div class="form-group">
    <dt>結束比賽時間</dt>
		   <form:input path="ACT_RUN_C" class="form-control form_datetime3" id="time3" name="time3"  data-date-format="yyyy-mm-dd hh:ii:00" autocomplete="off"/>
		 <span class="input-group-addon">
            <span class="glyphicon glyphicon-calendar"></span>
        </span>
  
</div>

                        </div>
                         
                    </div>
                
                
                                   
                   
                </div>
            </div>
            </form:form>
        </section>
        
    </div>

<!-- footer -->
	<jsp:include page="/WEB-INF/views/fragment/footer.jsp" />
  	<script src="${pageContext.request.contextPath}/js_index/jquery.nice-select.min.js"></script>  
</body>
<script>


$(document).ready(function(){
 $('#submit1').click(function(){
       $('#act_title').attr('value',"文化大學籃球校際盃");
       $('#act_max_team').attr('value',"10");
       $('#act_max_pnum').attr('value',"20");
       $('#act_pay').attr('value',"500");
       $('#site_introduction').val("為提倡桌球運動風氣，將賽程分兩階段實施，以擴大推廣運動人口，培植有潛力的學生，\r提升運動競賽技術水準，促進學生身心健康及增進同學之情誼");
       
       $('#time').val("2021-03-30 09:30:00");
       $('#time1').val("2021-04-15 09:30:00");
       $('#time2').val("2021-04-20 09:00:00");
       $('#time3').val("2021-04-25 12:30:00");
     });
});


$(function(){
	$('.form_datetime').datetimepicker({	
		
		format: 'Y-m-d H:i:00',
		todayBtn:  1,
		autoclose: 1,
		step:15,
		minView:0,  //0表示可以選擇小時、分鐘   1只可以選擇小時
		minuteStep:10,//分鐘間隔10分鐘	
	});
	
	
});
$(function(){
	$('.form_datetime1').datetimepicker({	
		
		format: 'Y-m-d H:i:00',
		todayBtn:  1,
		autoclose: 1,
		step:15,
		minView:0,  //0表示可以選擇小時、分鐘   1只可以選擇小時
		minuteStep:1,//分鐘間隔10分鐘	
	});
});

$(function(){
	$('.form_datetime2').datetimepicker({	
		
		format: 'Y-m-d H:i:00',
		todayBtn:  1,
		autoclose: 1,
		step:15,
		minView:0,  //0表示可以選擇小時、分鐘   1只可以選擇小時
		minuteStep:1,//分鐘間隔10分鐘	
	});
});

$(function(){
	$('.form_datetime3').datetimepicker({	
		
		format: 'Y-m-d H:i:00',
		todayBtn:  1,
		autoclose: 1,
		step:15,
		minView:0,  //0表示可以選擇小時、分鐘   1只可以選擇小時
		minuteStep:1,//分鐘間隔10分鐘	
	});
});
</script>

</html>