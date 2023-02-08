<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9965c727d3306713c47391be682e4be9&libraries=services"></script>
<style type="text/css">
.container{
   margin-top: 30px;
}
.row{
   width: 350px;
   margin: 0px auto; 
}
</style>
</head>
<body>
	<div class="container">
	  <div class="row">
	    <table class="table">
		   <tr>
		     <td><img src="${hvo.hotel_image }"></td>
		   </tr>
		   <tr>
		     <td><h4><b>${hvo.name }</b></h4></td>
		   </tr>
		   <tr>
		     <td><h4><b>${rvo.room_name }</b></h4></td>
		   </tr>
		    <tr>
		     <td><h4>체크인</h4></td>
		   </tr>
		   <tr>
		     <td>체크아웃</td>
		   </tr>
		   <tr>
		     <td>가격</td>
		   </tr>
		   <tr>
		     결제창버튼
		   </tr>
	    </table>
	  </div>
	</div>
</body>
</html>