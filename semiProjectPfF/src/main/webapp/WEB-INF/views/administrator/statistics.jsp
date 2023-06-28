<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<style>
	* {
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 14px;
	}
		
	.boardBox{
 		width: calc(100% - 200px);
		padding: 30px 50px;
    	background: #ffffff;
    	min-height: 950px;
    	float: left;
	}
	.subH3{
		font-size: 1.3em;
    	font-weight: 600;
    	margin-bottom: 30px;
    	padding-bottom: 10px;
    	position: relative;
    	border-bottom: 1px solid lightgray;
	}
	.subH3 span{
		display: inline-block;
    	font-size: 1.1rem;
    	margin-left: 10px;
    	color: #808080;
    	font-weight: 400;
	}
	
	.chartBox{
		border: 1px solid lightgray;
		width: 700px;
		margin: 0 auto;
	}
	
</style>
</head>
<body>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }"></c:set>
<script>
	const loginUser = '${loginUser}';
	if(loginUser == ''){
		  location.href='${ contextPath }';
	} else if('${loginUser.admin}' === 'N'){
		  location.href='${ contextPath }';
	}
</script>
<section id="orderInquiry" class="d-flex flex-nowrap" style="min-height: 100vh;">
		<div class="d-flex flex-column flex-shrink-0 p-3 text-bg-dark" style="width: 280px;">
			<a href="${ contextPath }" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
				<svg class="bi pe-none me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
				<span class="fs-4">메인으로</span>
			</a>
			<hr>
			<ul class="nav nav-pills flex-column mb-auto">
				<li class="nav-item">
					<a href="${contextPath}/mng_member.ad" class="nav-link text-white fs-5" aria-current="page">
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
					<a href="${contextPath}/statistics.ad" class="nav-link active text-white fs-5">
						<svg class="bi pe-none me-2" width="16" height="32"><use xlink:href="#table"></use></svg>
						통계
					</a>
				</li>
			</ul>
		</div>
		<div class="boardBox">
			<h3 class="subH3">통계관리 <span>매출분석</span></h3>
			<div class="chartBox">
			<%@ include file="numOfPay.jsp" %>
			</div>
			<br>
			<div class="chartBox">
			<%@ include file="amountOfPay.jsp" %>
			</div>
		</div>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>