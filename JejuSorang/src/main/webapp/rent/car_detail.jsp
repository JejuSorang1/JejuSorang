<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.com"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="style.css">
<!------ Include the above in your HEAD tag ---------->

<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet"><link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"> 
<script type="text/javascript">

</script>

<style type="text/css">

.box{
   margin:40px;
   padding: 40px;
   width:400px;
   height: 400px;
   border: 1px solid gray;
   position: relative;		
   top: 50px;
   left: 250px;
} 
#mybutton{
   width:300px;
   height: 50px;
   background-color: #0000FF;
   color:white;
}
<<<<<<< HEAD
=======
   position: relative;      
   top: 50px;
   left: 250px;
}
.inner-box{
   width: 300px;
   height: 100%; 
}
.mybutton{
   width:300px;
   height: 50px;
   background-color: blue;
   color:white;
}

=======
>>>>>>> refs/remotes/origin/master

</style>

</head>
<body>

<div class="wrapp">
  <div class="container">
    <div class="row">   
      <div class="detailpage">
       <div class="detailRentCar">
<<<<<<< HEAD
        <figure>

=======
        <figure>
>>>>>>> refs/remotes/origin/master
		 <img src="${vo.car_image }" width="450" height="450">
		  <p class="tip" style="font-size: 15px">차량 이미지는 이해를 돕기 위한 예시로, 배차 차량과 다를 수 있습니다.</p>
           <h4 style="font-size:20px;color:gray"><b>${vo.car_name }</b></h4>
<<<<<<< HEAD
		</figure>

       <img src="${vo.car_image }" width="450" height="450">
        <p class="tip" style="font-size: 15px">차량 이미지는 이해를 돕기 위한 예시로, 배차 차량과 다를 수 있습니다.</p>
           <h4 style="font-size:20px;color:gray"><b>${vo.car_name }</b></h4>
      

=======
           <br>
           	<p><span><img src="../img/jjim.png" style="width: 22px;height: 22px">찜하기&nbsp;${rvo.jjim_count }</span>&nbsp;&nbsp;<a href="../jjim/jjim_insert.do?rcno=${rvo.rcno }" class="btn btn-xs" style="float: center;background-color: #F8B03A">찜하기</a></p>
           
		</figure>
>>>>>>> refs/remotes/origin/master
       </div>
      </div>
      <div class="box">
       <div class="inner-box">
       <h4 style="font-size:23px;color:gray"><b>결제정보</b></h4>
       <br>
       <h4 style="font-size:19px;color:gray">최종결제금액&nbsp;<h4 style="font-size:23px;color:blue"><b>${vo.car_price }원</b><h4></h4>
       <hr style="border: width:100px;">
       <h4 style="font-size:18px;color:black"><img src="../img/attention_icon.png" style="width:20px;height:20px">&nbsp;<b>바로 결제해야 예약 확정</b></h4>
       <br>
       <h4 style="font-size:17px;color:gray">시간이 경과될 경우 좌석이 매진되거나 요금이 변동될 수 있습니다.</h4>
       <br>
<<<<<<< HEAD
       <div>

        <a href="#"><button type="button" class="button" id="mybutton">예약하기</button></a>

        <a href="#"><button type="button" class="mybutton">예약하기</button></a>

=======
       <div>
        <a href="#"><button type="button" class="button" id="mybutton">예약하기</button></a>
>>>>>>> refs/remotes/origin/master
       </div>
       </div>
      </div>
    </div>

      <hr align="left" style="border: solid 1px gray; width: 50%;">
      <div class="container">
       <div class="row">
        <div class="col-md-3">
        <div class="text-left">
         <div class="text-center">대여시간</div>
        </div>
       </div>
       <div class="text-left">
         <div class="text-center">반납시간</div>
        </div>
       </div>
      </div>
      
     <hr align="left" style="border: solid 1px gray; width: 50%;">       
                    
                     
     <div class="container">
            <div class="row">
    <div class="product-info-tabs">
      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
          <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">예약정보</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review" aria-selected="false">후기</a>
        </li>
      </ul>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
           <br>
           
          <div class="col-md-8">
            <table class="table1">
            <h4 style="font-size:15px;color:gray"><b>차량정보</b></h4>
             <tr>
               <td class="text-left"><img src="../img/caricon.jpg" style="weight:25px;height:25px">&nbsp;${vo.car_option1 }</td>
             </tr>
            </table> 
            <br>
<<<<<<< HEAD
            <table>

=======
            <table>
>>>>>>> refs/remotes/origin/master
	         <h4 style="font-size:15px;color:gray"><b>차량옵션</b></h4>
	          <tr>
<<<<<<< HEAD
	           <td class="text-left"><img src="../img/checkbox.png" style="weight:25px;height:25px">&nbsp;${vo.car_option2 }</td>

            <h4 style="font-size:15px;color:gray"><b>차량옵션</b></h4>
             <tr>
              <td class="text-left"><img src="../img/checkbox.png" style="weight:25px;height:25px">&nbsp;${vo.car_option2 }</td>

=======
	           <td class="text-left"><img src="../img/checkbox.png" style="weight:25px;height:25px">&nbsp;${vo.car_option2 }</td>
>>>>>>> refs/remotes/origin/master
              </tr>
            </table>
            <br>
            <table>
             <h4 style="font-size:20px;color:gray">렌트카 예약 전, 꼭 확인해주세요!</h4>
             <tr>
              <td class="text-left"><img src="../img/checkicon.png" style="weight:15px;height:15px">제주도의 경우, 렌트카 업체 영업시간 외 대여/반납이 필요한 경우 카모아 고객센터를 통한 상담 후 예약 진행해주세요.</td>
             </tr>
             <tr> 
              <td class="text-left"><img src="../img/checkicon.png" style="weight:15px;height:15px">외국인 대여, 낚시용품 지참, 애견동물 동반 가능 여부와 주행거리 제한 규정은 업체별로 상이하므로 업체별 대여규정을 확인해주세요. 대여조건이 맞지 않을 경우 렌트카 이용이 불가합니다.</td> 
             </tr>
            </table>
            <br>
            <table>
             <h4 style="font-size:20px;color:gray"><b>업체정보</b></h4>
             <td class="text-left"><img src="../img/rlogo.png" style="weight:25px;height:25px">&nbsp;${vo.rname }
              &nbsp;<span><img src="../img/star.png" style="width:10px; height:10px">&nbsp;${vo.star }</span> 
             </td>
            </table>
            <table>
        <%-- 지도 --%>
        <div id="map" style="width:200;height:200px;">
      <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = {
              center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
              level: 3 // 지도의 확대 레벨
          };  
      
      // 지도를 생성합니다    
      var map = new kakao.maps.Map(mapContainer, mapOption); 
      
      // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new kakao.maps.services.Geocoder();
      
      // 주소로 좌표를 검색합니다
      geocoder.addressSearch('${vo.rcaddr}', function(result, status) {
      
          // 정상적으로 검색이 완료됐으면 
           if (status === kakao.maps.services.Status.OK) {
      
              var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
      
              // 결과값으로 받은 위치를 마커로 표시합니다
              var marker = new kakao.maps.Marker({
                  map: map,
                  position: coords
              });
      
              // 인포윈도우로 장소에 대한 설명을 표시합니다
              var infowindow = new kakao.maps.InfoWindow({
                  content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.rname}</div>'
              });
              infowindow.open(map, marker);
      
              // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
              map.setCenter(coords);
          } 
      });    
      </script>
      </div>            
            </table>
            <table>
            <br>
             <tr style="font-size:20px;color:gray"><b>주소</b></tr>
             <td>${vo.rcaddr }</td>
             </table>
             <table>
             <br>
             <tr style="font-size:15px;color:gray"><b>전화</b></tr>
             <td>${vo.rctel }</td>
             </table>
             <br>
             <table>
             <tr style="font-size:15px;color:gray"><b>영업시간</b></tr>
             <td>연중무휴 08:00~20:00</td>
            </table>
            <br>
          </div>
        </div>
        <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
<<<<<<< HEAD
          <div class="review-heading">후기</div>

          	<form method="get" action="car_review.do">
			  <table class="table">
			  <tr>
			  		<th width=30% class="text-right">차량번호</th>
			  		<input type=text name=car_no size=15 class="car_no">
			  </tr>
			  <tr>
			      <th width=30% class="text-right">ID</th>
			      <td width=80%>
			        <input type=text name=id size=15 class="id">
			      </td>
			    </tr>
			    <tr>
			      <th width=30% class="text-right">후기내용</th>
			      <td width=80%>
			        <textarea rows="10" cols="60" name="content"></textarea>
			      </td>
			    </tr>
			    <tr>
			      <td colspan="2" class="text-center">
			        <input type=submit value="글쓰기" class="btn btn-sm btn-danger">
			        <input type=button value="취소" class="btn btn-sm btn-danger" onclick="javascript:history.back()">
			      </td>
			    </tr>
			  </table>
  			</form>
  			<table>
            <br>
             <tr style="font-size:20px;color:gray"><b>아이디</b></tr>
             <td>${rv.id }</td>
             </table>
             <table>
             <br>
             <tr style="font-size:15px;color:gray"><b>차번호</b></tr>
             <td>${rv.rent_review_no }</td>
             </table>
             <br>
             <table>
             <tr style="font-size:15px;color:gray"><b>후기</b></tr>
             <td>${rv.msg }</td>
            </table>
        </div>

          <p class="mb-20">There are no reviews yet.</p>
        </div>

      </div>
     </div>

	</div>
 

   </div>
  


      
    
=======
          <div class="review-heading">후기</div>
          	    <div style="height: 20px"></div>
      <div class="content three_quarter first"> 
        <h2 class="sectiontitle">댓글</h2>
        <c:if test="${count==0 }">
                 <table class="table">
                   <tr>
                     <td class="text-center">댓글이 없습니다</td>
                   </tr>
                 </table>
               </c:if>
               <c:if test="${count>0 }">
                 <table class="table">
                   <tr>
                     <td>
                     <c:forEach var="rvo" items="${rList }">
                      <table class="table">
                       <tr>
                        <td class="text-left" width=85%>◑<span style="color:orange">${rvo.name }</span>&nbsp;(${rvo.dbday })</td>
                        <td class="text-right" width=15%>
                          <c:if test="${sessionScope.id!=null }">
                            <c:if test="${sessionScope.id==rvo.id }">
                              <span class="btn btn-xs btn-danger ups" data-no="${rvo.rno }">수정</span>
                              <a href="../all_reply/all_reply_delete.do?rno=${rvo.rno }&no=${vo.no}&cate_no=1" class="btn btn-xs btn-primary">삭제</a>
                            </c:if>
                          </c:if>
                        </td>
                          
                       </tr>
                       <tr>
                        <td colspan="2"><pre style="white-space:pre-wrap;background-color:white;border:none">${rvo.msg }</pre></td>
                       </tr>
                       <tr id="u${rvo.rno }" class="rupdate" style="display:none">
			             <td colspan="2">
			               <form method="post" action="../all_reply/all_reply_update.do">
					         <input type=hidden name="no" value="${vo.no }">
					         <input type=hidden name="rno" value="${rvo.rno }">
					         <input type=hidden name="cate_no" value="1">
					         <textarea rows="3" cols="90" name="msg" style="float: left">${rvo.msg}</textarea>&nbsp;
					         <input type=submit value="수정" class="btn btn-sm btn-danger" style="height: 65px">
					        </form>
			             </td>
			            </tr>
                      </table>
                    </c:forEach>
                     </td>
                   </tr>
                 </table>
               </c:if>  
        <table class="table">       
        <c:if test="${sessionScope.id!=null }">
          <table class="table">
           <tr>
            <td>
             <form method="post" action="../all_reply/all_reply_insert.do">
               <input type="hidden" name="no" value="${vo.no }">
               <input type="hidden" name="cate_no" value="1">
               <%--
                  1. seoul_locateion
                  2. food
                  3. goods
                --%>
               <textarea rows="3" cols="90" name="msg" style="float: left"></textarea>&nbsp;
               <input type=submit value="댓글쓰기" class="btn btn-sm btn-danger" style="height: 65px">
             </form>
            </td>
           </tr>
          </table>
        </c:if>
      </table>
      </div>     
        </div>        
>>>>>>> refs/remotes/origin/master
  </div>


</body>
</html>