<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="height: 30px"></div>
<div class="wrapper row3">
  <main class="container clear"> 
    <!-- main body --> 
    
    <div class="inline"> 
    
      <h3 class="text-center">${sessionScope.name } 님의 관리자페이지</h3>
      <div style="height: 15px"></div>
      <%-- 메뉴 --%>
      <jsp:include page="../adminpage/admin_menu.jsp"></jsp:include>
    </div>
    <div class="tab_content"> 
      <jsp:include page="${admin_jsp }"></jsp:include>
    </div>
    <!-- / main body -->
    <div class="clear"></div>
  </main>
  </div>
</body>
</html>