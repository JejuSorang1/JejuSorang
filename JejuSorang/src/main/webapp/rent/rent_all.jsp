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
<style type="text/css">

</style>
</head>
<body>
  <div class="container">
  <div class="row">
    <section class="booking_part" id="searchbar" >
        <div class="container">
            <div class="row">
                <div class="col-lg-12" style="background-color: ">
                    <div class="booking_content" id="searchbar1" >
                                <div class="booking_form">
                                    <form action="#">
                                        <div class="form-row">
                                            <div class="form_colum" style="width:300px; margin-left: 5px;">
                                                <select class="nc_select" >
                                                    <option selected>제주국제공항</option>
                                                </select>
                                            </div>
                                            <div class="form_colum" style="width:300px;  margin-left: 5px;">
                                                <input id="datepicker_3" placeholder="예약시작일">
                                            </div>
                                            <div class="form_colum" style="width:300px;  margin-left: 5px;">
                                                <input id="datepicker_4" placeholder="예약종료일">
                                            </div>
                                            <div class="form_btn" style="margin-left: 5px;">
                                              <input type="submit" name="submit" value="검색" class="btn btn-warning text-white mb-2">
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
       <div class="table">
	  <form name="form1" method="post" action="" enctype="multipart/form-data"> 
	    <div class="col-md-12">
          <h5>호텔 종류</h5>
            <div class="checkbox opinion" id="opinion">
              <ul id="type">
                <li><input type="checkbox" value="stars1" name="stars1" id="stars1">&nbsp;전체</li>
                <li><input type="checkbox" value="stars2" id="stars2" name="stars2">&nbsp;비즈니스 호텔</li>
                <li><input type="checkbox" value="stars2" id="stars2" name="stars2">&nbsp;가성비 호텔</li>
              </ul>
            </div>
        </div>
        <div style="height: 10px"></div>
	    <div class="col-md-12">
          <h5>호텔 성급</h5>
            <div class="checkbox opinion" id="opinion">
              <ul id="stars">
                <li><input type="checkbox" value="stars1" name="stars1" id="stars1">&nbsp;1성급</li>
                <li><input type="checkbox" value="stars2" id="stars2" name="stars2">&nbsp;2성급</li>
                <li><input type="checkbox" value="stars3" id="stars3" name="stars3">&nbsp;3성급</li>
                <li><input type="checkbox" value="stars4" id="stars4" name="stars4">&nbsp;4성급</li>
                <li><input type="checkbox" value="stars4" id="stars4" name="stars5">&nbsp;5성급</li>
                <li><input type="checkbox" value="stars4" id="stars4" name="stars0">&nbsp;해당 사항 없음</li>
              </ul>
            </div>
        </div>
        <div style="height: 10px"></div>
        <div class="col-md-12">
          <h5>금액</h5>
            <input type="range" min="1" max="100" value="50" class="price" id="price">
            <p>Vlaue:<span id="value"></span></p>
        </div> 
        
      </form>
    </div>`
    </div>
          <div class="row" >
          <section class="col-md-12" >
          <div class="container" > 
				<div class="col-md-12" style="width: 100%;" >
				 <table class="table1" style="width: 100%;" >
                <tr>
                  <td>
                    <c:forEach var="cvo" items="${list }" begin="0" end="4">
                      <table class="table2" >
                        <tr>
                          <td width="38%" class="text-left" rowspan="4">
                            <a href="../rent/car_detail.do?car_no=${cvo.car_no }"><img src="${cvo.car_image }" style="width:300px;" id="rentimg"></a>
                          </td>
                          <td width="62%">
                            <p> <h3>${cvo.car_name }</h3></p> <h3 id="price" ><span >${cvo.car_price }</span>원</h3>
                           <p class="short-text">업체:레인보우모빌리티</p>
                            <p>${cvo.car_option1}</p>
                            <a href="../rent/car_detail.do?car_no=${cvo.car_no  }"><button type="button" class="btn btn-md btn-warning text-white" style="float: right; margin-right: 5px;">예약하기</button></a>
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
        <c:if test="${startPage>1}">
          <li><a href="../rent/rent_all.do?page=${startPage-1 }">&laquo; 이전</a></li>
          </c:if>
          <c:forEach var="i" begin="${startPage }" end="${endPage }">
            <li ${i==curpage?"class=current":"" }><a href="../rent/rent_all.do?page=${i }">${i }</a></li>
          </c:forEach>
          <c:if test="${endPage<totalpage }">
          <li><a href="../rent/rent_all.do?page=${endPage+1 }">다음 &raquo;</a></li>
          </c:if>
        </ul>
      </nav>
  </div>
</div>
</body>
</html>