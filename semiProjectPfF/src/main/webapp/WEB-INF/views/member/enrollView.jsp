<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PfF 회원가입</title>
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	* {font-family:'Noto Sans KR', sans-serif;}
	
	body{background: #EEEFF1 url(${ contextPath }/resources/image/y-repeat.png) repeat-y 50% 0;}
	
	.box{
		width: 400px; height: 100%;background-color: #fff; margin-right: auto; margin-left: auto;
    padding-top: 50px; padding-left: 100px; padding-right: 100px; padding-bottom: 50px; 
    text-align: center; border: none;
	}
	
	.input-container{
		position:relative;
		margin-bottom:30px;
	}
	.input-container label{
		position:absolute;
		top:10px;
		left:60px;
		font-size:16px;
		color:#555;	
	    pointer-event:none;
		transition: all 0.2s ease-in-out;
	}
	.input-container label b{
		color: #e74c3c;
	}
	.input-container input{ 
	  border:0;
	  border-bottom:1px solid #555;  
	  background:transparent;
	  width:70%;
	  padding:8px 0 5px 0;
	  font-size:16px;
	  color:#555;
	}
	.input-container input:focus{ 
	 border:none;	
	 outline:none;
	 border-bottom:1px solid #e74c3c;	
	}
	
	.input-container input:focus ~ label,
	.input-container input:valid ~ label{
		top:-12px;
		font-size:12px;
		
	}
	.gender-container {position:relative; margin-bottom:30px; float: left; margin-left: 15%;}
	
	#postCode{border:0; border-bottom:1px solid #555; background:transparent; width:45%; padding:8px 0 5px 0; font-size:16px; color:#555;}
	#postCode:focus{border:none; outline:none; border-bottom:1px solid #e74c3c;}
	#addrBtn{ border: none; background-color: lightgray; color: black; cursor:pointer; padding:8px;}
	#mailBtn{ border: none; background-color: lightgray; color: black; padding:8px;}
	#addrBtn:active{background-color: #808080;}
	#address, #detailAddress, #refAddress{border:0; border-bottom:1px solid #555; background:transparent; width:70%; padding:8px 0 5px 0; font-size:16px; color:#555;}
	#address:focus, #detailAddress:focus, #refAddress:focus{border:none; outline:none; border-bottom:1px solid #e74c3c;}
	
	.homePhone{margin-right: 93px;}
	
	#homePhone1{border:0; border-bottom:1px solid #555; background:transparent; font-size:16px; color:#555;}
	#homePhone2, #homePhone3{border:0; border-bottom:1px solid #555; background:transparent; width:50px; text-align: center; font-size:16px; color:#555;}
	#homePhone1:focus, #homePhone2:focus, #homePhone3:focus{border:none; outline:none; border-bottom:1px solid #e74c3c;}

	.phone{margin-right: 100px;}
	
	#phone1{border:0; border-bottom:1px solid #555; background:transparent; font-size:16px; color:#555;}
	#phone2, #phone3{border:0; border-bottom:1px solid #555; background:transparent; width:50px; text-align: center; font-size:16px; color:#555;}
	#phone1:focus, #phone2:focus, #phone3:focus{border:none; outline:none; border-bottom:1px solid #e74c3c;}
	
	table{background:transparent;
	  width:70%;
	  padding:8px 0 5px 0;
	  font-size:16px;
	  color:#555;}
	  
	#btn:active{color: #808080;}
	#btn {font-size: 14px; border: none; padding: 10px; width: 260px; background-color: black; margin-bottom: 30px; color: white; cursor:pointer;}
</style>
</head>
<body>
<script>
	// 로그인 되어있으면 홈으로보냄
	if(${loginUser != null}){
		  location.href='${ contextPath }';
	}
</script>
	<div class="box">
		<form action="${ contextPath }/enroll.me" method="post" id="form">
			<input type="hidden" name="eventAgree" value="${ eventAgree }">
			<a href="${ contextPath }"><img alt="로고" src="${ contextPath }/resources/image/logo1.png"></a><br><br><br>
		
			<div class="input-container">
				<input type="text" name="memberId" id="id" required="required"/>
				<label for="id">회원 ID&nbsp;<b>*</b></label>	<br>
				<span id="idCheck" style="float: left; margin-left: 15%; font-size: 12px; color: #555;">아이디 영문숫자 조합 4-15자</span>
			</div>
			
<script>
	const id = document.getElementById('id');
	const cId = document.getElementById('idCheck');
	const korean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	const reg = /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gim;
	
	// 아이디 중복, 글자수 체크
	id.addEventListener('change', function(){
		if(this.value.trim()==""){
			cId.innerText = "아이디 영문숫자 조합 4-15자";
			cId.style.color = '#555';
		} else if(this.value.trim().length < 4 || this.value.trim().length > 10){
			cId.innerText = "아이디는 영문숫자 조합 4-15자 제한입니다.";
			cId.style.color = 'red';
		} else if(korean.test(id.value.trim()) || reg.test(id.value.trim())){
			cId.innerText = "아이디는 영문, 숫자만 입력 가능합니다.";
			cId.style.color = 'red';
		} else{
			$.ajax({
				url: '${contextPath}/checkId.me',
				data: {id:this.value.trim()},
				success: data =>{
					if(data == 'yes'){
						cId.style.color = 'green';
						cId.innerText = "아주 멋진 아이디네요!";
					} else if(data == 'no'){
						cId.style.color = 'red';
						cId.innerText = "중복된 아이디입니다.";
					}
				}
			})
		}
	});
	
	// 아이디 한글, 특문 입력시 섭밋막기
	
	form.addEventListener('submit', function(e){
		if(korean.test(id.value.trim()) || reg.test(id.value.trim())){
			e.preventDefault();
			alert('아이디는 영문, 숫자만 입력 가능합니다.');
			id.focus();
			id.select();
		}
	});
</script>
			
			<div class="input-container">
				<input type="password" name="memberPwd" id="pwd" required="required"/>
				<label for="pwd">비밀번호&nbsp;<b>*</b></label>
				<span style="float:left; margin-left: 15%; font-size: 12px"></span>	
			</div>
			
			<div class="input-container">
				<input type="password" name="pwd2" id="pwd2" required="required" onblur="checkPwd()"/>
				<label for="pwd2">비밀번호 확인&nbsp;<b>*</b></label>
				<span id="pwdCheck" style="float: left; margin-left: 15%; font-size: 12px"></span>
			</div><br/>
			
<script>
	const pwd = document.getElementById('pwd');
	const pwd2 = document.getElementById('pwd2');
	const cPwd = document.getElementById('pwdCheck');
	
	// pwd2 유효성 알려만주기
	const checkPwd = ()=>{
		if(pwd2.value.trim().length==0 || pwd2.value.trim()==""){
			cPwd.innerText = "";
		} else if(pwd.value != pwd2.value){
			cPwd.innerText = "비밀번호가 일치하지 않습니다.";
			cPwd.style.color = 'red';
		} else if(pwd.value == pwd2.value){
			cPwd.innerText = "비밀번호가 일치합니다.";
			cPwd.style.color = 'green';
		}
	}
	
	// pwd submit막기
	form.addEventListener('submit', function(e){
		if(pwd.value != pwd2.value){
			alert('비밀번호 확인이 일치하지 않습니다.');
			e.preventDefault();
			pwd.focus();
			pwd.select();
		}
	});
</script>
			
			<span style="color:#555; margin-right: 50%;">기본 배송지<span style="color:#e74c3c;">&nbsp;*</span></span><br/>
			<input type="text" name="postCode" id="postCode" placeholder="우편번호" readonly="readonly" onclick="kakaoPostCode()" required="required">
			<input type="button" id="addrBtn" value="우편번호 찾기" onclick="kakaoPostCode()"><br/>
			<input type="text" name="address" id="address" placeholder="기본 주소" readonly="readonly" onclick="kakaoPostCode()" required="required"><br/>
			<input type="text" name="detailAddress" id="detailAddress" placeholder="상세 주소" /><br/>
			<input type="text" name="refAddress" id="refAddress" placeholder="참고 주소" readonly="readonly" onclick="kakaoPostCode()"/>
			
			<div id="wrap" style="display:none;border:1px solid;height:300px;margin:5px 0;position:relative">
			<img src="https://t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldKakaoPostcode()" alt="접기 버튼">
			</div>
			
			<br/><br/><br/>
			
			<!-- 카카오 주소 api -->
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
			 // 우편번호 찾기 찾기 화면을 넣을 element
		    var element_wrap = document.getElementById('wrap');

		    function foldKakaoPostcode() {
		        // iframe을 넣은 element를 안보이게 한다.
		        element_wrap.style.display = 'none';
		    }

		    function kakaoPostCode() {
		        // 현재 scroll 위치를 저장해놓는다.
		        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수

		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }

		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    document.getElementById("refAddress").value = extraAddr;
		                
		                } else {
		                    document.getElementById("refAddress").value = '';
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('postCode').value = data.zonecode;
		                document.getElementById("address").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("detailAddress").focus();

		                // iframe을 넣은 element를 안보이게 한다.
		                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
		                element_wrap.style.display = 'none';

		                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
		                document.body.scrollTop = currentScroll;
		            },
		            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
		            onresize : function(size) {
		                element_wrap.style.height = size.height+'px';
		            },
		            width : '100%',
		            height : '100%'
		        }).embed(element_wrap);

		        // iframe을 넣은 element를 보이게 한다.
		        element_wrap.style.display = 'block';
		    }
			
			</script>
			
			<div class="input-container">
				<input type="text" name="memberName" id="name" required="required"/>
				<label for="name">이름&nbsp;<b>*</b></label>		
			</div>
			
			<div class="input-container">
				<input type="text" name="memberNickName" id="nickName" required="required"/>
				<label for="nickName">닉네임&nbsp;<b>*</b></label><br>
				<span id="nickNameCheck" style="float: left; margin-left: 15%; font-size: 12px"></span>	
			</div>
			
<script>
const nickName = document.getElementById('nickName');
const cNickName = document.getElementById('nickNameCheck');

cNickName.style.color = '#555';
cNickName.innerText = "닉네임 2-10자";

//닉네임 중복, 글자제한
nickName.addEventListener('change', function(e){
	if(this.value.trim() == ""){
		cNickName.style.color = '#555';
		cNickName.innerText = "닉네임 2-10자";
	} else if(this.value.trim().length > 10 || this.value.trim().length < 2) {
		cNickName.style.color = 'red';
		cNickName.innerText = "닉네임 길이가 유효하지 않습니다. (2-10자)";
	} else {
		$.ajax({
			url: '${contextPath}/checkNickName.me',
			data: {nickname:this.value.trim()},
			success: data =>{
				if(data == 'yes'){
					cNickName.style.color = 'green';
					cNickName.innerText = "아주 멋진 닉네임이네요!";
				} else if(data == 'no'){
					cNickName.style.color = 'red';
					cNickName.innerText = "중복된 닉네임입니다.";
				}
			}
		})
	}
});
</script>
			
			<br>
			
			<span style="color:#555; margin-right: 55%;">일반전화</span><br/>
			<div class="homePhone">
			<select name="homePhone1" id="homePhone1">
				<option value="02">02</option>
				<option value="031">031</option>
				<option value="032">032</option>
				<option value="033">033</option>
				<option value="041">041</option>
				<option value="042">042</option>
				<option value="043">043</option>
				<option value="044">044</option>
				<option value="051">051</option>
				<option value="052">052</option>
				<option value="053">053</option>
				<option value="054">054</option>
				<option value="055">055</option>
				<option value="061">061</option>
				<option value="062">062</option>
				<option value="063">063</option>
				<option value="064">064</option>
				<option value="0502">0502</option>
				<option value="0503">0503</option>
				<option value="0504">0504</option>
				<option value="0505">0505</option>
				<option value="0506">0506</option>
				<option value="0507">0507</option>
				<option value="070">070</option>
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
				<option value="0508">0508</option>
			</select>
			-
			<input type="tel" name="homePhone2" id="homePhone2" maxlength="4" >
			-
			<input type="tel" name="homePhone3" id="homePhone3" maxlength="4">
			</div><br>
			
			<span style="color:#555; margin-right: 52%;">휴대전화<span style="color:#e74c3c;">&nbsp;*</span></span><br/>
			<div class="phone">
			<select name="phone1" id="phone1">
				<option>010</option>
				<option>011</option>
				<option>016</option>
				<option>017</option>
				<option>018</option>
				<option>019</option>
			</select>
			-
			<input type="tel" name="phone2" id="phone2" maxlength="4" required="required">
			-
			<input type="tel" name="phone3" id="phone3" maxlength="4" required="required">
			</div><br><br>
			
			<div class="input-container">		
				<input type="email" required="required" id="email" name="memberEmail" style="width: 210px"/>
				<label for="email">이메일&nbsp;<b>*</b></label>
				<button type="button" id="mailBtn" disabled>본인인증</button><br>
				<input id="mailNum" placeholder="인증번호를 입력해주세요!" disabled="disabled"><br>
				<span id="mailCheck" style="float: left; margin-left: 15%; font-size: 12px"></span><br>
			</div>
			
<script>
	const emailTag = document.getElementById('email');
	const emailBtn = document.getElementById('mailBtn');
	const emailCheck = document.getElementById('mailCheck');
	
	$('#mailBtn').click(function() {
		const eamil = $('#email').val();
		const checkInput = $('#mailNum');

		$.ajax({
			type : 'get',
			url : '<c:url value ="mailCheck.me?email="/>'+eamil,
			success : function (data) {
				checkInput.attr('disabled',false);
				code = data;
				alert('인증번호가 전송되었습니다.')
			}			
		});
	}); 
			
	// 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	$('#mailNum').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#mailCheck');
		
		if(inputCode === code){
			$.ajax({
				url: '${contextPath}/checkEmail.me',
				data: {email:emailTag.value.trim()},
				success: data =>{
					if(data == 'yes'){
						$resultMsg.html('인증번호가 일치합니다.');
						$resultMsg.css('color','green');
						$('#mailBtn').attr('disabled',true);
						$('#email').attr('readonly',true);
						$('#mailNum').attr('readonly',true);
						emailTag.style.color = 'gray';
						document.getElementById('mailNum').style.color = 'gray';
					} else if(data == 'no'){
						$resultMsg.html('중복된 이메일입니다.');
						$resultMsg.css('color','red');
					}
				}
			})
		} else if (inputCode !== code){
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요.');
			$resultMsg.css('color','red');
		}
	});
	
	
	
	// 인증버튼 비활성화
	
	emailBtn.disabled = true;
	
	emailTag.addEventListener('input', function(){
		if(emailTag.value.trim() == "" || emailTag.value.trim() == null){
			emailBtn.disabled = true;
			emailBtn.style.cursor = '';
		} else {
			emailBtn.disabled = false;
			emailBtn.style.cursor = 'pointer';
		} 
	})
</script>
			
			<div class="gender-container">
			<span style="color:#555; float: right;">성별<span style="color:#e74c3c;">&nbsp;*</span>
			<input type="radio" name="memberGender" id="male" value="M" checked /><label for="male">남자</label>&nbsp;
			<input type="radio" name="memberGender" id="female" value="F"/><label for="female">여자</label></span>
			</div>
			
			<br/><br/><br/>
			
			<div class="input-container">
				<input type="date" name="memberAge" id="age" autocomplete="off" required="required" style="color:white;"/>
				<label for="age">생년월일(ex-2023-05-05)&nbsp;<b>*</b></label>	
			</div>
		
<script>
	//	age에 있는 플레이스홀더같은거 안보이는척하기
	const age = document.getElementById('age');
	
	age.style.color = 'white';
		
	age.addEventListener('input', function(){
		if(this.value.trim() == "" || this.value.trim()	== null){
			this.style.color = 'white';
		} else{
			this.style.color = '#555';
		}
	});
</script>
		
			<button id="btn">회원가입</button>
		</form>	
	</div>

<script>
	const submit = document.getElementById('btn');
	
	const form = document.getElementById('form');
		
	// 아이디, 닉네임 섭밋막기
	form.addEventListener('submit', function(e){
		if(cNickName.innerText == "중복된 닉네임입니다."){
			alert('중복된 닉네임은 사용할 수 없습니다.');
			e.preventDefault();
			nickName.focus();
			nickName.select();
		} else if(cId.innerText == "중복된 아이디입니다."){
			alert('중복된 아이디는 사용할 수 없습니다.');
			e.preventDefault();
			id.focus();
			id.select();
		} else if(id.value.trim().length < 4 || id.value.trim().length > 15){
			alert('아이디 길이가 유효하지 않습니다. (4-15자)');
			e.preventDefault();
			id.focus();
			id.select();
		} else if(nickName.value.trim().length > 10 || nickName.value.trim().length < 2){
			alert('닉네임 길이가 유효하지 않습니다. (2-10자)');
			e.preventDefault();
			id.focus();
			id.select();
		}
		
		if(emailCheck.innerText != '인증번호가 일치합니다.' 
				&& document.getElementById('mailCheck').style.color != 'green' && emailCheck.style.color == 'red'){
			alert('이메일 인증이 필요합니다.');
			e.preventDefault();
		}
	});
</script>
</body>
</html>