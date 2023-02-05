<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <table class="table">
  <c:forEach var="lvo" items="${list }">
   <tr>
     <td width="20%" class="text-center">
       이미지
     </td>
     <td width="80%">
       <h4>${lvo.title }</h4>
       <p><img src="../img/point.png" style="width:22px; height:22px">&nbsp;${lvo.addr_doro }</p>
       <p>&nbsp;&nbsp;&nbsp;&nbsp;${lvo.addr_ji }</p>
       <p>${lvo.info }</p>
       <p>${lvo.close }</p>
       <p></p>
     </td>
   </tr>
   </c:forEach>
  </table>
</body>
</html>