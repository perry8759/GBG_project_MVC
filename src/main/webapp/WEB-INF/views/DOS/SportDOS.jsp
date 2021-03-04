<!-- 所有場地資訊 使用usebean 因無需要即時更新-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <jsp:useBean id="memberService" class="com.web.GBG_project.DOS.service.impl.DOSServiceImpl" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style >
  
  .custom {
      box-shadow:inset 0px 0px 5px 1px #000;

　     }
  
  .searchform{
  
  
    border:1px solid red;
    z-index: 2;
    top: 30%;
    
    padding: 10px 10px;
    width: 50%;
   
    background-color: rgba( 255, 255, 255, 0.95 );
     background-size:100% auto;
    border-radius: 10px;
    box-shadow: 0px 0px 800px rgba( 0, 0, 0, 0.5 );
    
}
.search{
   border:1px solid red;
   float:left;
   width: calc( 100% -150px );
}

.container{
 
   width:80%;
   height:auto;
    display:flex;
    flex-direction:row;
    
    flex-flow:wrap;
   margin : 20px auto;
}
.dos{
    position: relative;
    font-size:20px;
    vertical-align: top;
    padding: 10px 10px 15px;
    margin: 0px 1% 40px 1%;
    width: calc( 85% / 3 );
    color: #333333;
    background-color: #FFFFFF;
    box-shadow: 0px 0px 15px rgb(0 0 0 / 20%);
    box-sizing: border-box;
    cursor: pointer;
}

@media (max-width:700px) {
    .dos{
        width:calc( 85% / 2 ); 
     }
}
@media (max-width:550px) {
    .dos{
        width:100%; 
     }
}

.CMContent{
   border:1px solid red;
   margin:20px;
}
.CMDiv{
    border:1px solid red;
    margin:0px auto;
    padding:35px;
    width:100%;
    max-width:900px;
    height:auto;
}
.Item{
  float: left;
    position: relative;
     display:flex;
    flex-direction:row;
    
    flex-flow:wrap;
    margin: 0px 5px 5px 0px;
    padding:10px;
    width: calc( 50% - 8px );
    font-size: 15px;
}
.Item select {
    width: 100%;
    padding: 10px 8px 10px 10px;
    border-radius: 5px;
        background-color: #00c2a9;
}
.divform{
       float: left;
    width: calc( 100% - 140px );
}
</style>

<script src="jquery-3.5.1.js"></script>

<title>Insert title here</title>
</head>
<body>

  <jsp:include page="/WEB-INF/views/fragment/topMVC.jsp" />
  
   <div class="searchform" style="margin: 100px auto;padding: 100px 0px; position:relative;">
       
     
            <div style="font-size:40px;text-align:center;">搜尋場地</div>
            <div class="divform">
            <label class="Item">
            <select>
                <option value="0">台北市</option>
                 <option value="0">新北市</option>
            </select>
            </label>
            <label class="Item">
            <select>
                <option value="0">台北市</option>
                 <option value="0">新北市</option>
            </select>
            
            </label>
            <label class="Item">
            <select>
                <option value="0">台北市</option>
                 <option value="0">新北市</option>
            </select>
            
            </label>
            <label class="Item">
            <select>
                <option value="0">台北市</option>
                 <option value="0">新北市</option>
            </select>
            
            </label>
            </div>
       
       
   </div>
  
<div class="container">
    
        <c:forEach var="mem"  varStatus="statusX" items="${DOS}">
           
           <div class="dos"> 
              <a  id="hbtn" href="DOS_detail?DOSID=${mem.DOS_ID}">
              
               <div class="thumbnail custom"> 
                 <c:forEach var="dosp"   items="${mem.dos_pictureee}">
                 
                  <img src="data:image/jpg;base64,${dosp.DOS_PICTURE_PIC_ONE}" style="height:200px"/>                
                  </c:forEach>
                  <div class="caption">
                       <h3> ${mem.DOS_NAME}</h3>
                       <p>${mem.DOS_ADDR}</p>
                       
                       <p>${mem.DOS_PAY}</p>
                       <p>${mem.DOS_CY}</p>
                </div>
              </div>
              </a>
           </div>
          
        </c:forEach>   

     </div>
    
          <div class="CMContent">
             <div class="CMDiv">精彩賽事</div>
          </div>
</body>
</html>