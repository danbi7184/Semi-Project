<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<style>
	* {font-family:'Noto Sans KR', sans-serif; box-sizing: border-box;}
	
	html, body {
  	height: 100%;
	}
	
 	body {margin: 0; background-color: #EEEFF1;}
 	
 	.findPwd-form {width: 500px; height: 100%; background-color: #fff; margin-right: auto; margin-left: auto;
    padding: 50px; padding-left: 100px; padding-right: 100px; padding-bottom: 100px; 
    text-align: center; border: none; }
    
 	.login-tab-list {
    display: flex;
    width: 100%;
    margin-bottom: 24px;
    align-items: center;
	}
	
	#findPwd {
	background-color: white;
	color: black;
	}
	
	#emailDiv {
	text-align: left;
	margin-bottom: 10px;
	}
	
	#inputCertNum {
	margin-top: 8px; 
	display: none; 
	}
	
	.inputDiv {
	text-align: left;
	margin-bottom: 10px;
	}
	
	.button {display: inline-block;
	padding: 10px 20px;
	background-color: #e9e9e9;
	color: #666666;
	border: 1px solid rgba(128, 128, 128, 0.1);
	text-decoration: none;
	font-size: 16px;
	font-weight: lighter;
	cursor: pointer;
	}
	
	.input-group {
 	position: relative;
  	display: inline-block;
	}
	
	.inputType{
	width: 300px;
	height: 40px;
	text-align: left;
	border: 1px solid rgba(128, 128, 128, 0.2);
	border-radius: 5px;
	padding-right: 95px;
	padding-left: 10px;
	}
 	
 	#certBtn {
 	position: absolute;
 	top: 6px;
  	right: 7px;
  	padding: 5px 10px;
  	background-color: #e9e9e9;
  	color: black;
  	border: none;
  	cursor: pointer;
  	border-radius: 5px;
	}
	
	#findPwdBtn {
	width: 300px;
	height: 40px;
	border: 1px solid rgba(128, 128, 128, 0.2);
	border-radius: 5px;
	font-weight: bold;
	font-size: 16px;
	color: #666666;
	}

 	
</style>
</head>
<body>
<form action="${contextPath}/findPwdResult.me" method="post">
	<div class="findPwd-form">
   		<div><h3>비밀번호 찾기</h3></div>
		    <div class="login-tab-list">
				<a href=" ${contextPath}/findId.me" class="login-tab-list button">아이디 찾기</a>
				<a href="javascript:location.reload();" class="login-tab-list button" id="findPwd">비밀번호 찾기</a>
		    </div>
		     
		    <div>
				<div class="inputDiv">아이디</div>
					<div class="input-group">
					<input type="text" class="inputType" id="id" name="memberId">
					</div>
			</div>
		 	<br>
		 	<div>
				<div class="inputDiv">이메일</div>
				<div class="input-group">
					<input type="email" class="inputType" id="email" name="memberEmail">
					<button type="button" id="certBtn">인증 요청</button>
				</div>
				
				<div id="inputCertNum">
					<input type="text" class="inputType" id="certNum" placeholder="인증번호" maxlength="6" disabled>
				</div>
				
			</div>
			<br>
			<div>
				<button class="btn btn-secondary btn-lg" id="findPwdBtn" disabled>비밀번호 찾기</button>
			</div>
		      
                
	</div>
	</form>
</body>

<script>
	
	var id = document.getElementById('id'); // 아이디 입력 칸
	var inputCertNum = document.getElementById('inputCertNum'); // 인증번호 받는 div
	var certNum = document.getElementById('certNum'); // 인증번호 입력 칸
	var certBtn = document.getElementById('certBtn'); // 인증 요청 버튼 
	var findPwdBtn = document.getElementById('findPwdBtn'); // 비밀번호 찾기 버튼
	var code = "";  /*인증번호 저장할 곳*/
	
	$('#certBtn').click(function() {
		
		var email = $('#email').val();  /*입력한 이메일*/
	//		console.log('완성된 이메일 : ' + email); /* 이메일 오는지 확인*/
	
		// 이메일 유효성 검사
	    if (!validateEmail(email)) {
	      alert('유효한 이메일 주소를 입력해주세요.');
	      return;
	    }
	
		// 이메일 전송 관련
		var checkInput = $('#certNum'); /* 인증번호 입력 */
	
		$.ajax({
			type: 'GET',
			url: 'findPwdCheck.me?email=' + email, /*url을 통해 데이터를 보낼 수 있도록 GET방식, url명을 "mailCheck"로 지정 */
			success: function(data) {
	//				console.log('data : ' + data); // 코드 확인
				checkInput.attr('disabled', false); /*데이터가 성공적으로 들어오면 인증번호 입력란이 활성화되도록*/
				code = data;
				alert('인증번호가 전송되었습니다.');
				checkInput.focus();
			},
		});
	
	    inputCertNum.style.display = 'block';
	    
	    
	 });
		
		// 인증번호 입력 칸에 6글자가 되면 버튼 활성화
		certNum.addEventListener('input', function() {
			
			var input = event.target.value;
		    var numbers = /^\d+$/; // 숫자인지 확인하기 위한 정규식
	
		    if (!input.match(numbers)) {
		        event.target.value = input.replace(/\D/g, ''); // 숫자 이외의 문자 제거
		    }
			
	        if (input.length === 6) {
	            findPwdBtn.disabled = false;
	            findPwdBtn.style.backgroundColor = "black";
	            findPwdBtn.style.color = "white";
	            findPwdBtn.style.cursor = "pointer";
	        } else {
	            findPwdBtn.disabled = true;
	            findPwdBtn.style.backgroundColor = "";
	            findPwdBtn.style.color = "";
	            findPwdBtn.style.cursor = "default";
	        }
	    });
		
		
		// 비밀번호 찾기 버튼 눌렀을 때 위에 보낸 코드랑 인증번호 입력 창에 적은 코드 비교할 때 맞으면 비밀번호 결과 창으로, 아니면 인증번호가 틀리다는 alert 출력
		findPwdBtn.addEventListener('click', function(e){
			if(id.value === ''){
				alert('아이디를 입력해주세요.');
				e.preventDefault();
			} else if(code != certNum.value) {
				alert('인증번호가 다릅니다.');
				e.preventDefault();
			}
			
		});
		
		// 이메일 유효성 검사 함수
		  function validateEmail(email) {
		    var regex = /^[\w.%+-]+@[\w.-]+\.[a-zA-Z]{2,}$/;
		    return regex.test(email);
		  }

</script>
</html>