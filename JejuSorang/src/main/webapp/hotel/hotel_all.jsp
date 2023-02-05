<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="../css/hotel_all.css"> 
<script src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c3826884834130aaf949e9af16f4be36&libraries=services"></script>
<script type="text/javascript">

</script>

</head>
<body>  

  <div class="container">
    <div class="row">
    <div class="col-sm-3">
      <div style="width: 10px;height: 50px"></div>
	 <h3 class="sectiontitle">최근 본 목록</h3> 
	 <div class="inline">
	  <table class="table" style="background-color:orange">
       <c:forEach var="hvo" items="${cList }" varStatus="s">
        <c:if test="${s.index<9 }">
         <a href="../hotel/hotel_detail.do?hno=${s.hno }"><img src="${s.poster }" style="width: 100px;height: 100px"></a>
        </c:if>
       </c:forEach>
       </table>
      </div>
    </div>

  

    <div class="col-sm-9">
	<div class="wrapper row3">
	<table class="table">
	<script>
		// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(); 
		
		// 키워드로 장소를 검색합니다
		ps.keywordSearch('${hvo.addr}', placesSearchCB); 
		
		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
		
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new kakao.maps.LatLngBounds();
		
		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);    
		            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		        }       
		
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		    } 
		}
		
		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {
		    
		    // 마커를 생성하고 지도에 표시합니다
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: new kakao.maps.LatLng(place.y, place.x) 
		    });
		
		    // 마커에 클릭이벤트를 등록합니다
		    kakao.maps.event.addListener(marker, 'click', function() {
		        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
		        infowindow.setContent('<div style="padding:5px;font-size:12px;">' +${hvo.name} + '</div>');
		        infowindow.open(map, marker);
		    });
		}
		</script>
		</table>
	  <main class="container clear">
	     <div class="inline">
		  
	<c:forEach var="hvo" items="${list }" begin="0" end="4">
      <table class="table4">
        <tr>
          <td width="38%" class="text-left" rowspan="4">
            <a href="../hotel/hotel_detail.do?hno=${hvo.hno }"><img src="${hvo.hotel_image }" style="width:300px;height:250px"></a>
          </td>
          <td width="3%"></td>
          <td width="42%">
            <a href="../hotel/hotel_detail.do?hno=${hvo.hno }"><h4>${hvo.name }<span  style="color:orange">(${hvo.star })</span></h4></a>
			<p> <img src="../img/star.png" style="width:22px; height:22px"><h6>${hvo.grade }</h6></p>
			<p> <img src="../img/point.png" style="width:22px; height:22px">&nbsp;${hvo.addr }</p>
			<p> <img src="../img/clock.png" style="width:20px; height:20px">&nbsp;${hvo.time }</p>
          </td>
          <td width="17%">
            <a href="../hotel/hotel_detail.do?hno=${hvo.hno }"><button type="button" class="btn btn-md btn-warning" style="float: right;">상세보기</button></a>
          </td>
         </tr>
        </table>
        <br>
       </c:forEach>
       <div style="width: 10px;height: 50px"></div>
		<nav class="pagination">
		     <ul>
		     <c:if test="${startPage>1 }">
		       <li><a href="../hotel/hotel_all.do?page=${startPage-1 }">&laquo; Previous</a></li>
		      </c:if>
		      <c:forEach var="i" begin="${startPage }" end="${endPage }">
		         <li ${i==curpage?"class=current":"" }><a href="../hotel/hotel_all.do?page=${i }">${i }</a></li>
		       </c:forEach>  
		      <c:if test="${endPage<totalpage }">
		       <li><a href="../hotel/hotel_all.do?page=${endPage+1 }">Next &raquo;</a></li>
		      </c:if>
		     </ul>
	      </nav>
		  </div>
		  

	  </main>
	</div>
	
	</div>
	<div style="width: 10px;height: 50px"></div>
	</div>
    </div>
</body>
</html>