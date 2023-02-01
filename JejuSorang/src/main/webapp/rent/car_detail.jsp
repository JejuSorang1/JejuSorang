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

<!------ Include the above in your HEAD tag ---------->

<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet"><link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"> 
<script type="text/javascript">

</script>

</head>
<body>

<div class="wrapp">
  <div class="container">
    
    <div class="row">
      <div class="col-md-6">
        <img src="${vo.car_image }" style="width:400px;height:300px">
        <p class="tip">차량 이미지는 이해를 돕기 위한 예시로, 배차 차량과 다를 수 있습니다.</p>
        <h4>${vo.car_name }</h4></div>
      </div>       
      <hr>
      <div class="container">
       <div class="row">
        <div class="col-md-3">
        <div class="text-left">
         <div class="gray1">대여시간</div><span>월.일(요일)</span>&nbsp;<span>시간</span>
        </div>
       </div>
       <div class="text-left">
         <div class="gray2">반납시간</div><span>월.일(요일)</span>&nbsp;<span>시간</span>
        </div>
       </div>
      </div>
      <hr>
       <div class="row">
    <div class="product-info-tabs">
      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
          <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">예약정보</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">필독사항</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review" aria-selected="false">후기</a>
        </li>
      </ul>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
          차량정보
        </div>
        <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
          <div class="review-heading">후기</div>
          <p class="mb-20">There are no reviews yet.</p>
        </div>
      </div>
     </div>
	</div>
      <hr>
       <div class="container">
       <div class="info">
       <h3>업체 정보</h3>
       </div>
       <div class="col-md-3">
        <div class="sdb_holder">
       
<div id="map" style="width:550px;height:200px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0f08268c354755a1abe2fc6a539a4c51&libraries=services"></script>
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
geocoder.addressSearch('제주특별자치도 제주시 도두동 오일장서길 68', function(result, status) {

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
            content: '<div style="width:150px;text-align:center;padding:6px 0;">레인보우모빌리티</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
		</div>
      </div>
      
      </div>
    <table class="table">
     <tr>
      <th>주소</th>
      <td></td>
      </tr>
      <tr>
      <th>전화</th>
      <td></td>
      </tr>
      <tr>
      <th>영업시간</th>
      <td></td>
      </tr>

    </table>
    
   
    
  
</div>
</div>

</body>
</html>