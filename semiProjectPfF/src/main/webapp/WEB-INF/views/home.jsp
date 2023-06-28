<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Home</title>
<script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<style type="text/css">
/* 화면분할 */

main {
	background: white;
	min-height: 700px;
	margin-top: 20px;
}

/* 이미지css */
img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
/* 슬라이드 순서 텍스트css */
.text {
	color: black;
	font-size: 20px;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
}
/* 정렬점 css */
.dot {
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}
/* 슬라이드이벤트 관련 css */
.active {
	background-color: #717171;
}

.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}

@
-webkit-keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
@
keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	.text {
		font-size: 11px
	}
}
</style>
</head>
<body>
	<jsp:include page="common/navbar.jsp"/>
	
	<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"/>
	
	<main>
		<!-- 최상단 메인 사진 슬라이드 -->
		<div class="temp-box box-one">
			<img
				src="${ contextPath }/resources/image/pff_background.jpg"
				alt="" />
		</div>

		<div class="temp-box box-one">
			<img
				src="${ contextPath }/resources/image/pff_background2.jpg"
				alt="" />
		</div>

		<div class="temp-box box-one">
			<img
				src="${ contextPath }/resources/image/pff_background3.jpg"
				alt="" />
		</div>

		<div class="temp-box box-one">
			<img
				src="${ contextPath }/resources/image/pff_background4.jpg"
				alt="" />
		</div>

		<div class="temp-box box-one">
			<img
				src="${ contextPath }/resources/image/pff_background5.jpg"
				alt="" />
		</div>
		<!-- 메인사진정렬점 -->
		<div class="maindot" style="text-align: center">
			<span class="dot"></span> <span class="dot"></span> <span class="dot"></span>
			<span class="dot"></span> <span class="dot"></span>
		</div>
	</main>

	<script>
		// 메인페이지 메인슬라이드 자바스크립트
		var slideIndex = 0;
		showSlides();
	
		function showSlides() {
			var i;
			var slides = document.getElementsByClassName("temp-box box-one");
			var dots = document.getElementsByClassName("dot");
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			slideIndex++;
			slideIndex = slideIndex % slides.length;
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex].style.display = "block";
			dots[slideIndex].className += " active";
			setTimeout(showSlides, 5000); // Change image every 2 seconds
		}
	</script>
	
<%@ include file="common/footer.jsp" %>
</body>
</html>
