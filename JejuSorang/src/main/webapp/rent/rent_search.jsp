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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	//초기화
 	var chk_arr=[];
 	var pageType = 'text';
 	$('.searchBtn').show();
 	$('.cbxBtn').hide();
 	
	$('#opinion').on('click', function(event){
		$("input:checkbox[name='carchk']:checked").each(function(){
			var chk=$(this).val();
			chk_arr.push(chk);
		})
		
		$('#cbxList').val(chk_arr);
		document.getElementById("formId2").submit();
	})
	
	//등급 체크박스 변경 시
	$('#rtnCbxList').on('change', function(event){
		if($('#rtnCbxList').val() == ""){
			$('.cbxBtn').hide();
			$('.searchBtn').show();
		}else{
			$('.cbxBtn').show();
			$('.searchBtn').hide();
		}
		pageType = 'cbx';
		var chkList = $('#rtnCbxList').val().split(',');
 		for(var i=0; i< chkList.length; i++){
			if(chkList[i] == "경차"){
				$('#chk1').prop("checked", true);
			}else if(chkList[i] == "준중형"){
				$('#chk2').prop("checked", true);
			}else if(chkList[i] == "중형"){
				$('#chk3').prop("checked", true);
			}else if(chkList[i] == "RV"){
				$('#chk4').prop("checked", true);
			}else if(chkList[i] == "수입"){
				$('#chk5').prop("checked", true);
			}else if(chkList[i] == "고급"){
				$('#chk6').prop("checked", true);
			}
		} 
	})
	
	//hidden은 change이벤트가 이루어지지 않으므로, trigger를 줘서 강제 이벤트
	$('#rtnCbxList').val($('#rtnCbxList').val()).trigger('change');
	
	
}); 
</script>
</head>
<body>
  <div class="container">
  <div class="row">
    <section class="booking_part" id="searchbar" >
        <div class="container">
            <div class="row">
                <div class="col-lg-12 ser" >
                    <div class="booking_content" id="searchbar1" >
                                <div class="booking_form">
                                    <form action="#">
                                        <div class="form-row">
                                            <div class="form_colum" style="width:300px; margin-left: 5px; height: 5px; margin-top: 5px;">
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
                                              <input type="submit" name="submit" value="검색" class="btn btn-warning text-white mb-2" style="margin-top: 5px">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
       <div class="col-sm-3 ">
       <div class="table" style="width: 80%">
	  <form id = "formId1" name="form1" method="post" action="../rent/rent_search.do"> 
	    <div class="col-md-12">
	    <br>
          <h5>자동차 모델</h5>
            <div style="display: inline-block;">
            <input id = "searchText" type="text" name="search" size=25 class="input-sm" value="${search }" style="width: 75%;"> 
            <input type=submit value="검색" style="border: 0; border-radius: 15%; background-color: #F8B03A; padding: 2%; color: white;">
            </div>
        </div>
     </form> 
     <form id ="formId2" name="form2" method="post" action="../rent/rent_search.do"> 
        <hr>
        <div style="height: 10px"></div>
	    <div class="col-md-12">
          <h5>차량 등급</h5>
            <div class="checkbox opinion" id="opinion">
            <input type="hidden" name="type" value="cbx">
            <input type="hidden" id = "cbxList" name="cbxList" value="">
            <input type="hidden" id = "rtnCbxList" name="rtnCbxList" value="${rtnCbxList }">
              <ul id="models">
                <li><input type="checkbox" name="carchk" value="경차" id ='chk1'  >&nbsp;경차</li>
                <li><input type="checkbox" name="carchk" value="준중형" id ='chk2'>&nbsp;준중형</li>
                <li><input type="checkbox" name="carchk" value="중형" id ='chk3'>&nbsp;중형</li>
                <li><input type="checkbox" name="carchk" value="RV" id ='chk4'>&nbsp;RV</li>
                <li><input type="checkbox" name="carchk" value="수입" id ='chk5'>&nbsp;수입</li>
                <li><input type="checkbox" name="carchk" value="고급" id ='chk6'>&nbsp;고급</li>
                <li><input type="checkbox" name="carchk" value="승합" id ='chk7'>&nbsp;승합</li>
              </ul>
            </div>
        </div>
        <div style="height: 10px"></div>
        
      </form>
    </div>
    </div>
          <section class="col-md-8" >
          <div class="container" > 
				<div class="col-md-12"  >
				 <table class="table1"  >
                <tr>
                  <td>
                    <c:forEach var="cvo" items="${list }" begin="0" end="4">
                      <table class="table2" >
                        <tr>
                          <td width="38%" class="text-left" rowspan="4">
                            <a href="../rent/car_detail.do?car_no=${cvo.car_no }"><img src="${cvo.car_image }" style="width:300px;" id="rentimg"></a>
                          </td>
                          <td width="62%">
                            <h3>${cvo.car_name }</h3><h3 id="price" style="color: #F8B03A;" ><span ><strong>${cvo.car_price }</strong></span>원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
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
     <nav class="pagination">
        <ul>
        <c:if test="${startPage>1}">
          <li class = "searchBtn"><a href="../rent/rent_search.do?search=${search }&page=${startPage-1 }">&laquo; 이전</a></li>
          <li class = "cbxBtn"><a href="../rent/rent_search.do?type=cbx&&cbxList=${rtnCbxList}&page=${startPage-1 }">&laquo; 이전</a></li>
          </c:if>
          <c:forEach var="i" begin="${startPage }" end="${endPage }">
            <li class = "searchBtn" ${i==curpage?"class=current":"" }><a  href="../rent/rent_search.do?search=${search }&page=${i }">${i }</a></li>
            <li class = "cbxBtn" style="display : none" ${i==curpage?"class=current":"" }><a  href="../rent/rent_search.do?type=cbx&&cbxList=${rtnCbxList}&page=${i }">${i }</a></li>
          </c:forEach>
          <c:if test="${endPage<totalpage }">
          <li class = "searchBtn"><a  href="../rent/rent_search.do?search=${search }&page=${endPage+1 }">다음 &raquo;</a></li>
          <li class = "cbxBtn"><a  href="../rent/rent_search.do?type=cbx&&cbxList=${rtnCbxList}&page=${endPage+1 }">다음 &raquo;</a></li>
          </c:if>
        </ul>
      </nav>
  </div>
</div>
</body>
</html>