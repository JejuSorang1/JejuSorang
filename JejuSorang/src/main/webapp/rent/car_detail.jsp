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

</style>

</head>
<body>

<div class="wrapp">
  <div class="container">
    <div class="row">   
      <div class="detailpage">
       <div class="detailRentCar">
        <figure>
		 <img src="${vo.car_image }" width="450" height="450">
		  <p class="tip" style="font-size: 15px">차량 이미지는 이해를 돕기 위한 예시로, 배차 차량과 다를 수 있습니다.</p>
           <h4 style="font-size:20px;color:gray"><b>${vo.car_name }</b></h4>
		</figure>
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
       <div>
        <a href="#"><button type="button" class="mybutton">예약하기</button></a>
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
            <table>
	         <h4 style="font-size:15px;color:gray"><b>차량옵션</b></h4>
	          <tr>
	           <td class="text-left"><img src="../img/checkbox.png" style="weight:25px;height:25px">&nbsp;${vo.car_option2 }</td>
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
             <td class="text-left"><img src="../img/rlogo.png" style="weight:25px;height:25px">&nbsp;${rvo.rname }
              &nbsp;<span><img src="../img/star.png" style="width:10px; height:10px">&nbsp;${rvo.star }</span> 
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
      geocoder.addressSearch('${rvo.rcaddr}', function(result, status) {
      
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
                  content: '<div style="width:150px;text-align:center;padding:6px 0;">${rvo.rname}</div>'
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
             <td>${rvo.rcaddr }</td>
             </table>
             <table>
             <br>
             <tr style="font-size:15px;color:gray"><b>전화</b></tr>
             <td>${rvo.rctel }</td>
             </table>
             <br>
             <table>
             <tr style="font-size:15px;color:gray"><b>영업시간</b></tr>
             <td>연중무휴 08:00~20:00</td>
            </table>
          </div>
        </div>
        <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
          <div class="review-heading">후기</div>
          <p class="mb-20">There are no reviews yet.</p>
        </div>
      </div>
     </div>
	</div>
  

      
    
  </div>
</div>
</div>

</body>
</html>