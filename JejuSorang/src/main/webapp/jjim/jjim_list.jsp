<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="wrapper row3">
    <main class="container clear">
     <h2 class="sectiontitle">찜한 리스트</h2>
     <div style="height: 5px"></div>
     <table class="table">
       <tr>
        <th>숙소번호</th>
        <th>숙소명</th>
        <th>주소</th>
        <th class="text-center"></th>
       </tr>
       <c:forEach var="vo" items="${list }">
         <tr>
	        <td class="text-center">${vo.hno }</td>
	        <td><a href="../hotel/hotel.detail.do?hno=${vo.hno}">${vo.name }</a></td>
	        <td>${vo.addr}</td>
	        <td class="text-center">
	         <a href="../mypage/jjim_delete.do?no=${vo.jno }" class="btn btn-xs btn-warning">취소</a>
	        </td>
	       </tr>
       </c:forEach>
     </table>
    </main>
  </div>
</body>
</html>