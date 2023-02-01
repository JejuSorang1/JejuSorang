<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css"> 
<link rel="stylesheet" href="../css/rent_search.css"> 

</head>
<body>
  <div class="container">
  <div class="row">
  <section class="booking_part" id="searchbar" >
        <div class="container">
            <div class="row">
                <div class="col-lg-12" id="col">
                    <div class="booking_content" id="searchbar1" >
                                <div class="booking_form">
                                    <form action="#">
                                        <div class="form-row">
                                            <div class="form_colum" style="width:300px">
                                                <select class="nc_select">
                                                    <option selected>제주국제공항</option>
                                                </select>
                                            </div>
                                            <div class="form_colum" style="width:300px">
                                                <input id="datepicker_3" placeholder="예약시작일">
                                            </div>
                                            <div class="form_colum" style="width:300px">
                                                <input id="datepicker_4" placeholder="예약종료일">
                                            </div>
                                            <div class="form_btn">
                                                <a href="../rent/rent_search.do?car_no=${cvo.car_no }" class="btn_1" >검색</a>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="col-sm-3">
		<div class="">
	<form name="form1" method="post" action="" enctype="multipart/form-data">   
	<div class="col-md-12">
	<div class="form-group">
	출발장소:<br>
	<input type="text" class="form-control" value="제주국제공항">
	</div>
        <div class="form-group">
		예약시작일:
            <div class="input-group date" id="datetimepicker6">
                <input type="text" class="form-control" name="startdate" id="startdate" value="" >
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
    </div>
    <div class="col-md-12">
        <div class="form-group">
		예약종료일:
            <div class="input-group date" id="datetimepicker7">
                <input type="text" class="form-control" name="enddate" id="enddate" value="">
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
    </div>

	<div class="col-md-12">
		<input type="hidden" name="roomspar" id="roomspar" value="1">
		<input type="submit" name="submit" value="검색" class="btn btn-warning text-white mb-2">
	</div>	
	</form>
	</div><form name="form1" method="post" action="" enctype="multipart/form-data"> 

   </form>
		</div>
		<div class="col-sm-9 wrap" id="contentrents">
          <section class="col-md-12 " >
          <div class="container" > 
				<div class="col-sm-10" >
				<c:forEach var="cvo" items="${list }" begin="0" end="4" >
				<div class="rentlist">
				  <div style="display: inline-block;">
				 <a href="../rent/car_detail.do?car_no=${cvo.car_no }"><img src="${cvo.car_image }" id="rentimg"></a>
				 </div>
				 <div style="display: inline-block;" class="rentsize">
				  <h3>${cvo.car_name }</h3><div style="vertical-align: middle;"><h3 id="price">${cvo.car_price }원</h3></div>
				  
				<p class="short-text">업체:레인보우모빌리티</p>
				<p>${cvo.car_option1}</p>
				<div>
			    <a href="../rent/car_detail.do?car_no=${cvo.car_no  }"><button type="button" class="btn btn-md btn-warning text-white" style="float: right;">예약하기</button></a>
			  </div>
				
				 </div>
				</div>
				<br>
				</c:forEach>
			 </div>
        </div>
    </section>
    </div>
     <nav class="pagination">
        <ul>
        <c:if test="${startPage>1}">
          <li><a href="../rent/rent_search.do?page=${startPage-1 }">&laquo; 이전</a></li>
          </c:if>
          <c:forEach var="i" begin="${startPage }" end="${endPage }">
            <li ${i==curpage?"class=current":"" }><a href="../rent/rent_search.do?page=${i }">${i }</a></li>
          </c:forEach>
          <c:if test="${endPage<totalpage }">
          <li><a href="../rent/rent_search.do?page=${endPage+1 }">다음 &raquo;</a></li>
          </c:if>
        </ul>
      </nav>
  </div>
</div>
</body>
</html>