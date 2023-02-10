<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

</head>
<body>
  <div class="wrapper row3">
    <main class="container clear">
     <h2 class="sectiontitle">예약 리스트</h2>
     <div style="height: 5px"></div>
     <table class="table text-center">
       <tr>
        <th class="text-center">예약번호</th>
        <th class="text-center">차량명</th>
        <th class="text-center">차량이미지</th>
        <th class="text-center">예약일</th>
        <th class="text-center">ID</th>
        <th class="text-center"></th>
       </tr>    
        <c:forEach var="vo" items="${list }">  
         <tr>
            <td>${vo.rrno }</td>
         	<td><h4><a href="../rent/car_detail.do?car_no=${vo.car_no}">${vo.cvo.car_name }</a></h4></td>
	        <td><img src="${vo.cvo.car_image }" style="width:130px;height: 130px"></td>
	        <td>${vo.start_rent } ~ ${vo.end_rent }</td>
	        <td>${vo.id}</td>
	        <td class="text-center">
	         <c:if test="${vo.rpycheck=='Y' }">
	          <span class="btn btn-xs btn-default">승인완료</span>
	         </c:if>       
	         <c:if test="${vo.rpycheck=='N' }">
	          <a href="../adminpage/admin_reserve_ok.do?rrno=${vo.rrno }" class="btn btn-xs btn-success">승인대기</a>
	         </c:if>       
	         
	       </tr>
         </c:forEach>
     </table>
    </main>
  </div>
</body>
</html>