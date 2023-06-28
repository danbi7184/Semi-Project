

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<style>
	.menuCategoryBox{
		width:100%
	}
	.menuCategory{
		font-family:'Noto Sans KR', sans-serif;
		font-weight: lighter;
		font-size: 13px;
		margin:0 auto;
		display:flex;
		width:350px;
	}
	
	.menuCategory li{
		text-align:center;
		width:200px;
		list-style:none;
	}
	
	.menuCategory li a{
		text-decoration:none;
	    color: black;
	}
	
	.menuCategory li a:hover{
		text-decoration:none;
	    color: #000;
	    transition: all 0.2s ease-out;
	    font-weight: bold;
	}
	
	.product-list{
	    width: 1000px;
	    margin-left: auto;
	    margin-right: auto;
	}
	.products h3{
	    font-size: 24px;
	    color: #555;
	    margin-top:60px;
	    margin-bottom: 60px;
	    text-align: center;
	}
	
	.product{
	    display: block;
	    width: 225px;
	    text-align: center;
	    text-decoration:none;
	    color: black;
	    float:left;
	    margin-left: 10px;
	    margin-right: 10px;
/* 	    margin-top: 30px; */
	}
	
/* 	img{border: 1px solid gray;} */
	
	.product-name{
	    margin-top: 5px;
	    color:black;
	}
	
	.product-price{
		color:gray;
	}
	
	.product-name, .product-price{
		font-family:'Noto Sans KR', sans-serif;
		font-weight: lighter;
		font-size: 13px;
	}
	
	.product-price {
		margin-bottom: 30px;
	}
	
	.clearfix{
	    clear: both;
	}
	
.pagination-container {
  margin: 70px auto;
  text-align: center;
  display: flex;
  justify-content: center;
}
.pagination {
  position: relative;
}
.pagination a {
  position: relative;
  display: inline-block;
  color: #000;
  text-decoration: none;
  font-size: 13px;
  padding: 8px 16px 15px;
}
.pagination a:before {
  z-index: -1;
  position: absolute;
  height: 50%;
  width: 50%;
  content: "";
  top: 8px;
  left:10px;
  background-color: #000;
  border-radius: 25px;
  transform: scale(0);
  transition: all 0.2s;
}
.pagination a:hover,
.pagination a .pagination-active {
  color: #fff;
}
.pagination a:hover:before,
.pagination a .pagination-active:before {
  transform: scale(1);
}
.pagination .pagination-active {
  color: #fff;
}
.pagination .pagination-active:before {
  transform: scale(1);
}
.pagination-newer {
  margin-right: 0px;
}
.pagination-older {
  margin-left: 0px;
}
</style>
</head>
<body>
	<jsp:include page="../common/navbar.jsp"/>
	<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" />
	<div class="menuCategoryBox">
	<ul class="menuCategory">
		<li>ㅡ</li>
		<li><a href="${contextPath}/productList.pr?productType=${ productType }&productType2=전체">전체</a></li>
		<c:forEach items="${ productType2List }" var="p2">
			<li><a href="${contextPath}/productList.pr?productType=${ productType }&productType2=${p2}">${ p2 }</a></li>
		</c:forEach>
		<li>ㅡ</li>
	</ul>
	</div>

    <div class="products">
    <form action="${contextpath}/updateForm.pr" method="post" >
		<br><br><br>		
        <div class="product-list" style="display: flex; flex-wrap: wrap">
		<c:forEach items="${ list }" var="p">
			<div style="display: flex; flex-direction: column; align-items: center;">
            <a href="${contextPath}/productDetail/detail/${p.productNo}.pr" class="product">
                <img src="${contextPath}/resources/product_img/${p.productMainPic}" width="225" height="225px">
                <div class="product-name">
                    ${p.productName} 
                </div>
                <div class="product-price">
                   <c:set var="totalPrice"  value="${ p.productPrice -(p.productPrice * p.discountRate*0.01)}" />
				<fmt:formatNumber value="${totalPrice}" type="currency"/>
                </div>
             </a>
             <c:if test="${ loginUser.admin == 'Y'}">
             <button type="button" id="deletebtn" class="deleteProduct" onclick="deleteConfirm(${p.productNo})" style="margin-bottom: 30px">삭제하기</button>
             </c:if>
            </div>
	</c:forEach>
	 <script>
		function deleteConfirm(productNo){
			console.log(productNo);
			let check = confirm("삭제 하시겠습니까?");
			if(check){
				location.href="${contextPath}/delete.pr?productNo=" + productNo;
			}
		}
	</script>
	 </form>  
            <div class="clearfix"></div>
        </div>
    </div>
	
	<nav class="pagination-container">
		<div class="pagination">
			<c:url value="productList.pr?productType=${ productType }" var="goBackAll">
				<c:param name="page" value="${ pi.startPage }" />
			</c:url>
			<c:url value="productList.pr?productType=${ productType }" var="goBack">
				<c:param name="page" value="${ pi.currentPage - 1 }" />
			</c:url>
			<c:url value="productList.pr?productType=${ productType }" var="goNextAll">
				<c:param name="page" value="${ pi.endPage }" />
			</c:url>
			<c:url value="productList.pr?productType=${ productType }" var="goNext">
				<c:param name="page" value="${ pi.currentPage + 1 }" />
			</c:url>
			<a class="pagination-newer" href="${ goBackAll }" onclick="goBack(event)">&laquo;</a>
			<a class="pagination-newer" href="${ goBack }" onclick="goBack(event)">&lt;</a>
			<span class="pagination-inner">
			<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
				<c:if test="${ pi.currentPage == p }">
					<a href="${contextPath}/productList.pr?productType=${ productType }&productType2=${ productType2 }&page=${p}" class="pagination-active" onclick="current(event)">${ p }</a>
				</c:if>
				<c:if test="${ pi.currentPage != p }">
					<a href="${contextPath}/productList.pr?productType=${ productType }&productType2=${ productType2 }&page=${p}">${ p }</a>
				</c:if>
			</c:forEach>
			</span>
			<a class="pagination-older" href="${ goNext }" onclick="goNext(event)">&gt;</a>
			<a class="pagination-older" href="${ goNextAll }" onclick="goNext(event)">&raquo;</a>
		</div>
	</nav>
	<div class="clearfix"></div>
	<div style="text-align: center;">
    	<c:if test="${ loginUser.admin == 'Y'}">
    		<button type="button" onclick="location.href='${contextPath}/AdminproductInsert.pr'">등록하기</button>
		</c:if>
	</div>
	
	<script>
// 		페이지이동 비활성화
		function current(e){
			e.preventDefault();
		}
		if(${pi.currentPage}<=1){
			function goBack(e){
				e.preventDefault();
			}
		}
		if(${pi.currentPage} >= ${pi.endPage}){
			function goNext(e){
				e.preventDefault();
			}
		}
	</script>
<%@ include file="../common/footer.jsp" %>
	
</body>
</html>