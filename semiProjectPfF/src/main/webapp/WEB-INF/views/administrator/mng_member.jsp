<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<title>Insert title here</title>
<style>
/* 화면분할css */
* {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 14px;
}

main {
	background: white;
    background: white;
    margin-top: 50px;
    margin-left: 100px;
    margin-right: 100px;
    width: 100%;
}

table {
	border-collapse: collapse;
	width: 100%;
	font-family: 'TheJamsil5Bold';
	margin-bottom: 50px;
}

th, td {
	text-align: center;
	padding: 8px;
	border: 1px solid black;
}

th {
	background-color: lightgray;
	color: black;
}
button {
	background-color: black;
	color: white;
	border: none;
	border-radius: 4px;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin-bottom: 10px;
}

button:hover {
	background-color: gray;
}

.popup {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.popup-content {
	background-color: lightgray;
	margin: 10% auto;
	padding: 20px;
	border: 1px solid black;
	color: black;
	width: 80%;
}

.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

@font-face {
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'TheJamsil5Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
</style>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<script>
	const loginUser = '${loginUser}';
	if(loginUser == ''){
		  location.href='${ contextPath }';
	} else if('${loginUser.admin}' === 'N'){
		  location.href='${ contextPath }';
	}
</script>
<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"></c:set>
<section id="orderInquiry" class="d-flex flex-nowrap" style="min-height: 100vh;">
		<div class="d-flex flex-column flex-shrink-0 p-3 text-bg-dark" style="width: 280px;">
			<a href="${ contextPath }" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
				<svg class="bi pe-none me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
				<span class="fs-4">메인으로</span>
			</a>
			<hr>
			<ul class="nav nav-pills flex-column mb-auto">
				<li class="nav-item">
					<a href="${contextPath}/mng_member.ad" class="nav-link active text-white fs-5"" aria-current="page">
						<svg class="bi pe-none me-2" width="16" height="32"><use xlink:href="#home"></use></svg>
						회원 관리
					</a>
				</li>
				<li>
					<a href="${contextPath}/checkPayment.ad" class="nav-link text-white fs-5">
						<svg class="bi pe-none me-2" width="16" height="32"><use xlink:href="#speedometer2"></use></svg>
						주문 조회
					</a>
				</li>
				<li>
					<a href="${contextPath}/statistics.ad" class="nav-link text-white fs-5">
						<svg class="bi pe-none me-2" width="16" height="32"><use xlink:href="#table"></use></svg>
						통계
					</a>
				</li>
			</ul>
		</div>
	<main>
		<h3 style="margin-bottom: 30px">회원 관리</h3>
		<table>
			<thead>
				<tr>
					<td>번호</td>
					<td>구분</td>
					<td>아이디</td>
					<td>이름</td>
					<td>주소</td>
					<td>이메일</td>
					<td>가입일자</td>
					<td>전화번호</td>
					<td>등급</td>
					<td>상태</td>
					<td>회원 정보 수정</td>
					<td>회원 상태 변경</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${memberList}" var="mb">
					<tr>
						<td><c:out value="${mb.memberNo}"></c:out></td>
						<td>
							<c:if test="${ !empty mb.memberId }">
								<c:out value="일반"></c:out>
							</c:if>
							<c:if test="${ empty mb.memberId }">
								<c:out value="카카오"></c:out>
							</c:if>
						</td>
						<td>
							<c:if test="${ !empty mb.memberId }">
								<c:out value="${mb.memberId}"></c:out>
							</c:if>
							<c:if test="${ empty mb.memberId }">
								<c:out value="-"></c:out>
							</c:if>
						</td>
						<td>
							<c:if test="${ !empty mb.memberName }">
								<c:out value="${mb.memberName}"></c:out>
							</c:if>
							<c:if test="${ empty mb.memberName }">
								<c:out value="-"></c:out>
							</c:if>
						</td>
						<td>
							<c:if test="${ !empty mb.memberAddress }">
								<c:out value="${mb.memberAddress}"></c:out>
							</c:if>
							<c:if test="${ empty mb.memberAddress }">
								<c:out value="-"></c:out>
							</c:if>
						</td>
						<td>
							<c:if test="${ !empty mb.memberEmail }">
								<c:out value="${mb.memberEmail}"></c:out>
							</c:if>
							<c:if test="${ empty mb.memberEmail }">
								<c:out value="-"></c:out>
							</c:if>
						</td>
						<td><c:out value="${mb.enrollDate}"></c:out></td>
						<td>
							<c:if test="${ !empty mb.memberPhone }">
								<c:out value="${mb.memberPhone}"></c:out>
							</c:if>
							<c:if test="${ empty mb.memberPhone }">
								<c:out value="-"></c:out>
							</c:if>
						</td>
						<td><c:out value="${mb.grade}"></c:out></td>
						<td><c:out value="${mb.memberStatus}"></c:out></td>
						<td><button onclick="openPopup('${mb.memberNo}','${mb.memberId}', '${mb.memberAddress}', '${mb.memberEmail}', '${mb.memberPhone}', '${mb.grade}')">수정</button></td>
						<td><form id="deleteForm" action="${contextPath}/deleteMember.ad" method="POST">
    						<input type="hidden" name="memberId" value="${mb.memberId}">
    						<input type="hidden" name="memberStatus" value="${mb.memberStatus}">
    						<button type="button" onclick="confirmDelete('${mb.memberId}', '${mb.memberStatus}')">변경</button>
  							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 회원정보 수정 팝업창 -->
		<div id="popup" class="popup">
			<div class="popup-content">
				<span class="close"
					onclick="closePopup()">&times;</span>
				<h2>회원 정보 수정</h2>
				<form action="${contextPath}/updateMember.ad" method="POST">
					
					<br> <label for="no">회원번호:</label> <input type="no"
						id="no" name="memberNo" value="" readonly><br>
					<br> <label for="id">아이디:</label> <input type="id"
						id="id" name="memberId" value="" readonly><br>
						<br> <label for="address">주소:</label> <input type="address"
						id="address" name="memberAddress" value=""><br> <br>
					<br> <label for="email">이메일:</label> <input type="email"
						id="email" name="memberEmail" value=""><br> <br>
					<label for="phone">휴대폰번호:</label> <input type="phone" id="phone"
						name="memberPhone" value=""><br> <br> <label
						for="grade">회원등급:</label> <input type="grade" id="grade"
						name="grade" value="" readonly><br> <br>
					<button type="submit">저장</button>
					<button type="button" onclick="closePopup()">취소</button>
				</form>
			</div>
		</div>
	</main>
</section>
	<script>
	
			// 	팝업창 JS
		    function openPopup(memberNo, memberId, memberAddress, memberEmail, memberPhone, grade) {
		        document.getElementById("popup").style.display = "block";
		        document.getElementById("no").value = memberNo;
		        document.getElementById("id").value = memberId;
		        document.getElementById("address").value = memberAddress;
		        document.getElementById("email").value = memberEmail;
				document.getElementById("phone").value = memberPhone;
				document.getElementById("grade").value = grade;
		    }
		    function closePopup() {
		        document.getElementById("popup").style.display = "none";
		    }
		    
		    // 회원정보 삭제 확인
		    function confirmDelete(memberId, memberStatus) {
	          var deleteForm = document.getElementById("deleteForm");
	          deleteForm.elements["memberId"].value = memberId;
	          deleteForm.elements["memberStatus"].value = memberStatus;
	          deleteForm.submit();
		      }

    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>