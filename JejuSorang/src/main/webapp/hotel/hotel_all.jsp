<%@page import="com.sist.vo.RoomVO"%>
<%@page import="com.sist.dao.RoomDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/hotel_findlist.css"> 

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
//화면 크기가 변경 되었 때
$(window).resize(function( event ) { 
  $(this).trigger('scroll'); 
});
// 페이지 읽힌 다음 위치 설정
$(document).ready(function() {

  // 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
  var floatPosition = parseInt($("#filter").css('top'));
  var divBoxHeight  = parseInt($('#filter').outerHeight(true));

  $(window).scroll(function() {
    // 현재 스크롤 위치를 가져온다.
    var scrollTop = $(window).scrollTop();
    var newPosition = scrollTop + floatPosition + "px";

    $("#filter").stop().animate({ "top" : newPosition }, 500);
 
  }).scroll();
});


</script>

<style>
#filter{
	position: relative;
    width: 300px;
    height: 300px;
    left: 2px;
    top: 10px;
    padding-Top: 15px;
    background-color: white;
    line-height: 2px;
}
#datepicker_3,#datepicker_4,#inwon{
	border-color: orange;
	border-radius: 10px;
}
.booking_part .form-row .form_colum .nc_select{
	border-color: orange;
	border-radius: 10px;
}  
.table3{
	border: 1px solid orange;
	text-align: center;
	border-radius: 10px;
    display: flex;
    align-items: center;
    vertical-align: middle;
}
.row{
	justify-content: flex-end;
}
</style>
</head>
<body>
<div class="container">
  <div class="row">
    <div class="row-lg-12">
    <div class="row-lg-12">
    <section class="booking_part" id="searchbar">
      <div class="booking_content" id="searchbar1" style="background:transparent;">
        <div class="booking_form">
          <form method =post action="../hotel/hotel_findlist.do" class="hotelser">
            <div class="form-row" style="height: 5px;">
              <div class="form_colum" style="width:200px; margin-left: 5px;margin-Top: -2%">
                <select class="nc_select" name="area"  >
                  <option style="width: 200px;height: 200px" selected>전체</option>
                  <option ${area=='제주시'?'selected':"" }>제주시</option>
                  <option ${area=='서귀포시'?'selected':""}>서귀포시</option>
                </select>        
              </div>
              <div class="form_colum" style="width:200px;  margin-left: 5px; margin-Top: -2%">
                <input id="datepicker_3" placeholder="예약시작일" name="checkin" value="${checkin }" autocomplete='off'>
              </div>
              <div class="form_colum" style="width:200px;  margin-left: 5px; margin-Top: -2%">
                <input id="datepicker_4" placeholder="예약종료일" name="checkout" value="${checkout }" autocomplete='off'>
              </div>
              <div class="form_colum" style="width:200px; margin-left: 5px; margin-Top: -2%">
                <input type="number"  min="1" max="4" style="width: 180px;height: 50px; border-bottom-color: orange;" name="inwon" value="${inwon }" placeholder="인원">
              </div>
              <div class="form_btn" style="margin-left: 5px; margin-Top: -1%">
                <input type="submit" name="submit" value="검색" class="btn btn-warning text-white mb-2">
              </div>
            </div>
          </form>
        </div>
      </div>    
    </section>
    </div>
    </div>
    
    
    <div class="col-sm-3" id="filter" style="display: inline">
     <form name="form1" method="get" action="../hotel/hotel_findlist.do" enctype="multipart/form-data">   
       <table class="table3 col-lg-9">
         <tr>
           <th colspan="2"><h4>검색 결과</h4></th>
         </tr>
         <tr>
           <td colspan="2"><h5>목적지</h5>
           <br>
           <input type="text" readonly value="${area }" style="border: none;size: 5; text-align: center">
           </td>
         </tr>
         <tr>
           <td colspan="2"><h5>체크인 날짜</h5>
           <br>
           <input type="text" readonly value="${checkin }" style="border: none;size: 5; text-align: center">
           </td>
         </tr>
         <tr>
           <td colspan="2"><h5>체크아웃 날짜</h5>
           <br>
           <input type="text" readonly value="${checkout }" style="border: none;size: 5; text-align: center"">
           </td>
         </tr>
         <tr>
           <td colspan="2"><h5>인원</h5>
           <br>
           <input type="text" readonly value="${inwon }" style="border: none;size: 5; text-align: center"">
           </td>
         </tr>
       </table>
       
     </form>
     
    </div>
    
    <div class="col-sm-9 wrap1" id="contenthotels">
     <div style="height: 30px"></div>
     <h3>&nbsp;&nbsp;&nbsp;&nbsp;검색 결과 <fmt:formatNumber value="${count }" type="number"/>개</h3>
      <div class="list-group list row">
        <section class="col-md-12">
          <div class="container">
            <div class="col-md-12">
              <table class="table1">
                <tr>
                  <td>
                    <c:forEach var="hvo" items="${list }" begin="0" end="4">
                      <table class="table2">
                        <tr>
                          <td width="38%" class="text-left" rowspan="3">
                            <a href="../hotel/hotel_detail.do?hno=${hvo.hno }"><img src="${hvo.hotel_image }" style="width:300px;height:250px"></a>
                          </td>
                          <td width="45%"> 
                            <a href="../hotel/hotel_detail.do?hno=${hvo.hno }"><h4>${hvo.name }<span style="color:orange">(${hvo.star })</span></h4></a><!-- 여기 -->
                            <p><h6><img src="../img/star.png" style="width:22px; height:22px">&nbsp;${hvo.grade }</h6></p>
                            <p><img src="../img/point.png" style="width:24px; height:24px">&nbsp;${hvo.addr }</p>
                            <p> <img src="../img/clock.png" style="width:20px; height:20px">&nbsp;${hvo.time }</p>                            
                            <p> 가격 ${hvo.min }원</p>
                            <p> <img src="../img/like.png" style="width: 22px;height: 22px">좋아요${hvo.like_total }&nbsp;&nbsp;&nbsp;<img src="../img/jjim.png" style="width: 22px;height: 22px">찜하기&nbsp;${hvo.jjim_total }</p>
                          </td>
                          <td width="17%"> 
                            <a href="../hotel/hotel_detail.do?hno=${hvo.hno }"><button type="button" class="btn btn-md" style="float: right;" id="detail">상세보기</button></a>
                          </td>
                        </tr> 
                      </table>
                    </c:forEach>
                  </td>
                </tr>
              </table>
            </div>
          </div>
        </section>
     </div>
     
      <nav class="pagination">
        <ul>
          <c:if test="${startPage>1 }">
              <li><a href="../hotel/hotel_findlist.do?page=${startPage-1 }">이전&laquo;</a></li>
            </c:if>    
            <c:forEach var="i" begin="${startPage }" end="${endPage }">
              <li ${i==curpage?"class==current":"" }><a href="../hotel/hotel_findlist.do?page=${i }">${i}</a></li>
            </c:forEach>
            <c:if test="${endPage<totalpage }">
              <li><a href="../hotel/hotel_findlist.do?page=${endPage+1 }">다음&raquo;</a></li>
            </c:if>  
          </ul>  
        </nav>
      </div>
    </div>
  </div>         
</body>
</html>