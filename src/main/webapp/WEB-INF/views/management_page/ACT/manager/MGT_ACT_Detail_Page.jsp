<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Donation Form</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <style>
      html, body {
      min-height: 100%;
      }
      body, div, form, input, select, textarea, label { 
      padding: 0;
      margin: 0;
      outline: none;
      font-family: Roboto, Arial, sans-serif;
      font-size: 14px;
      color: #666;
      line-height: 22px;
      }
      h1 {
      position: absolute;
      margin:0;
      font-size: 60px;
      color: #fff;
      z-index: 2;
      line-height: 83px;
      top:30px;
      }
      legend {
      padding: 10px;      
      font-family: Roboto, Arial, sans-serif;
      font-size: 18px;
      color: #fff;
      background-color: #1c87c9;
      }
      textarea {
      width: calc(100% - 12px);
      padding: 5px;
      }
      .testbox {
      display: flex;
      justify-content: center;
      align-items: center;
      height: inherit;
      padding: 20px;
      }
      form {
      width: 100%;
      padding: 20px;
      border-radius: 6px;
      background: #fff;
      box-shadow: 0 0 8px #006622; 
      }
      .banner {
      position: relative;
      height: 250px;
      background-image: url("/uploads/media/default/0001/02/cc6bc584f236c7234947015b89151ab6d04c4cbf.jpeg");  
      background-size: cover;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
      }
      .banner::after {
      content: "";
      background-color: rgba(0, 0, 0, 0.4); 
      position: absolute;
      width: 100%;
      height: 100%;
      }
      input, select, textarea {
      margin-bottom: 10px;
      border: 1px solid #ccc;
      border-radius: 3px;
      }
      input {
      width: calc(100% - 10px);
      padding: 5px;
      }
      input[type="date"] {
      padding: 4px 5px;
      }
      textarea {
      width: calc(100% - 12px);
      padding: 5px;
      }
      .item:hover p, .item:hover i, .question:hover p, .question label:hover, input:hover::placeholder {
      color:  #006622;
      }
      .checkbox input[type=checkbox] {
      display:inline-block;
      height:15px;
      width:15px;
      margin-right:5px;
      vertical-align:text-top;
      }
      .item input:hover, .item select:hover, .item textarea:hover {
      border: 1px solid transparent;
      box-shadow: 0 0 3px 0  #006622;
      color: #006622;
      }
      .item {
      position: relative;
      margin: 10px 0;
      }
      .item span {
      color: red;
      }
      .week {
      display:flex;
      justfiy-content:space-between;
      }
      .colums {
      display:flex;
      justify-content:space-between;
      flex-direction:row;
      flex-wrap:wrap;
      }
      .colums div {
      width:48%;
      }
      input[type=radio], input[type=checkbox]  {
      display: none;
      }
      label.radio {
      position: relative;
      display: inline-block;
      margin: 5px 20px 15px 0;
      cursor: pointer;
      }
      .question span {
      margin-left: 30px;
      }
      .question-answer label {
      display: block;
      }
      label.radio:before {
      content: "";
      position: absolute;
      left: 0;
      width: 17px;
      height: 17px;
      border-radius: 50%;
      border: 2px solid #ccc;
      }
      input[type=radio]:checked + label:before, label.radio:hover:before {
      border: 2px solid  #006622;
      }
      label.radio:after {
      content: "";
      position: absolute;
      top: 6px;
      left: 5px;
      width: 8px;
      height: 4px;
      border: 3px solid  #006622;
      border-top: none;
      border-right: none;
      transform: rotate(-45deg);
      opacity: 0;
      }
      input[type=radio]:checked + label:after {
      opacity: 1;
      }
      .flax {
      display:flex;
      justify-content:space-around;
      }
      .btn-block {
      margin-top: 10px;
      text-align: center;
      }
      button {
      width: 150px;
      padding: 10px;
      border: none;
      border-radius: 5px; 
      background:  #1c87c9;
      font-size: 16px;
      color: #fff;
      cursor: pointer;
      }
      button:hover {
      background:  #0692e8;
      }
      @media (min-width: 568px) {
      .name-item, .city-item {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      }
      .name-item input, .name-item div {
      width: calc(50% - 20px);
      }
      .name-item div input {
      width:97%;}
      .name-item div label {
      display:block;
      padding-bottom:5px;
      }
      }
    </style>
  </head>
  <body>
  
    <div class="testbox">
    
    <form>
      <div class="banner">
        <h1>確認核准單</h1>
      </div>
      <br/>
      <fieldset>
      <legend>會員資料</legend>
      <div class="colums">
          <div class="item">
            <label for="fname">主辦方姓名</label>
            <p>${member.member_real_name}</p>
          </div>
          <div class="item">
            <label for="lname">主辦方電話</label>
            <p>${member.member_mobile_phone}</p>           
          </div>
          <div class="item">
            <label for="fname">主辦方地址</label>
            <p>${member.member_address}</p>
          </div>
          <div class="item">
            <label for="lname">主辦方統一編號</label>
            <p>${member.member_tax_id_number}</p>           
          </div>
          </div>
      </fieldset>
      <br/>
      <fieldset>
        <legend>查看活動資料</legend>
        <div class="colums">
          <div class="item">
            <label for="saddress">場地名稱</label>
            <p>${ACT_exampass.dos_id.DOS_NAME}</p>
          </div>
          <div class="item">
            <label for="fname">活動標題</label>
            <p>${ACT_exampass.ACT_TITLE}</p>
          </div>
          <div class="item">
            <label for="lname">活動最大人數</label>
            <p>${ACT_exampass.ACT_MAX_PNUM}</p>
          </div>
          <div class="item">
            <label for="address">活動最大隊伍數量</label>
            <p>${ACT_exampass.ACT_MAX_TEAM}</p>
          </div>
          <div class="item">
            <label for="phone">活動費用</label>
            <p>${ACT_exampass.ACT_PAY}</p>
          </div>
          <div class="item">
            <label for="saddress">運動種類</label>
            <p>${ACT_exampass.dos_sport.DOS_SPORT_NAME}</p>
          </div>
          <div class="item">
            <label for="saddress">活動簡介</label>
            <p>${ACT_exampass.ACT_DESC}</p>
          </div>
          </div>
      </fieldset>
      <br/>
      <fieldset>
      <legend>報名時間與比賽時間</legend>
      <div class="colums">
          <div class="item">
            <label for="fname">比賽開始時間</label>
            <p>${ACT_exampass.ACT_RUN_O}</p>
          </div>
          <div class="item">
            <label for="lname">比賽結束時間</label>
            <p>${ACT_exampass.ACT_RUN_C}</p>           
          </div>
          <div class="item">
            <label for="fname">活動報名開始時間</label>
            <p>${ACT_exampass.ACT_SIGN_O}</p>
          </div>
          <div class="item">
            <label for="lname">活動報名結束時間</label>
            <p>${ACT_exampass.ACT_SIGN_C}</p>          
          </div>
          </div>
      </fieldset>
      
      <div class="btn-block">
      <c:choose>
          <c:when test="${ACT_exampass.act_status.ACT_STATUS_ID ==1 || ACT_exampass.act_status.ACT_STATUS_ID ==2 || ACT_exampass.act_status.ACT_STATUS_ID ==3 || ACT_exampass.act_status.ACT_STATUS_ID ==4 || ACT_exampass.act_status.ACT_STATUS_ID ==5 || ACT_exampass.act_status.ACT_STATUS_ID ==6}">
               
          </c:when>
          <c:otherwise>
              <a href="Manager_ACT_list_detail_pass?actid=${ACT_exampass.ACT_ID}">送出</a>
          </c:otherwise>
      </c:choose>
      
      </div>
   </form>
    </div>
     
  </body>
 
</html>