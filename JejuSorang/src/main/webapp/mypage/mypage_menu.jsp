<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#css_tabs {
    font-family:'nanumgothic', '나눔고딕', 'malgun gothic', '맑은 고딕', 'dotum', '돋움', sans-serif
}
/* 탭 선택 시 표시할 요소(div) 정의(1번 탭 선택 시 첫 번째 div 요소 표시) */
#css_tabs input:nth-of-type(1), #css_tabs input:nth-of-type(1) ~ div:nth-of-type(1), #css_tabs input:nth-of-type(2), #css_tabs input:nth-of-type(2) ~ div:nth-of-type(2), #css_tabs input:nth-of-type(3), #css_tabs input:nth-of-type(3) ~ div:nth-of-type(3), #css_tabs input:nth-of-type(4), #css_tabs input:nth-of-type(4) ~ div:nth-of-type(4),#css_tabs input:nth-of-type(5), #css_tabs input:nth-of-type(5) ~ div:nth-of-type(5) {
    display:none
}
#css_tabs input:nth-of-type(1):checked ~ div:nth-of-type(1), #css_tabs input:nth-of-type(2):checked ~ div:nth-of-type(2), #css_tabs input:nth-of-type(3):checked ~ div:nth-of-type(3),#css_tabs input:nth-of-type(4):checked ~ div:nth-of-type(4),#css_tabs input:nth-of-type(5):checked ~ div:nth-of-type(5) {
    display:block
}
/* 라벨 기본 스타일 지정 */
#css_tabs > label {
    display:inline-block;
    font-variant:small-caps;
    font-size:.9em;
    padding:5px;
    text-align:center;
    width:18%;
    line-height:1.8em;
    font-weight:700;
    border-radius:3px 3px 0 0;
    background:#eee;
    color:black;
    border:1px solid #ccc;
    border-width:1px 1px 0
}
#css_tabs > label:hover {
    cursor:pointer
}
#css_tabs label[for=tab1] {
    margin-left:3.5em
}
/* 선택된 라벨, 커서를 올린 라벨 스타일 지정 */
#css_tabs input:nth-of-type(1):checked ~ label:nth-of-type(1), #css_tabs > label[for=tab1]:hover {
    
    color:black
}
#css_tabs input:nth-of-type(2):checked ~ label:nth-of-type(2), #css_tabs > label[for=tab2]:hover {
    
    color:black
}
#css_tabs input:nth-of-type(3):checked ~ label:nth-of-type(3), #css_tabs > label[for=tab3]:hover {
    
    color:black
}
#css_tabs input:nth-of-type(4):checked ~ label:nth-of-type(4), #css_tabs > label[for=tab4]:hover {
    
    color:black
}
#css_tabs input:nth-of-type(5):checked ~ label:nth-of-type(5), #css_tabs > label[for=tab5]:hover {
    
    color:black
}
/* 실제 내용이 담긴 div 요소 스타일 지정 */
#css_tabs .tab_content{
    padding:2em;
    border:1px solid #ddd;
    width:100%;
    height:100%
}

a {
  text-decoration: none;
  color:black;
}
</style>
</head>
<body>
  <div id="css_tabs">
    <input id="tab1" type="radio" name="tab" checked="checked" />
    <input id="tab2" type="radio" name="tab" />
    <input id="tab3" type="radio" name="tab" />
    <input id="tab4" type="radio" name="tab" />
    <input id="tab5" type="radio" name="tab" />
    <label for="tab1"><a href="../adminpage/notice_list.do">정보 수정</a></label>
    <label for="tab2">묻고 답하기 관리</label>
    <label for="tab3">회원 관리</label>
    <label for="tab4">호텔예약 관리</label>
    <label for="tab5">렌트카예약 관리</label>
    <hr>
    <div style="height: 50px"></div>
    
</div>
</body>
</html>