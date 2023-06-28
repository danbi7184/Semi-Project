<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<style>

.reviewComment {
	display: inline-block;
	background: rgb(218, 218, 218);
	border-radius: 8px;
	padding: 3px;
	color: black;
	margin-left: 5px;
}

#Paging{
 margin: auto;
 width: 100%;
 height: 50px;
 margin-top: 80px;
 text-align: center;

 
}

#Paging div{
 width: 30px;
 margin: auto;
 text-align: center;
 display: inline-block;
}

.prev:hover{
 transform: translateX(-1ch);
 transition: 0.45s;
}

.next:hover{
 transform: translateX(1ch);
 transition: 0.45s;
}

#Paging div:active{
	font-weight: 400;
}

.star {
	color: orange;
	margin-bottom: 15px;
}
</style>

<body>
	
	<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"/>

		<h3 style="display: inline-block; font-size: 25px; font-weight: 200; margin-left: 120px;">review</h3>
		<hr style="color: #dfdfdf; width: 90%; margin: auto; margin-bottom: 50px;">
		<!-- 중앙선  -->
		
		
		
		<!-- 리뷰상자 -->
		<c:forEach items="${ list }" var="r">
		<form action="reviewBoard.pr">
	<div class="reviewWrap"style="margin-left: 110px; margin-right: 110px; margin-top: 5px; margin-bottom: 15px;">
		<div class="textbox" style="border: 1px solid lightgray; padding: 15px;"><div><!-- 선 -->
				<div class="nickName"style="font-size: 18px; margin-top: 10px; margin-bottom: 10px; display: inline-block; font-weight: 400;">No. ${r.orderNo}</div>
				<div class="star">${r.reviewStar} </div>
				<span style="float: right; font-size: 20px; font-weight: 200;">${r.reviewDate}</span>
			</div>
			<img src="${contextPath}/resources/product_img/review.jpg" alt=""
				style="width: 170px; height: 190px; display: inline-block; float: left; margin-bottom: 15px" />

			<div style="display: inline-block; width: 100%; margin-bottom: 30px;">
				<span class="reviewComment" style="font-weight: 400;">사이즈 ${r.review_size} </span>  <!-- 사이즈, 색상, 두께는 기본으로 들어가고 그옆에 설정값은 value로 넣을 예정 -->
				<span class="reviewComment" style="font-weight: 400;">색상 밝아요 ${r.review_color}</span> 
				<span class="reviewComment" style="font-weight: 400;">두께 얇아요 ${r.review_thick}</span>
				<p style="margin-left: 5px; margin-top: 10px; font-weight: 200;">${ r.reviewContent}</p>
			</div>
		</div>
	</div>
	
	</form>
	</c:forEach>
	



</body>
</html>