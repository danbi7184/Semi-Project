<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>passion for Fashion</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	#section {
		height: 65vh;
	    margin-top: 70px;
		display: flex;
	    align-items: center;
	    flex-direction: column;
	    background: #f0f0f0;
	    width: 500px;
	    padding: 30px;
	}

	#formDiv {
	    display: flex;
	    justify-content: center;
	}
	
	#inputDiv {
		display: flex;
    	flex-direction: column;
	}
	
	.info {
		width: 223px;
	    text-align: center;
	    margin-bottom: 30px;
	}
	
	#saveBtn {
		width: 223px;
	    border: none;
	    background: black;
	    color: white;
	    border-radius: 5px;
	    height: 40px;
	    margin-top: 50px;
	    border: 1px solid black;
	}
	
	#saveBtn:hover, .zipCode:hover {
		cursor: pointer;
	}
	
	.zipCode {
		width: 223px;
		background: white;
	    border: 1px solid black;
	    border-radius: 5px;
	    height: 40px;
	}
	
	input {
		font-size: 13px;
	}
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }"></c:set>
	<jsp:include page="../common/navbar.jsp"></jsp:include>
	<section style="display: flex; justify-content: center;">
		<section id="section">
			<div>
				<div class="info">추가 정보를 입력해주세요.</div>
				<div id="inputDiv">
					<label>이름</label><input type="text" id="memberName"/><br/>
					<label>이메일</label><input type="email" id="memberEmail"/><br/>
					<label>전화번호</label><input type="tel" id="memberPhone"/><br/>
					<label>주소</label>
					<input type="number" class="inputZipCode" readonly style="margin-bottom: 5px;"/>
					<button type="button" class="zipCode">우편번호 찾기</button><br/>
					<input type="text" id="address" class="inputAddress" readonly style="margin-bottom: 5px;"/>
					<input type="text" class="inputAddress" placeholder="나머지 주소"/>
				</div>
				<button id="saveBtn">저장하기</button>
			</div>
		</section>
	</section>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<script>
		window.onload = () => {
			let memberAddress = '';
			const zipCodeAPI = () => {
				new daum.Postcode({
		            oncomplete: function(data) {
		                let addr = ''; // 주소 변수
		                let extraAddr = ''; // 참고항목 변수
		                
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		
		                if(data.userSelectedType === 'R'){
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                } 
		                
		                document.querySelector(".inputZipCode").value = data.zonecode;
		                const inputAddresses = document.querySelectorAll(".inputAddress");
		                if(extraAddr === '') {
		                	inputAddresses[0].value = addr;
		                } else {
		                	inputAddresses[0].value = addr + extraAddr;
		                }
		                memberAddress = inputAddresses[0].value + inputAddresses[1].value.trim();
		            }
		        }).open();
			}
			
			document.querySelector('.zipCode').addEventListener('click', zipCodeAPI);
			
			const nameInput = document.querySelector("#memberName");
			const emailInput = document.querySelector("#memberEmail");
			const phoneInput = document.querySelector("#memberPhone");
			const addressInput = document.querySelector("#address");
			
			document.querySelector("#saveBtn").addEventListener('click', ()=> {
				if(nameInput.value.trim() == '') {
					alert("이름을 입력해주세요.");
					nameInput.focus();
				} else if(emailInput.value.trim() == ''){
					alert("이메일을 입력해주세요.");
					emailInput.focus();
				} else if(phoneInput.value.trim() == ''){
					alert("전화번호를 입력해주세요.");
					phoneInput.focus();
				} else if(addressInput.value.trim() == ''){
					alert("우편번호 찾기를 통해 주소를 입력해주세요.")
				} else {
					$.ajax({
						url: '${contextPath}/kakaoInfoInsert.me',
						type: 'POST',
						data: {
							memberName: document.querySelector("#memberName").value,
							memberEmail: document.querySelector("#memberEmail").value,
							memberPhone: document.querySelector("#memberPhone").value,
							memberAddress: memberAddress,
						}, success: data => {
							if(data == 'yes') {
								history.go(-1);
							} else if(data == 'no') {
								alert("정보 수정에 실패했습니다. 다시 시도해주세요.");
							}
						}, error: data => {
							console.log(data);
						}
					});
				}
			});
		}
	</script>
</body>
</html>