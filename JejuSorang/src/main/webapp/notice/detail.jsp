<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>


  <main class="container clear">
  <h2 class="sectiontitle text-center">공지사항</h2>
  <div style="height: 5px"></div>
  <table class="table">
   <tr>
     <th width=20% class="text-center">구분</th>
     <td width=30% class="text-center">${vo.prefix }</td>
     <th width=20% class="text-center">작성일</th>
     <td width=30% class="text-center">${vo.dbday }</td>
   </tr>
   <tr>
     <th width=20% class="text-center">이름</th>
     <td width=30% class="text-center">${vo.name }</td>
     <th width=20% class="text-center">조회수</th>
     <td width=30% class="text-center">${vo.hit }</td>
   </tr>
   <tr>
     <th width=20% class="text-center">제목</th>
     <td colspan="3">${vo.subject }</td>
   </tr>
   <tr>
     <td class="text-left" valign="top" colspan="4" height="200"><pre style="white-space: pre-wrap;background-color: white;border: none">${vo.content }</pre></td>
   </tr>
   <tr>
     <td class="text-right" colspan="4">
		<c:if test="${sessionScope.admin=='y' }">
		  <a href="../adminpage/notice_update.do" class="btn btn-xs btn-info">수정</a>
		  <a href="../adminpage/notice_delete.do" class="btn btn-xs btn-info">삭제</a>
		</c:if>
		  <input type=button value="목록" class="btn btn-sm btn-info" onclick="javascript:history.back()">
     </td>
   </tr>

  </table>
  </main>

</body>
</html>