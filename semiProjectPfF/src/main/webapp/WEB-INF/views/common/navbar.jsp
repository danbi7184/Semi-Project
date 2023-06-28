<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>NavBar</title>
	<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<style>
	
		* {font-family:'Noto Sans KR', sans-serif; box-sizing: border-box;}
 		.bg{background-color: white;} 
 		.navbar{height: 50px;}
 		.image{height: 250px;}
		.mar{background-color: white; width: 100%; position: relative; z-index: 2; height: 3.75rem; overflow-y: hidden;}
		.a{font-weight: bold;}
		.logo{height: 55px; width: 200px;}
		.text-center{background-color: white;}
 	</style>
 
</head>
<body>
	<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"/>
<header>
	<div class="navbar bg">
	   <div class="container">
	     
	     
	    <c:if test="${ empty loginUser }">
		 <nav class="d-flex justify-content-center mt-md-0 ms-md-auto me-2">
	       <a class="me-3 py-2 text-black text-decoration-none" href="${contextPath}/loginView.me">LOGIN</a>
	     </nav>
		</c:if>
		
	    <c:if test="${ !empty loginUser }">
		 <nav class="d-flex justify-content-center mt-md-0 ms-md-auto me-2">
		 	<c:if test="${loginUser.admin == 'Y'}">
	       <a class="me-3 py-2 text-black text-decoration-none" href="${contextPath}/mng_member.ad">관리자페이지</a>
	       </c:if>
	       <a class="me-3 py-2 text-black text-decoration-none" href="${contextPath}/logout.me">LOGOUT</a>
	       <a class="me-3 py-2 text-black text-decoration-none" href="${contextPath}/myInfo.me">MY PAGE</a>
	       <a class="me-3 py-2 text-black text-decoration-none" href="${contextPath}/showCart.ca">CART</a>
	     </nav>
	    </c:if>
	    
	   </div>
	</div>
	
	<div class="text-center">
		<a href="${contextPath}">
			<img src="${ contextPath }/resources/image/logo1.png" class="logo" alt="logo">
		</a>
	</div>
	
	<div class="py-1 mb-2 mar">
	    <nav class="nav d-flex justify-content-center">
	      <a class="p-4 link-secondary text-black text-decoration-none a" href="${ contextPath }/productList.pr?productType=상의">상의</a>
	      <a class="p-4 link-secondary text-black text-decoration-none a" href="${ contextPath }/productList.pr?productType=아우터">아우터</a>
	      <a class="p-4 link-secondary text-black text-decoration-none a" href="${ contextPath }/productList.pr?productType=하의">하의</a>
	      <a class="p-4 link-secondary text-black text-decoration-none a" href="${ contextPath }/productList.pr?productType=신발">신발</a>
	    </nav>
	</div>
</header>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>