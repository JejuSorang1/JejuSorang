<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css"> 
<link rel="stylesheet" href="../css/rent_reserve.css">
<style type="text/css">
li{
font-size: 15px;

}
</style>
</head>
<body>
<div class="wrapp">
<div class="sangdan">
<h4 style="line-height: 0px; margin-bottom: 20px; color: #DC6721;" ><strong>결제정보</strong></h4>
 </div>
 <div class="container">
  <div class="row">
    <div class="col-md-7 reserve">
	           <h3><b>${vo.car_name }</b></h3>
	             <p class="short-text">업체:레인보우모빌리티</p>
	           <hr style="border: solid 1px gray; " >
	           <div class="row">
			        <div class="col-md-6" >
			        <div class="text-left">
			         <div class="text-center" style="font-size: 15px;">대여일시</div>
			         <div class="text-center">${start }</div>
			        </div>
			       <div class="text-left">
			         <div class="text-center">반납일시</div>
			         <div class="text-center">${end }</div>
			        </div>
			       </div> 
			       </div>
			       <hr style="border: solid 1px gray; " >
			      <p>차량정보 : ${vo.car_option1 }</p> 
			      <br>
			     <ul style="t">
			      <li>운전자 정보 : ${sessionScope.name }  </li>
			      <li>생년월일 : ${sessionScope.birthday }</li>
			      <li>휴대폰번호 : ${sessionScope.phone }</li>
			      <li>이메일 주소 : ${sessionScope.email } </li>
			    </ul>
			    <br>
			    <img src="../img/license.png" style="margin-bottom: 5px;">
			    <br>
			    <b>대인/대물/자손 보상한도</b>
			    <img src="../img/insurance.png" style="margin-top: 5px; margin-bottom:5px; border: solid 1px gray;">
			     보험은 현장에서 작성하는 계약서를 기준으로 적용됩니다. 반드시 계약서를 확인해주시기 바랍니다.
          </div>
    <div class="col-md-4 reserve2">
         <h5><b>결제정보</b></h5>
         <hr >
         <p>대여요금</p> 
         <h4 style="color: #F8B03A;"><b>${vo.car_price }</b></h4>
         <hr>
         <p>총 결제금액<p>
          <hr>
          <p style="text-align: center;  font-size: 15px;">위 내용을 모두 확인하였으며, 결제에 동의합니다</p>
          <form method="" action="">
           <input type="hidden">
           <input type="hidden">
          </form>
         </div> 
   </div>
   </div>
 </div> 
</body>
</html>