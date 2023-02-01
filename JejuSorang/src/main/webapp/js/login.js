
 $(function() {
	$(".btn").click(function() {
		$(".form-signin").toggleClass("form-signin-left");
    $(".form-signup").toggleClass("form-signup-left");
    $(".frame").toggleClass("frame-long");
    $(".signup-inactive").toggleClass("signup-active");
    $(".signin-active").toggleClass("signin-inactive");
    $(".forgot").toggleClass("forgot-left");   
    $(this).removeClass("idle").addClass("active");
	});
});

Shadowbox.init({
	players:['iframe']
})

$(function(){
	$('#signinBtn').click(function(){
		//id,pwd => Model로 전송
		let id=$('#log_id').val();
		if(id.trim()===""){
			$('#log_id').focus();
			return
		}
		let pwd=$('#log_pwd').val();
		if(pwd.trim()===""){
			$('#log_pwd').focus();
			return
		}
		
		$.ajax({
			type:'post',
			url:'../member/login_check.do',
			data:{"id":id,"pwd":pwd},
			success:function(result){
				let res=result.trim();
				if(res==='NOID'){
					alert("아이디가 존재하지 않습니다!!")
					$('#log_id').val("");
					$('#log_pwd').val("");
					$('#log_id').focus();
				}
				else if(res==='NOPWD'){
					alert("비밀번호가 틀립니다!!")
					$('#log_pwd').val()
					$('#log_pwd').focus()
				}
				else{
					location.href="../main/main.do";
				}
			}
		})
	})
	$('#logoutBtn').click(function(){
		$.ajax({
			type:'post',
			url:'../member/logout.do',
			success:function(result){
				location.href="../main/main.do"
			}
		})
	})
})
$(function(){
	$('#checkBtn').click(function(){
		Shadowbox.open({
			content:'../member/idcheck.do',
			player:'iframe',
			width:420,
			height:180,
			title:'아이디 중복체크'
		})
	})
	$('#postBtn').click(function(){
		Shadowbox.open({
			content:'../member/postfind.do',
			player:'iframe',
			width:580,
            height:450,
            title:'우편번호 검색'
		})
	})
	//email검색
	$('#eBtn').click(function(){
		let email=$('#email').val();
		if(email.trim()===""){
			$('#email').focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'../member/email_check.do',
			data:{"email":email},
			success:function(result){
				let count=Number(result.trim());
				if(count==0){
					$('#ePrint').text(email+"는(은) 사용 가능한 이메일입니다")
					$('#email').prop('readonly',true)
					
				}else{
					$('#ePrint').text(email+"는(은) 이미 사용중인 이메일입니다.")
					$('#email').val("")
					$('#email').focus();
				}
			}
		})
	})
	//전화번호 검색
	$('#tBtn').click(function(){
		let phone=$('#phone').val();
		if(phone.trim()===""){
			$('#phone').focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'../member/tel_check.do',
			data:{"phone":phone},
			success:function(result){
				let count=Number(result.trim());
				if(count==0){
					$('#tPrint').text(phone+"는(은) 사용 가능한 전화번호입니다")
					$('#phone').prop('readonly',true)
					
				}else{
					$('#tPrint').text(phone+"는(은) 이미 사용중인 전화번호입니다")
					$('#phone').val("")
					$('#phone').focus();
				}
			}
		})
	})
	//회원가입 => 유효성 (NOT NULL) => 오라클 제약조건

	$('.btn-signup').click(function(){
		
		let id=$('#join_id').val();
		if(id.trim()===""){
			alert("아이디 중복 체크를 하세요")
			$('#id').focus();
			return
		}
		//비밀번호
		let pwd1=$('#join_pwd').val()
		if(pwd1.trim()===""){
			alert("비밀번호는 필수 입력입니다")
			$('#join_pwd').focus();
			return;
		}
		let pwd2=$('#confirmPwd').val();
		if(pwd1.trim()!==pwd2.trim()){
			alert("비밀번호가 틀립니다\n다시 입력하세요")
			$('#confirmPwd').val("")
			$('#confirmPwd').focus();
			return;
		}
		let name=$('#name').val()
		if(name.trim()===""){
			alert("이름은 필수 입력입니다")
			$('#name').focus()
			return
		}
		let day=$('#birthday').val()
		if(day.trim()===""){
			alert("생년월일은 필수 입력입니다")
			$('#day').focus()
			return
		}
		let email=$('#email').val()
		if(email.trim()===""){
			alert("이메일은 필수 입력입니다")
			$('#email').focus()
			return
		}
		let post=$('#post').val()
		if(post.trim()===""){
			alert("우편번호 검색을 하세요")
			$('#post').focus()
			return
		}
		let address1=$('#address1').val()
		if(address1.trim()===""){
			alert("우편번호 검색을 하세요")
			$('#address1').focus()
			return
		}
		let address2=$('#address2').val()
		if(address2.trim()===""){
			alert("상세주소를 하세요")
			$('#address2').focus()
			return
		}
		let phone=$('#phone').val()
		if(phone.trim()===""){
			alert("전화번호를 입력하세요")
			$('#phone').focus()
			return
		}
		
		$('#join_frm').submit();
	})
})

