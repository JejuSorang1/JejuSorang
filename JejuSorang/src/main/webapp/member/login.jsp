<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- login CSS -->
<link rel="stylesheet" href="../css/style.css">    
<link rel="stylesheet" href="../css/login.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

</head>
<body>
<div class="container">
 <div class="container_login">
  <div class="frame">
    <div class="nav">
      <ul class="links">
        <li class="signin-active"><a class="btn login_logic_btn">로그인</a></li>
        <li class="signup-inactive"><a class="btn login_logic_btn">회원가입 </a></li>
      </ul>
    </div>
    <div ng-app ng-init="checked = false">
		<form class="form-signin" action="../member/login_check.do" method="post" name="login_frm" id="login_frm">
          <label for="id">아이디</label>
          <input class="form-styling" type="text" name="log_id" id="log_id" placeholder=""/>
          <label for="password">비밀번호</label>
          <input class="form-styling" type="password" name="log_pwd" id="log_pwd" placeholder=""/>
          <input type="checkbox" id="checkbox"/>
          <label for="checkbox" ><span class="ui"></span>아이디 기억하기</label>
          <div class="btn-animate">
            <a class="btn-signin" id="signinBtn">로그인</a>
          </div>
		</form>
        
		<form class="form-signup" action="../member/join_ok.do" method="post" name="join_frm" id="join_frm">
          <span class="d-flex justify-content-between">
          	<label for="id">아이디</label>
          	<input type=button id="checkBtn" value="아이디중복체크" class="btn btn-sm btn-primary"/>
          </span>
          
          <input class="form-styling" type="text" name="id" id="join_id" placeholder="" readonly/>
          
          <label for="pwd">비밀번호</label>
          <input class="form-styling" type="password" name="pwd" id="join_pwd" placeholder="" required/>
          
          <label for="confirmPassword">비밀번호 확인</label>
          <input class="form-styling" type="password" name="confirmPwd" id="confirmPwd" placeholder="" required/>
          
         	<span class="d-flex justify-content-between">
          <label for="email">이메일</label>
          <input type=button id="eBtn" class="btn btn-sm btn-primary" value="이메일확인"/>
          </span>
          <input class="form-styling" type="text" name="email" id="email" placeholder="" required/>
          <span style="color:white; font-size:14px " id="ePrint" class="text-center"></span>
          
          <label for="name">이름</label>
          <input class="form-styling" type="text" name="name" id="name" placeholder="" required/>
          
          <label for="birthday">생년월일</label>
          <input class="form-styling" type="date" name="birthday" id="birthday" placeholder=""/>
          
          <label for="post">우편번호&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            <input type=button id="postBtn" value="우편번호찾기" class="btn btn-sm btn-primary"/>
          </label>
          <input class="form-styling" type="text" name="post" id="post" placeholder="" readonly/>
          
          <label for="address1">주소</label>
          <input class="form-styling" type="text" name="address1" id="address1" placeholder=""/>
          
          <label for="address2">상세주소</label>
          <input class="form-styling" type="text" name="address2" id="address2" placeholder=""/>
          
          <label for="phone">전화번호&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            <input type=button id="tBtn" class="btn btn-sm btn-primary" value="전화번호 확인"/>
          </label>
          <input class="form-styling" type="text" name="phone" placeholder="010-0000-0000" id="phone" required/>
          <span style="color:white" id="tPrint"></span>



          <a ng-click="checked = !checked" class="btn-signup">회원가입</a>
		</form>
      
        <div  class="success">
              <svg width="270" height="270" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
       viewBox="0 0 60 60" id="check" ng-class="checked ? 'checked' : ''">
                 <path fill="#ffffff" d="M40.61,23.03L26.67,36.97L13.495,23.788c-1.146-1.147-1.359-2.936-0.504-4.314
                  c3.894-6.28,11.169-10.243,19.283-9.348c9.258,1.021,16.694,8.542,17.622,17.81c1.232,12.295-8.683,22.607-20.849,22.042
                  c-9.9-0.46-18.128-8.344-18.972-18.218c-0.292-3.416,0.276-6.673,1.51-9.578" />
         <div class="successtext">
                   <p> Thanks for signing up! Check your email for confirmation.</p>
                </div>
             </div>
      </div>
      
      <div class="forgot">
        <a href="#">Forgot your password?</a>
      </div>
      
      <div>
        <div class="cover-photo"></div>
        <div class="profile-photo"></div>
        <h1 class="welcome">Welcome, Chris</h1>
        <a class="btn-goback" value="Refresh" onClick="history.go()">Go back</a>
      </div>
  </div>
    
  <a id="refresh" value="Refresh" onClick="history.go()">
    <svg class="refreshicon"   version="1.1" id="Capa_1"  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
         width="25px" height="25px" viewBox="0 0 322.447 322.447" style="enable-background:new 0 0 322.447 322.447;"
         xml:space="preserve">
         <path  d="M321.832,230.327c-2.133-6.565-9.184-10.154-15.75-8.025l-16.254,5.281C299.785,206.991,305,184.347,305,161.224
                c0-84.089-68.41-152.5-152.5-152.5C68.411,8.724,0,77.135,0,161.224s68.411,152.5,152.5,152.5c6.903,0,12.5-5.597,12.5-12.5
                c0-6.902-5.597-12.5-12.5-12.5c-70.304,0-127.5-57.195-127.5-127.5c0-70.304,57.196-127.5,127.5-127.5
                c70.305,0,127.5,57.196,127.5,127.5c0,19.372-4.371,38.337-12.723,55.568l-5.553-17.096c-2.133-6.564-9.186-10.156-15.75-8.025
                c-6.566,2.134-10.16,9.186-8.027,15.751l14.74,45.368c1.715,5.283,6.615,8.642,11.885,8.642c1.279,0,2.582-0.198,3.865-0.614
                l45.369-14.738C320.371,243.946,323.965,236.895,321.832,230.327z"/>
    </svg>
  </a>
  </div>
</div>

</body>
</html>