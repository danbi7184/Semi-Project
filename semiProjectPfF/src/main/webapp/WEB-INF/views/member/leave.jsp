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

	* {font-family:'Noto Sans KR', sans-serif;}
	
	.leavePage {
    width: calc(100% - 210px);
    padding: 0px;
    float: right;
	}
	
	.mLeave {
    font-style: normal;
    font-weight: 500;
    font-size: 24px;
    line-height: 36px;
    color: rgb(0, 0, 0);
    margin-top: 48px;
	}

	.leaveUnderBar {
    width: 100%;
    height: 3px;
    background: rgb(0, 0, 0);
    margin-top: 17px;
	}
	  
	.pwDiv {
    display: flex;
    margin-top: 25px;
    margin-bottom: 35px;
	}	  
	
	.pwText {
    font-size: 13px;
    line-height: 21px;
    height: 32px;
    width: 130px;
    margin-right: 30px;
    display: flex;
    align-items: center;
    color: rgb(0, 0, 0);
	}
	
	.pwErrorMsg {
    font-style: normal;
    font-weight: 400;
    margin-top: 4px;
    font-size: 12px;
    line-height: 18px;
    color: rgb(255, 0, 0);
	}
	
	.pwInputDiv {
    display: flex;
    box-sizing: border-box;
    height: 32px;
    border: 1px solid rgb(229, 229, 229);
    justify-content: space-between;
    align-items: center;
    transition: border 0.2s ease-in-out 0s;
	}
	
	.pwInput {
    box-sizing: border-box;
    width: 100%;
    height: 100%;
    padding: 6px 10px;
    border: none;
    background-color: rgb(255, 255, 255);
    font-weight: 400;
    font-size: 15px;
    color: rgb(0, 0, 0);
    line-height: 22.5px;
    vertical-align: middle;
	}
	 
	.leaveCautionAll {
    box-sizing: border-box;
    padding-bottom: 10px;
    border-bottom: 1px solid rgb(229, 229, 229);
	}
	
	.leaveCautionMain {
    font-style: normal;
    font-weight: 700;
    font-size: 14px;
    line-height: 21px;
    color: rgb(0, 0, 0);
	}
	
	.leaveCautionEx  {
    font-style: normal;
    font-weight: 400;
    font-size: 14px;
    line-height: 21px;
    color: rgb(145, 145, 145);
    margin-top: 8px;
    margin-bottom: 20px;
	}
	
	.leaveCautionCheck {
    margin-top: 16px;
    box-sizing: border-box;
    display: flex;
    align-items: center;
    cursor: pointer;
    border: none;
    background: white;
	}
	
	.leaveCautionCheck > p {
    font-style: normal;
    font-weight: 400;
    font-size: 12px;
    line-height: 14px;
    color: rgb(0, 0, 0);
    margin-left: 4px;
	}

	.leaveStop {
    height: 60px;
    width: 240px;
    font-style: normal;
    font-weight: 500;
    font-size: 20px;
    line-height: 30px;
    background: rgb(0, 0, 0);
    color: rgb(255, 255, 255);
    border: none;
	}
	
	.leaveNext {
    height: 60px;
    width: 240px;
    font-style: normal;
    font-weight: 500;
    font-size: 20px;
    line-height: 30px;
    background: rgb(255, 255, 255);
    color: rgb(0, 0, 0);
    border: 1px solid rgb(241, 241, 241);
	}
	
	.PageAll {
    position: fixed;
    inset: 0px;
    background-color: rgba(0, 0, 0, 0);
    z-index: 1000;
    display: flex;
    align-items: center;
    justify-content: center;
	}

	.popupPage {
    box-sizing: border-box;
    background: rgb(255, 255, 255);
    min-width: 354px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
	}

	.popupMain {
    background: rgb(255, 255, 255);
    border: 1px solid rgb(222, 222, 222);
    padding: 20px 20px 30px;
	}
	
	.popupText {
    font-style: normal;
    font-weight: 500;
    font-size: 24px;
    line-height: 36px;
	}
	
	.popupCloseBtn {
	padding: 0;
    border: 0;
    background: none;
	}
	
	.popupCheckBtn {
    background: rgb(0, 0, 0);
    color: rgb(255, 255, 255);
    height: 50px;
    padding: 0px 16px;
    font-style: normal;
    font-weight: 500;
    font-size: 16px;
    line-height: 24px;
    width: 100%;
	}
	
	
	
</style>


<body>
<form action="${contextPath}/deleteLeaveMember.me" method="post">
	 <input type="hidden" name="memberId" value="${loginUser.memberId}">
	<div class="leavePage">
		<h2 class="mLeave">회원 탈퇴</h2>
		<div class="leaveUnderBar"></div>		
		<div class="pwDiv">
			<p class="pwText">비밀번호</p>
			<div style="width: 240px;">
			 <div class="pwInputDiv">
			 	 <input type="password" id="password" name="memberPwd" title="비밀번호 입력" placeholder="비밀번호 확인" class="pwInput">
			 </div>
			 
			 <div style="height: 0px; position: relative; width: 0px; display: none;" id="pwError">
			 	<div style="position: absolute; width: 240px;">
			 		<p class="pwErrorMsg">4자리 이상 입력해 주세요.</p>
			 	</div>
			 </div>
			 
			 <div style="height: 0px; position: relative; width: 0px; display: none;" id="pwEmpty">
			 	<div style="position: absolute; width: 240px;">
			 		<p class="pwErrorMsg">비밀번호를 입력해 주세요.</p>
			 	</div>
			 </div>

			</div>
		</div>
		
		<div class="leaveCautionAll">
			<strong class="leaveCautionMain">회원 탈퇴 후 재가입</strong>
			<p class="leaveCautionEx">
			 - 동일한
			 <strong style="text-decoration: underline;">본인 명의 휴대폰으로 15일 이후에 재가입 가능</strong>합니다.
			</p>
			<strong class="leaveCautionMain">탈퇴 후 재가입 시 가입 혜택 제한</strong>
			<p class="leaveCautionEx">
			 - 탈퇴 후
			 <strong style="text-decoration: underline;">재가입 시 신규 가입 혜택에 제한</strong>이 있을 수 있습니다.
			</p>
			<strong class="leaveCautionMain">아이디 재사용 및 복구 불가</strong>
			<p class="leaveCautionEx">
			 - 회원 탈퇴 후 3일 뒤에 사용하고 계신
			 <strong style="text-decoration: underline;">아이디는 복구 및 재사용이 불가</strong>하며, 모든
			 <strong style="text-decoration: underline;">회원 정보가 삭제</strong>됩니다.
			</p>
			<strong class="leaveCautionMain">회원정보/서비스 이용기록 삭제</strong>
			<p class="leaveCautionEx">
			 - 회원등급, 적립금, 포인트, 등의
			 <strong style="text-decoration: underline;">데이터가 영구히 삭제되며 복구가 불가</strong>합니다.
			</p>
			<strong class="leaveCautionMain">등록 게시물 유지</strong>
			<p class="leaveCautionEx">
			 - 각종 게시판의 게시글, 댓글, 후기 등의 데이터는 삭제되지 않습니다. 
			 <strong style="text-decoration: underline;">삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 직접 삭제</strong>하시기 바랍니다. 이미 적립금 지급이 완료된 후기는 삭제가 불가합니다.
			</p>
			<strong class="leaveCautionMain">탈퇴 처리과정</strong>
			<p class="leaveCautionEx">
			 <strong style="text-decoration: underline;">- 회원 탈퇴 후 5일 이내 재로그인 시 탈퇴 취소가 가능</strong>합니다.
			</p>
		</div>
		
		<button type="button" class=leaveCautionCheck id="radio">

			<svg id="radioNotCheck" xmlns="http://www.w3.org/2000/svg" width="20" height="21" fill="none" viewBox="0 0 20 21">
			 <circle cx="10" cy="10.5" r="9.5" fill="#F3F3F3" stroke="#D1D1D1"></circle>
			</svg>
			
			<svg id="radioCheck" width="20" height="21" viewBox="0 0 20 21" fill="none" xmlns="http://www.w3.org/2000/svg" style="display: none;">
			 <circle cx="10" cy="10.5" r="10" fill="#0078FF"></circle>
			 <path fill-rule="evenodd" clip-rule="evenodd" d="M6.46443 10.2071L5.75732 10.9142L7.87864 13.0355L8.58575 13.7426L9.29286 13.0355L14.2426 8.08576L13.5355 7.37865L8.58575 12.3284L6.46443 10.2071Z" fill="white"></path>
			</svg>
			
			<p>유의사항을 모두 확인하였으며, 이에 동의합니다.</p>
		</button>
		
		<div style="margin: 50px auto; width: 600px;">
			<button type="button" class="leaveStop" style="margin-right: 10px;" id="leaveStop"}>탈퇴 그만두기</button>
			<button type="button" class="leaveNext" id="leaveNext" disabled>탈퇴</button>
		</div>
	</div>
	
	<div id="popupDelete" style="display: none;">
		<div>
		<section class="PageAll">
		
			<div class="popupPage" id="popupLeave" style="display: none;" >
				<div class="popupMain">
					<div style="align-items: flex-start; display: flex; justify-content: space-between;">
						<strong class="popupText">정말 탈퇴 신청을 진행하시겠어요?</strong>
							<button type="button" class="popupCloseBtn" id="popupCloseBtn">
								<svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
								<path d="M3.97245 3.97229L18.0278 18.0277M18.0278 3.97217L3.97241 18.0276" stroke="black"></path>
								</svg>
							</button>
					</div>
					<p>탈퇴 후 계정 정보가 영구히 삭제되며 복구 불가합니다. 탈퇴 신청을 진행하시겠어요?</p>
				</div>
				<button color="#ffffff" class="popupCheckBtn" id="popupLeaveCheckBtn">확인</button>
			</div>
			
			<div class="popupPage" id="popupCaution" style="display: none;">
				<div class="popupMain">
					<div style="align-items: flex-start; display: flex; justify-content: space-between;">
						<strong class="popupText">유의사항을 확인해주세요.</strong>
							<button type="button" class="popupCloseBtn" id="popupCloseBtn">
								<svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
								<path d="M3.97245 3.97229L18.0278 18.0277M18.0278 3.97217L3.97241 18.0276" stroke="black"></path>
								</svg>
							</button>
					</div>
					<p>유의사항을 동의하셔야 탈퇴가 가능합니다.</p>
				</div>
				<button type="button" color="#ffffff" class="popupCheckBtn" id="popupCautionCheckBtn">확인</button>
			</div>
			
		</section>
		</div>
	</div>
</form>
</body>

<script>
	
	var password = document.getElementById('password'); // 비밀번호 입력 창
	var leaveStop = document.getElementById('leaveStop'); // 탈퇴 그만두기 버튼
	var leaveNext = document.getElementById('leaveNext'); // 탈퇴 버튼
	var popupDelete = document.getElementById('popupDelete'); // 탈퇴 최종 확인 div
	var pwError = document.getElementById('pwError'); // 비밀번호 4자리 이상 입력 안했을 때 출력
	var pwEmpty = document.getElementById('pwEmpty'); // 비밀번호 입력 안했을 때 출력
	var pwWrong = document.getElementById('pwWrong'); // 비밀번호 다를 때 출력
	var popupCloseBtn = document.getElementById('popupCloseBtn'); // 최종 탈퇴 팝업 취소 버튼
	var radio = document.getElementById('radio'); // 유의사항 체크 버튼
	var radioNotCheck = document.getElementById('radioNotCheck'); // 유의사항 체크 안했을 때
	var radioCheck = document.getElementById('radioCheck'); // 유의사항 체크 했을 때
	var popupLeaveCheckBtn = document.getElementById('popupLeaveCheckBtn'); // 최종 탈퇴 팝업 확인 버튼
	var popupCautionCheckBtn = document.getElementById('popupCautionCheckBtn'); // 유의사항 체크 안했을 때 팝업 확인 버튼
	var popupLeave = document.getElementById('popupLeave'); // 최종 탈퇴 팝업 div
	var popupCaution = document.getElementById('popupCaution'); // 유의사항 체크 안했을 때의 div
	var isChecked = false; // 초기 상태: 체크 안 함
	
	
	
	password.addEventListener('keyup', function(){  // 비밀번호 입력 관련 오류
		var passwordValue = password.value; // 비밀번호 입력 값
		if(passwordValue === ''){
			pwEmpty.style.display = 'block';
			pwError.style.display = 'none';
			leaveNext.disabled = true;
		} else if(passwordValue.length < 4){
			pwEmpty.style.display = 'none';
			pwError.style.display = 'block';
			leaveNext.disabled = true;
		} else {
			pwEmpty.style.display = 'none';
			pwError.style.display = 'none';
			leaveNext.disabled = false;
			leaveNext.cursor = 'pointer';
		}
	})
	
	leaveStop.addEventListener('click', function(){ // 탈퇴 그만두기 버튼 누르면 마이페이지로 이동
		location.href="${contextPath}/myInfo.me"
	});
	
	leaveNext.addEventListener('click', function(){ // 탈퇴 버튼 누르면 팝업 등장
		var passwordValue = password.value;
		if(isChecked) {
			popupDelete.style.display = 'block';
			popupLeave.style.display = 'block';
			popupCaution.style.display = 'none';
		} else {
			popupDelete.style.display = 'block';
			popupCaution.style.display = 'block';
			popupLeave.style.display = 'none';
		}
	});
	
	popupCaution.addEventListener('click', function(){
		popupDelete.style.display = 'none';
	})
	
	popupCloseBtn.addEventListener('click', function(){ // 탈퇴 창에서 X버튼 누르면 팝업 삭제
		popupDelete.style.display = 'none';
	});
	
	radio.addEventListener('click', function(){ // 체크버튼 관련
		
		isChecked = !isChecked; // 토글 상태 변경
		
		if (isChecked) {
			radioNotCheck.style.display = 'none';
			radioCheck.style.display = 'block';
		} else {
			radioNotCheck.style.display = 'block';
			radioCheck.style.display = 'none';
		}
	});
	
</script>

</html>