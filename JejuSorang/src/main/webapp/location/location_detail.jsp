<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
	<div class="container"style="overflow-y:scroll">
	  <div class="row">
	    <table class="table">
	    <c:forEach var="vo" items="${list }">
		   <tr>
		     <td><h6><b>이름</b></h6><br>${vo.title }</td>
		   </tr>
		   <tr>
		     <td><h6><b>주소</b></h6><br>
			     <c:if test="${vo.addr_doro!=null }">
			       <p>${vo.addr_doro }</p>
			      </c:if>
			      <p>${vo.addr_ji }</p>
		     </td>
		   </tr>
		   <tr>
		     <td><h6><b>정보</b></h6><br>${vo.info }</td>
		   </tr>
		   <tr>
		     <td><h6><b>휴무일</b></h6><br>${vo.close }</td>
		   </tr>
		   <tr>
		     <td><h6><b>운영시간</b></h6><br>${vo.time }</td>
		   </tr>
		   <tr>
		     <td><h6><b>가격</b></h6><br>${vo.price }</td>
		   </tr>
		   <tr>
		     <td><h6><b>주요 목적</b></h6><br>${vo.purpose }</td>
		   </tr>
		   <tr>
		     <td><h6><b>편의 시설</b></h6><br>${vo.facil }</td>
		   </tr>
		   <tr>
		     <td><h6><b>관리기관</b></h6><br>${vo.manager }</td>
		   </tr>
		   <tr>
		     <td><h6><b>관리기관 전화번호</b></h6><br>${vo.tel }</td>
		   </tr>
		   </c:forEach>
	    </table>
	  </div>
	</div>
</body>
</html>