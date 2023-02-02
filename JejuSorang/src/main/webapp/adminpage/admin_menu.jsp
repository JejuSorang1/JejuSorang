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
#css_tabs .tab1_content, #css_tabs .tab2_content, #css_tabs .tab3_content, #css_tabs .tab4_content, #css_tabs .tab5_content {
    padding:2em;
    border:1px solid #ddd;
    width:100%;
    height:100%
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
    <label for="tab1">공지사항 관리</label>
    <label for="tab2">묻고 답하기 관리</label>
    <label for="tab3">회원 관리</label>
    <label for="tab4">호텔예약 관리</label>
    <label for="tab4">렌트카예약 관리</label>
    <div class="tab1_content">Tab1 내용
        <br />마음은 무덤 웃으며, 수염을 환자의 누그러졌다. 벌써 설렁탕을 국물이 채이는 이 제시한다. 앉았으면 일찍이 관련이 얼굴을 사람은 먼곳을 자기 낸가. 쏟아져 뭔지가 기생 있는 않았다.</div>
    <div class="tab2_content">Tab2 내용
        <br />근 인력거꾼의 그 라디오로 한다느니보다 바이며, 왜 2위는 충실하였다. 말라서 듯이 높게 또 가지고 것이다. 궂은 같은 끝나가고 소리가 김첨지는 쳐보았건만, 액수에 후려갈겼다. 그 속에서 하고 과한데.</div>
    <div class="tab3_content">Tab3 내용
        <br />사십 듯이 만들 황급하였다. 말조차 벌던 방학을 있었다. 그러자, 날리고 젠장맞을 없었다. 보배를 수 조금 남은 없네, 있다. 그는 은전이 원 수 띄었다. 아씨, 하고 천하를 그들의 모든 병자에 뿐이다.</div>
    <div class="tab4_content">Tab4 내용
        <br />사십 듯이 만들 황급하였다. 말조차 벌던 방학을 있었다. 그러자, 날리고 젠장맞을 없었다. 보배를 수 조금 남은 없네, 있다. 그는 은전이 원 수 띄었다. 아씨, 하고 천하를 그들의 모든 병자에 뿐이다.</div>
    <div class="tab5_content">Tab5 내용
        <br />사십 듯이 만들 황급하였다. 말조차 벌던 방학을 있었다. 그러자, 날리고 젠장맞을 없었다. 보배를 수 조금 남은 없네, 있다. 그는 은전이 원 수 띄었다. 아씨, 하고 천하를 그들의 모든 병자에 뿐이다.</div>
</div>
</body>
</html>