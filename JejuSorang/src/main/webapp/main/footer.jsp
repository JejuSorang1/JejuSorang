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
   <footer class="footer-area">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-sm-4 col-md-4">
                    <div class="single-footer-widget">
                        <h4>고객센터</h4>
                          <p>평일 09:00 ~ 17:30 (점심시간 12:00~13:00)</p>
                    </div>
                </div> 

                <div class="col-sm-4 col-md-4">
                    <div class="single-footer-widget footer_icon">
                        <h4>주소</h4>
                        <p>SIST - 쌍용 - 3강의실</p>
                    </div>
                </div>
                
                <div class="col-sm-4 col-md-4">
                 <div class="single-footer-widget footer_icon">
                  <h4>공지사항</h4>
      			   <ul class="nospace linklist">
       			    <c:forEach var="vo" items="${nList }" varStatus="s">
         			 <li><a href="#">${s.index+1 }.${vo.subject }(${vo.dbday })</a></li>
       				</c:forEach>
      			   </ul>
                 </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="copyright_part_text text-center">
                        <p class="footer-text m-0"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
&copy;<script>document.write(new Date().getFullYear());</script> Jeju-Sorang | Project by <a href="https://github.com/JejuSorang1" target="_blank">Jeju-Sorang</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>