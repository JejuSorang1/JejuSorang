<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>       
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!------ Include the above in your HEAD tag ---------->

<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"> 
<script type="text/javascript">
</script>
</head>
<body>

<div class="pd-wrap">
  <div class="container">
    
    <div class="row">
      <div class="col-md-5">
        <img src="${hvo.hotel_image }" style="width:500px;height:300px">
       </div>
      <div class="col-md-4">
        <div class="product-dtl">
          <div class="product-info">
            <div class="product-name"><h4>${hvo.name}<span style="color:orange">(${hvo.star })</span></h4></div>
            <div class="info">
              <p> <img src="../img/star.png" style="width:30px; height:30px">&nbsp;&nbsp;${hvo.grade }</p>
              <p> <img src="../img/point.png" style="width:35px; height:35px">&nbsp;${hvo.addr}</p>
			  <p> <img src="../img/clock.png" style="width:33px; height:33px">&nbsp;${hvo.time}</p>
			  <p><a href="../like/like_insert.do?hno=${hvo.hno }" class="btn btn-xs" style="float: center;background-color: #F8B03A">좋아요</a><span style="float: right"><img src="../img/like.png" style="width: 22px;height: 22px;">좋아요${hvo.like_count }</span></p>
			  <p><a href="../jjim/jjim_insert.do?hno=${hvo.hno }" class="btn btn-xs" style="float: center;background-color: #F8B03A">찜하기</a><span style="float: right"><img src="../img/jjim.png" style="width: 22px;height: 22px">찜하기&nbsp;${hvo.jjim_count }</span></p>
			  <p> <a href="../hotel/hotel_all.do" class="btn btn-xs" style="float: center;background-color: #F8B03A">목록</a></p>
            </div>
          </div>
       </div>
      </div>
      <div class="col-md-3">
      <div class="sdb_holder">
        <%-- 지도 --%>
        <div id="map" style="width:100%;height:350px;">
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
		geocoder.addressSearch('${addr}', function(result, status) {
		
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
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.name}</div>'
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
     </div>
     <hr>
     
    <div class="row">
   
    <div class="product-info-tabs">
      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
          <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">객실 상세보기</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review" aria-selected="false">후기</a>
        </li>
      </ul>
      <br>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
         
          <c:forEach var="rvo" items="${rList }">
          <div class="col-md-12">
            <table class="table1">
              <tr >
                <td colspan="4" rowspan="3">
                  
                    <table class="table2">
                      <tr>
                        <td width="38%" class="text-left">
                          <img src="${rvo.room_image }" style="width:300px;height:250px">
                        </td>
                        <td width="3%">
                        </td>
                        <td width="42%" >
                          <h4>${rvo.room_name }</h4>
				          <p> <img src="../img/persons.png" style="width:20px;height:20px">&nbsp;${rvo.room_persons }</p>
				          <p> <img src="../img/bed.png" style="width:20px;height:20px">&nbsp;${rvo.room_bed_info }</p>
				          <p> <span style="color:orange">${rvo.account }</span>개의 객실이 남아있습니다. 얼른 예약하세요!</p>
				          <h3><span style="color:orange"> ${rvo.room_price }원</span></h3>
                        </td>
                        <td width="17%">
                        <a href="#"><button type="button" class="btn btn-md" style="float: right;background-color: #F8B03A">예약하기</button></a>
                        </td>
                      </tr>
                    </table>
               
                </td>
              </tr> 
            </table>
            
            <hr>
          </div>
          </c:forEach>
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

</body>
</html>