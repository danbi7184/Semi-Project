<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>

	*{font-family:'Noto Sans KR', sans-serif;
	  }
	
	.memInfoAll {
    width: calc(100% - 210px);
    padding: 0;
    float: right;
	}
	
	.memInfoSection {
    padding: 0;
	}
	
	.memInfoHeader{
    display: flex;
    align-items: center;
	}
	
	.memInfo {
    display: inline-block;
    font-size: 24px;
	}
	
	.memTable {
    width: 100%;
    line-height: 1.5;
    font-size: 14px;
    border-collapse: collapse;
    table-layout: fixed;
	}
	
	.context{
    text-align: left;
    font-weight: normal;
    vertical-align: top;
	}
	
	th, td {
    height: auto;
    padding: 15px 0;
    box-sizing: border-box;
    border-top: 1px solid #f1f1f1;
    border-bottom: none;
    font-size: 14px;
    text-align: left;
	}
	
	strong {
	vertical-align: middle;
	}
	
	.n-input {
	margin-bottom: 5px;
	}
	
	#change-password-btn {
    border: 1px solid #e5e5e5;
    background-color: #ffffff;
    color: #000000;
    height: 32px;
    line-height: 30px;
    padding-top: 0;
	}
	
	#change-nickName-btn {
    border: 1px solid #e5e5e5;
    background-color: #ffffff;
    color: #000000;
    height: 32px;
    line-height: 30px;
    padding-top: 0;
	}
	
	#change-email-btn {
    border: 1px solid #e5e5e5;
    background-color: #ffffff;
    color: #000000;
    height: 32px;
    line-height: 30px;
    padding-top: 0;
	}
	
	.leave {
    padding-top: 20px;
    border-top: 1px solid #f1f1f1;
    color: #aaaaaa;
    line-height: 32px;
    text-align: right;
    margin-top: 13px;
    margin-right: 40px;
	}
	
	h1{
	   margin-left: 20%;
	   margin-top: 4%
	}
	
	table{margin-left: auto; 
		  margin-right: auto;
		  margin-top: 2%;
		  border-collapse: separate;
  		  border-spacing: 0 20px;
  		  line-height: 1.5;
    	  font-size: 14px;
    	  width: 700px;
	}
	
  	td span {
    vertical-align: top;
	}
	
	#change-password-btn:active{
	transition-duration: 50s;
	}
	
	#leaveBtn {
    min-width: 70px;
    height: 32px;
    line-height: 30px;
    padding-top: 0;
    color: #777777;
    margin-left: 4px;
    border: 1px solid #e5e5e5;
    background-color: #ffffff;
	}
	
</style>

</head>
	<body>
	<section class="memInfoAll">

		<section class="memInfoSection">

			<header class="memInfoHeader">
				<h1 class="memInfo">기본 회원정보</h1>
			</header>

			<table class="memTable">
				<colgroup>
					<col style="width: 190px">
					<col style="width:*">
					<col style="width: 50%">
				</colgroup>
				
				<tbody>
				
				<!-- 아이디 -->
				<tr>
					<th scope="row" class="context">아이디</th>
					<td colspan="2" class="context"><strong>${ loginUser.memberId }</strong></td>
				</tr>

				<!-- 비밀번호 -->
				<tr id="pwdArea">
					<th scope="row" class="context">비밀번호</th>
					<td><strong> ********* </strong></td>
					<td>
						<button type="button" class="btn btn-light btn btn-primary btn-sm" id="changePwdBtn">비밀번호 변경</button>
					</td>
				</tr>

				<!--비밀번호 변경-->
				<form action="${contextPath}/updateMyInfoPwd.me" method="post">
				<tr id="changePwdArea" style="display: none">
					<th scope="row" class="context">비밀번호</th>
					<td colspan="2">
						<div class="Password">
							<div class="Password">
								<div class="input">
									<label for="password">현재 비밀번호</label>
									<div class="input-password" id="passwordDiv">
										<input type="password" class="allInput" id="password" name="currentPwd" maxlength="30">
									</div>
									<span id="currentPwdLength" class="pwdErrMsg" style="display: none;">4자리 이상 입력해주세요.</span>
								</div>
								
								<div class="input">
									<label for="newPassword">신규 비밀번호</label>
									<div class="input-password" id="newPasswordDiv">
										<input type="password" class="allInput" id="newPassword" name="newPwd" maxlength="30">
									</div>
									<span id="newPwdErrMsg" class="pwdErrMsg" style="display: none">4자리 이상 입력해주세요.</span>
									<span id="modifyNewPwd" class="pwdMsg" style="display: none">사용 가능한 비밀번호입니다.</span>
								</div>
								
								<div class="input">
									<label for="confirmPassword">신규 비밀번호 확인</label>
									<div class="input-password" id="confirmPasswordDiv">
										<input type="password" class="allInput" id="confirmPassword" maxlength="30">
									</div>
								</div>
								
								<div class="btn">
									<button type="button" class="n-btn btn-sm btn-lighter" id="cancelPwdBtn">취소</button>
									<button class="n-btn btn-sm btn-accent disabled" id="finishPwdBtn" disabled>완료</button>
								</div>
								
							</div>
					</td>
				</tr>
				</form>
				<!-- 이름 -->
				<tr>
					<th scope="row" class="context">이름(실명)</th>
					<td><strong>${ loginUser.memberName }</strong> <span></span></td>
				</tr>

				<!-- 닉네임 -->
				<form action="${contextPath}/updateMyInfoNickName.me" method="post">
				
				<input type="hidden" id="id" name="id" value="${ loginUser.memberId }"/>
				
				<tr id="nickNameArea">
					<th scope="row" class="context">닉네임</th>
					<td><strong>${ loginUser.memberNickName }</strong></td>
					<td>
						<button type="button" class="btn btn-light btn btn-primary btn-sm" id="changeNickNameBtn">닉네임 변경</button>
					</td>
				</tr>

				<!--닉네임 수정-->
				<tr id="changeNickNameArea" style="display: none">
					<th scope="row" class="context">닉네임</th>
					<td colspan="2">
						<div class="my-info-modify my-info-modify--nickname">
						
							<ul class="n-info-txt">
								<li>길이는 최대 15자 이내로 작성해주세요.</li>
								<li>중복 닉네임 불가합니다.</li>
							</ul>
							
							<div class="input">
								<input type="text" id="nickName" name="nickName" class="allInput" placeholder="닉네임 입력(최대 15자)" maxlength="15"> 
								<span id="currentNickName" class="validate">현재 닉네임 : ${ loginUser.memberNickName }</span>
							</div>
							
							<div class="btn-group">
								<button type="button" class="n-btn btn-sm btn-lighter" id="changeNickNameCancelBtn">취소</button>
								<button class="n-btn btn-sm btn-accent disabled" id="changeNickNameFinishBtn" disabled>완료</button>
							</div>
							
						</div>
					</td>
					
				</tr>
				
				</form>
	
				<!-- 이메일  -->
				<form action="${contextPath}/updateMyInfoEmail.me" method="post">
				
				<input type="hidden" id="emailid" name="id" value="${ loginUser.memberId }"/>
				
				<tr id="emailArea">
					<th scope="row" class="context">이메일</th>
					<td><strong>${ loginUser.memberEmail }</strong></td>
					<td>
						<button type="button" class="btn btn-light btn btn-primary btn-sm" id="changeEmailBtn">이메일 변경</button>
					</td>
				</tr>

				<!--이메일 인증-->
				<tr id="changeEmailArea" style="display: none">
					<th scope="row" class="context">이메일</th>
					<td colspan="2">
						<div class="my-info-modify">
						
							<ul class="n-info-txt">
								<li>메일주소 입력 후 인증하기 버튼을 누르시면, 회원님의 이메일로 이메일 인증 번호가 적힌메일이
									발송됩니다.</li>
								<li>아래에 인증 번호를 입력하시면 인증이 완료됩니다.</li>
							</ul>
							
							<div class="input input-btn">
								<input type="text" class="allInput" placeholder="이메일 주소 입력" id="email" name="email" maxlength="50">
								<button type="button" class="n-btn btn-sm btn-accent disabled" id="sendAuthenticationEmail" disabled>인증</button>
							</div>
							
							<div class="input input-w" style="display: none" id="emailAuthTempKeyDiv">
								<input type="text" class="allInput" id="emailAuthTempKey" maxlength="6" placeholder="인증번호 입력">
							</div>
							
							<div class="btn-group">
								<button type="button" class="n-btn btn-sm btn-lighter" id="changeEmailCancelBtn">취소</button>
								<button type="button" class="n-btn btn-sm btn-accent" id="changeEmailFinishBtn" disabled>완료</button>
							</div>
							
						</div>
					</td>
				</tr>
				</form>
				
				<!-- 휴대전화 -->
				<tr>
					<th scope="row" class="context">휴대전화</th>
					<td><strong>${ loginUser.memberPhone }</strong></td>
				</tr>
				
				</tbody>
				
			</table>
			
		</section>

		<p class="leave">
			탈퇴를 원하시면 회원탈퇴 버튼을 눌러주세요 <a href="${contextPath}/leave.me"
				class="btn btn-light btn btn-primary btn-sm btn btn-outline-secondary"
				id="leaveBtn" style="margin-right: 60px;">회원탈퇴</a>
		</p>

	</section>
            
	<script>
	
	
	// 비밀번호 관련
		var pwdArea = document.getElementById('pwdArea'); // 비밀번호 tr
		var changePwdArea = document.getElementById('changePwdArea'); // 비밀번호 변경 tr
		var changePwdBtn = document.getElementById('changePwdBtn'); // 비밀번호 변경 버튼
		var	cancelPwdBtn = document.getElementById('cancelPwdBtn'); // 비밀번호 취소 버튼
		var finishPwdBtn = document.getElementById('finishPwdBtn'); // 비밀번호 완료 버튼
		var password = document.getElementById('password'); // 현재 비밀번호 input
		var newPassword = document.getElementById('newPassword'); // 신규 비밀번호 input
		var confirmPassword = document.getElementById('confirmPassword'); // 신규 비밀번호 확인 input
		var currentPwdLength = document.getElementById('currentPwdLength'); // 현재 비밀번호(4자리 이상 입력해주세요)
		var newPwdErrMsg = document.getElementById('newPwdErrMsg'); // 신규 비밀번호(4자리 이상 입력해주세요)
		var newPwdErrMsg = document.getElementById('newPwdErrMsg'); // 신규 비밀번호(4자리 이상 입력해주세요)
		
		changePwdBtn.addEventListener('click', function(){
			pwdArea.style.display = 'none';
			changePwdArea.style.display = 'table-row';
		})
		
		cancelPwdBtn.addEventListener('click', function(){
			pwdArea.style.display = 'table-row';
			changePwdArea.style.display = 'none';
		})
		
		password.addEventListener('input', function(){
			var passwordValue = password.value; // 현재 비밀번호 입력 값 
			if(passwordValue.length > 0 && passwordValue.length < 4) {
				currentPwdLength.style.display = 'inline-block';
			} else {
				currentPwdLength.style.display = 'none';
			}
		})
		
		newPassword.addEventListener('input', function(){
			var newPasswordValue = newPassword.value; // 신규 비밀번호 입력 값 
			if(newPasswordValue.length > 0 && newPasswordValue.length < 4) {
				newPwdErrMsg.style.display = 'inline-block';
				modifyNewPwd.style.display = 'none';
			} else if(newPasswordValue.length < 1){
				newPwdErrMsg.style.display = 'none';
				modifyNewPwd.style.display = 'none';
			} else {
				newPwdErrMsg.style.display = 'none';
				modifyNewPwd.style.display = 'inline-block';
			}
		})
		
		confirmPassword.addEventListener('input', function(){
			var newPasswordValue = newPassword.value; // 신규 비밀번호 입력 값 
			var confirmPasswordValue = confirmPassword.value; // 신규 비밀번호 확인 입력 값 
			if(newPasswordValue == confirmPasswordValue) {
				finishPwdBtn.disabled = false;
			} else {
				finishPwdBtn.disabled = true;
			}
		})
		
		finishPwdBtn.addEventListener('click', function(){
			var newPasswordValue = newPassword.value; // 신규 비밀번호 입력 값 
			var confirmPasswordValue = confirmPassword.value; // 신규 비밀번호 확인 입력 값 
			if(newPasswordValue != confirmPasswordValue){
				alert('신규 비밀번호와 확인 비밀번호가 같지 않습니다.');
				newPassword.focus();
			}
		})
		
		// 닉네임
			
		// 닉네임 변경 창
		var nickName = document.getElementById('nickName'); // 닉네임 input
		var nickNameArea = document.getElementById('nickNameArea'); // 닉네임 테이블
		var changeNickNameArea = document.getElementById('changeNickNameArea'); // 닉네임 수정 테이블
		var changeNickNameBtn = document.getElementById('changeNickNameBtn'); // 닉네임 변경 버튼
		var	changeNickNameCancelBtn = document.getElementById('changeNickNameCancelBtn'); // 닉네임 취소 버튼
		var changeNickNameFinishBtn = document.getElementById('changeNickNameFinishBtn'); // 닉네임 완료 버튼
		
		changeNickNameBtn.addEventListener('click', function(){
		 	nickNameArea.style.display = 'none';
		  	changeNickNameArea.style.display = 'table-row';
		});
		
		changeNickNameCancelBtn.addEventListener('click', function(){
			nickNameArea.style.display = 'table-row';
			changeNickNameArea.style.display = 'none';
		});
		
		// 닉네임 중복 확인
		window.onload = () =>{
			document.getElementById('nickName').addEventListener('input', function(){
				const currentNickName = document.getElementById('currentNickName');
					if(this.value.trim() == ''){
						currentNickName.innerText = '현재 닉네임 : ${ loginUser.memberNickName }';
						currentNickName.style.color = 'black';
						changeNickNameFinishBtn.disabled = true;
					} else{
						$.ajax({
					 		url: '${contextPath}/checkNickname.me',
							data: {nickName:this.value.trim()},
							success: data =>{
								console.log(data);
								if(data == 'yes'){
									currentNickName.innerText = '좋은 닉네임입니다.';
									currentNickName.style.color = 'green';
									changeNickNameFinishBtn.disabled = false;
								} else if(data == 'no'){
									currentNickName.innerText = "이미 사용중인 닉네임입니다.";
									currentNickName.style.color = 'red';
									changeNickNameFinishBtn.disabled = true;
					 			}
							},
							error: data =>{
								console.log(data);
							}
						});
					}
			});	
			
		}
			
		// 이메일		
			
		// 이메일	변경 창
		var email = document.getElementById('email'); // 이메일 입력 칸
		var emailArea = document.getElementById('emailArea'); // 이메일 테이블
		var changeEmailBtn = document.getElementById('changeEmailBtn'); // 이메일 변경 버튼
		var changeEmailArea = document.getElementById('changeEmailArea'); // 이메일 수정 테이블
		var emailAuthTempKeyDiv = document.getElementById('emailAuthTempKeyDiv'); // 인증번호 입력 div
		var emailAuthTempKey = document.getElementById('emailAuthTempKey'); // 인증번호 입력 칸
		var	changeEmailCancelBtn = document.getElementById('changeEmailCancelBtn'); // 이메일 취소 버튼
		var changeEmailFinishBtn = document.getElementById('changeEmailFinishBtn'); // 이메일 완료 버튼
		var sendAuthenticationEmail = document.getElementById('sendAuthenticationEmail'); // 이메일 인증 버튼
		
		email.addEventListener('input', function(){
			var emailValue = email.value; // 이메일 값
			if(emailValue === '') {
				sendAuthenticationEmail.disabled = true;
			} else {
				sendAuthenticationEmail.disabled = false;
			}
		});
		
			
		var code = ""; // 인증번호 저장할 곳
		sendAuthenticationEmail.addEventListener('click', function(){
			
			var emailValue = email.value;
			
			// 이메일 유효성 검사 함수
			function validateEmail(emailValue) {
				var regex = /^[\w.%+-]+@[\w.-]+\.[a-zA-Z]{2,}$/;
				return regex.test(emailValue);
			}
			
			// 이메일 유효성 검사
			if (!validateEmail(emailValue)) {
				alert('유효한 이메일 주소를 입력해주세요.');
				email.focus();
				return;
			}
			
			$.ajax({
		 		type: 'GET',
		 		url: 'changeEmailCheck.me?email=' + emailValue, // url을 통해 데이터를 보낼 수 있도록 GET방식, url명을 "mailCheck"로 지정
		 		success: function(data) {
		 			code = data;
		 			alert('인증번호가 전송되었습니다.');
		 		},
		 		
	 		});
			
	 		emailAuthTempKeyDiv.style.display = 'block';
	 		emailAuthTempKey.focus();
		})
		
		// 인증번호 입력 칸에 6글자가 되면 버튼 활성화
		emailAuthTempKey.addEventListener('input', function() {
			
			var input = event.target.value;
		    var numbers = /^\d+$/; // 숫자인지 확인하기 위한 정규식
	
		    if (!input.match(numbers)) {
		        event.target.value = input.replace(/\D/g, ''); // 숫자 이외의 문자 제거
		    }
			
	        if (input.length === 6){
	        	changeEmailFinishBtn.disabled = false;
	        	changeEmailFinishBtn.style.backgroundColor = "black";
	        	changeEmailFinishBtn.style.color = "white";
	        	changeEmailFinishBtn.style.cursor = "pointer";
	        } else {
	        	changeEmailFinishBtn.disabled = true;
	        	changeEmailFinishBtn.style.backgroundColor = "";
	        	changeEmailFinishBtn.style.color = "";
	        	changeEmailFinishBtn.style.cursor = "default";
	        }
	    });
		
		changeEmailBtn.addEventListener('click', function(){
		  	emailArea.style.display = 'none';
		  	changeEmailArea.style.display = 'table-row';
		});
		
		changeEmailCancelBtn.addEventListener('click', function(){
			changeEmailArea.style.display = 'none';
			emailArea.style.display = 'table-row';
		});
		
		changeEmailFinishBtn.addEventListener('click', function(){
			var emailAuthTempKeyValue = emailAuthTempKey.value;
			
			if(code === emailAuthTempKeyValue){
				changeEmailFinishBtn.type = 'submit';
			} else {
				alert('인증번호가 다릅니다.다시 확인해 주세요');
			}
		})
		
	</script>
	

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>