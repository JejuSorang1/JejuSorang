<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="wrapper row3">
    <main class="container clear">
     <h2 class="sectiontitle">내 후기 (호텔)</h2>
     <div style="height: 5px"></div>
     <table class="table">
       <tr>
        <th>숙소명</th>
        <th>숙소이미지</th>
        <th>후기내용</th>
       </tr>
       <c:forEach var="vo" items="${list }">
         <tr>
         	<td><a href="../hotel/hotel.detail.do?hno=${vo.no}">${vo.name }</a></td>
	        <td><img src="${vo.hotel_image }" style="width:100px;height: 100px"></td>
	        <td>내용</td>
	       </tr>
       </c:forEach>
     </table>
    </main>
  </div>
</body>
</html>