<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PnF 마이페이지</title>
<style>
/* 전체화면 영역 분할 css */
.aStyle {
	text-decoration: none;
	color: black;
}


header {
	height: 200px;
	color: black;
}

main {
	background: white;
	min-height: 700px;
}

footer {
	background: white;
	height: 200px;
	color: black;
}

h2 {
	background-color: black;
	color: white;
}

.main-container {
	border: 1px black;
	font-family: 'MaplestoryOTFLight';
	font-size: 1.2em;
}

.top-container {
	font-family: 'TAEBAEKmilkyway';
}

.titleArea {
	font-family: 'NanumSquareNeo-Variable';
}

@font-face {
	font-family: 'MaplestoryOTFLight';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/MaplestoryOTFLight.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'TAEBAEKmilkyway';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/TAEBAEKmilkyway.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'NanumSquareNeo-Variable';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}
</style>


<title>PnF 마이페이지</title>
</head>

<body>
	<jsp:include page="../common/navbar.jsp"/>
	<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"></c:set>
	<main>
		<div style="width: 550px; height: 200px">
			<div class="titleArea">
				<h2>
					<span>${ loginUser.memberNickName } 님의 MY PAGE</span>
				</h2>
				<hr>
			</div>


			<div class="top-container">
				<ul>
					<li class=" "><strong class="title">회원 등급</strong> <strong
						class="data grade"> ${loginUser.grade}</strong></li>
					<hr>
					<li class=" "><strong class="title">가용적립금</strong> <strong
						class="data use"> ${loginUser.point}원</strong></li>
					<hr>
			</div>
			<hr>
		</div>

		<div class="main-container">
			<div class="modify">
				<div style="">
					<svg xmlns="http://www.w3.org/2000/svg" width="100px"
						height="100px" fill="currentColor" class="bi bi-person-gear"
						viewBox="0 0 16 16">
  			<path
							d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0ZM8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4Zm.256 7a4.474 4.474 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10c.26 0 .507.009.74.025.226-.341.496-.65.804-.918C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4s1 1 1 1h5.256Zm3.63-4.54c.18-.613 1.048-.613 1.229 0l.043.148a.64.64 0 0 0 .921.382l.136-.074c.561-.306 1.175.308.87.869l-.075.136a.64.64 0 0 0 .382.92l.149.045c.612.18.612 1.048 0 1.229l-.15.043a.64.64 0 0 0-.38.921l.074.136c.305.561-.309 1.175-.87.87l-.136-.075a.64.64 0 0 0-.92.382l-.045.149c-.18.612-1.048.612-1.229 0l-.043-.15a.64.64 0 0 0-.921-.38l-.136.074c-.561.305-1.175-.309-.87-.87l.075-.136a.64.64 0 0 0-.382-.92l-.148-.045c-.613-.18-.613-1.048 0-1.229l.148-.043a.64.64 0 0 0 .382-.921l-.074-.136c-.306-.561.308-1.175.869-.87l.136.075a.64.64 0 0 0 .92-.382l.045-.148ZM14 12.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0Z" />
			</svg>
				</div>
				<h3>
					<a href="${contextPath}/editMyInfo.me" class="aStyle"><strong>profile</strong> 회원 정보</a>
				</h3>
				<span>회원이신 고객님의 개인정보를 관리하는 공간입니다.<br />개인정보를 최신 정보로 유지하시면 보다
					간편히 쇼핑을 즐기실 수 있습니다.
				</span>
				<hr>
			</div>
			<div class="cart">
				<div style="">
					<svg xmlns="http://www.w3.org/2000/svg" width="100px"
						height="100px" fill="currentColor" class="bi bi-cart"
						viewBox="0 0 16 16">
  			<path
							d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
			</svg>
				</div>
				<h3>
					<a href="${contextPath}/showCart.ca" class="aStyle"><strong>Cart</strong> 장바구니 </a>
				</h3>
				<span>고객님의 장바구니를 볼수 있습니다.</span>
				<hr>
			</div>

<!-- 			<div class="coupon"> -->
<!-- 				<div style=""> -->
<!-- 					<svg xmlns="http://www.w3.org/2000/svg" width="100px" -->
<!-- 						height="100px" fill="currentColor" class="bi bi-gift" -->
<!-- 						viewBox="0 0 16 16"> -->
<!--   			<path -->
<!-- 							d="M3 2.5a2.5 2.5 0 0 1 5 0 2.5 2.5 0 0 1 5 0v.006c0 .07 0 .27-.038.494H15a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1v7.5a1.5 1.5 0 0 1-1.5 1.5h-11A1.5 1.5 0 0 1 1 14.5V7a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h2.038A2.968 2.968 0 0 1 3 2.506V2.5zm1.068.5H7v-.5a1.5 1.5 0 1 0-3 0c0 .085.002.274.045.43a.522.522 0 0 0 .023.07zM9 3h2.932a.56.56 0 0 0 .023-.07c.043-.156.045-.345.045-.43a1.5 1.5 0 0 0-3 0V3zM1 4v2h6V4H1zm8 0v2h6V4H9zm5 3H9v8h4.5a.5.5 0 0 0 .5-.5V7zm-7 8V7H2v7.5a.5.5 0 0 0 .5.5H7z" /> -->
<!-- 			</svg> -->
<!-- 				</div> -->
<!-- 				<h3> -->
<%-- 					<a href="${contextPath}/memberList.me" class="aStyle"><strong>coupon</strong> --%>
<!-- 						쿠폰</a> -->
<!-- 				</h3> -->
<!-- 				<span>고객님이 보유하고 계신 쿠폰내역을 보여드립니다.</span> -->
<!-- 				<hr> -->
<!-- 			</div> -->
		</div>
	</main>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>