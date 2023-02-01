<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/admin_main.css">
</head>
<body>
<div style="height: 30px"></div>

<div class="container" id="main">
  <div class="row-fluid" style="
    margin-bottom: 10px;">
    <p class="span12">
      <a href="#menu" class="side-menu-link btn btn-mini" title="Click for sub-menu">
        <i class="icon-th"></i>
      </a>
    </p>
  </div>
  
  <div id="wrap" class="row-fluid wrap">
    <section class="well span9">
      <ul class="nav">
      
        <jsp:include page="../adminpage/admin_menu.jsp"></jsp:include>
        <jsp:include page="${admin_jsp }"></jsp:include>
      </ul>
    </section>
   </div>
 </div>

</body>
</html>