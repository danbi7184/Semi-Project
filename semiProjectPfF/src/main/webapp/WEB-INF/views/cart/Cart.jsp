<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 화면분할 */

main {
	background: white;
	min-height: 700px;
}

img{
  	width: 120px;
}

/* 전체적인 태그별 css */
body {
	margin: 0;
}

* {
	box-sizing: border-box;
}

p, span {
	margin: 0;
}

a {
	color: black;
}

.cart {
	width: 80%;
	margin: auto;
	padding: 30px;
}

.cart ul {
	background-color: black;
	padding: 30px;
	margin-bottom: 50px;
	border: whitesmoke solid 1px;
	border-radius: 5px;
	font-size: 13px;
	font-weight: 300;
}

.cart ul :first-child {
	color: white;
}

table {
	border-top: solid 1.5px black;
	border-collapse: collapse;
	width: 100%;
	font-size: 14px;
}

thead {
	text-align: center;
	font-weight: bold;
}

tbody {
	height: 200px;
	font-size: 12px;
}

td {
	border-bottom: 1px solid black;
	vertical-align: middle;
	text-align: center;
}

.cartList_detail :nth-child(3) a {
	font-size: 12px;
}

.cartList_detail :nth-child(3) p {
	margin-top: 6px;
	font-weight: bold;
}

.cartlist_smartstore {
	font-size: 12px;
	color: black;
}

.cartList_option {
	text-align: center;
	vertical-align: middle;
}

.cartList_name {
	text-align: center;
	vertical-align: middle;
}

.cartList_option p {
	margin-bottom: 25px;
	position: relative;
}

.cartList_option p::after {
	content: "";
	width: 90%;
	height: 1px;
	background-color: black;
	left: 0px;
	top: 25px;
	position: absolute;
}

.cartList_optionbtn {
	background-color: white;
	font-size: 10px;
	border: black solid 1px;
	padding: 7px;
}

.cartList_optionbtn:hover {
	background-color: gray;
}

.cartList_detail :nth-child(4), .cartList_detail :nth-child(5),
	.cartList_detail :nth-child(6) {
	border-left: 2px solid black;
}

.cartList_detail :nth-child(5), .cartList_detail :nth-child(6) {
	text-align: center;
}

/* 주문하기버튼 */
.cartList_detail :nth-child(5) button {
	background-color: black;
	color: white;
	border: none;
	border-radius: 5px;
	padding: 4px 8px;
	font-size: 12px;
	margin-top: 5px;
}

.cartList_detail :nth-child(5) button:hover {
	background-color: gray;
}

.price {
	font-weight: bold;
}

/* 하단 큰버튼 두개 영역 */
.mainbtns {
	text-align: center;	
	padding-top: 40px;
}

/* 하단 큰버튼 */
.bigorderbtn {
	width: 200px;
	height: 50px;
	font-size: 16px;
	margin: auto;
	border-radius: 5px;
}

.bigorderbtn.left {
	background-color: white;
	color: black;
	border: 1px black solid;
}

.bigorderbtn.left:hover {
	background-color: gray;
}

.bigorderbtn.right {
	background-color: black;
	color: white;
	border: 1px lightgray solid;
}

.bigorderbtn.right:hover {
	background-color: gray;
}

.cartinfo {
	color: white;
}
</style>
</head>
<body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }"></c:set>
	<jsp:include page="../common/navbar.jsp"></jsp:include>

	<main>
		<!-- 장바구니상단 안내 -->
		<section class="cart">
			<div class="cartinfo">
				<ul>
					<li>장바구니 상품은 최대 30일간 저장됩니다.</li>
					<li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
					<li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해
						주시기 바랍니다.</li>
				</ul>
			</div>
			<div class="delBtn">
				<button type="button" class="selectDelete_btn">선택삭제</button>
			</div>
			<%-- 			<c:choose> --%>
			<%-- 				<c:when test="${ c.count == 0 }"> --%>
			<!-- 							장바구니가 비어있습니다. -->
			<%-- 				</c:when> --%>
			<%-- 				<c:otherwise> --%>
				<table>
					<thead>
						<tr>
							<td><input type="checkbox" id="allCheck" class="allCheck" name="allCheck"/><label for="allCheck"></label></td>
							<td colspan="2">상품명</td>
							<td>상품설명 / 사이즈</td>
							<td>상품가격 / 할인적용된 가격</td>
							<td>수량</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ Cartlist }" var="c" varStatus="i">
							<!-- 중앙 상품 판매 테이블 -->
							<tr class="cartList_detail" style="border-top: 1px solid black">
								<input type="hidden" name="productNo" value="${ c.productNo }"/>
								<td><input type="checkbox" class="chBox"
									name="chBox" data-cartNo="${c.cartNo}"></td>
								<td><img
									src="${contextPath}/resources/product_img/${c.productMainPic}.jpg"
									alt="thumnail"></td>
								<td class="cartList_name">${ c.productName }</td>
								<td class="cartList_option">${ c.productInfo } / ${ c.optionSize }</td>
								<c:set var="totalPrice"
									value="${ c.productPrice -(c.productPrice * c.discountRate*0.01)}" />
								<td><span class="price"><fmt:formatNumber value="${ c.productPrice }" pattern="#,###,###"/></span> / <span class="price"><fmt:formatNumber value="${totalPrice}" pattern="###,###" /></span><br>
								<td class="count">${ c.cartCount }</td>
							</tr>
							
							
						</c:forEach>

					</tbody>
					<tfoot>
					</tfoot>
				</table>


			<%-- 				</c:otherwise> --%>
			<%-- 			</c:choose> --%>
			<!-- 맨 아래 큰 메인버튼 두개 -->
			<div class="mainbtns">
				<button type="button" id="buyBtn" class="bigorderbtn right">주문하기</button>
			</div>
		</section>
	</main>


	<script>
	$(document).ready(function() {
		$("#allCheck").click(function(){
			var chk = $("#allCheck").prop("checked");
			if(chk) {
				$(".chBox").prop("checked", true);
			} else {
				$(".chBox").prop("checked", false);
			}
		});
		
		$(".chBox").click(function(){
			$("#allCheck").prop("checked", false);
		});
		
		$(".selectDelete_btn").click(function(){
			var confirm_val = confirm("정말 삭제 하시겠습니까?");
			
			if(confirm_val) {
				var checkArr = new Array();
				
				$("input[class='chBox']:checked").each(function() {
					checkArr.push($(this).attr("data-cartNo"));
				});
				
				$.ajax({
					url: "${contextPath}/deleteCart.ca",
					type: "post",
					data: { chbox: checkArr },
					success: function() {
						location.href = "${contextPath}/showCart.ca";
					}
				});
			}
		});
		
		$("#buyBtn").click(function(){
			let cNoArr = [];
			let pNoArr = [];
			let sizeArr = [];
			let countArr = [];
			
			$("input[class='chBox']:checked").each(function() {
				cNoArr.push($(this).attr("data-cartNo"));
				pNoArr.push($(this).parent().parent().find('input').val());
				sizeArr.push($(this).parent().parent().find('.cartList_option').text().split('/')[1].trim());
				countArr.push($(this).parent().parent().find('.count').text());
			});
			
			const form = document.createElement("form");
			form.setAttribute("method", "post");
			form.setAttribute("action", "${ contextPath }/cartToPay.pr");
			
			const cNo = document.createElement("input");
			cNo.setAttribute("type", "hidden");
			cNo.setAttribute("name", "cNoArr");
			cNo.setAttribute("value", cNoArr);
			form.appendChild(cNo);
			
			const pNo = document.createElement("input");
			pNo.setAttribute("type", "hidden");
			pNo.setAttribute("name", "pNoArr");
			pNo.setAttribute("value", pNoArr);
			form.appendChild(pNo);
			
			const size = document.createElement("input");
			size.setAttribute("type", "hidden");
			size.setAttribute("name", "sizeArr");
			size.setAttribute("value", sizeArr);
			form.appendChild(size);
			
			const count = document.createElement("input");
			count.setAttribute("type", "hidden");
			count.setAttribute("name", "countArr");
			count.setAttribute("value", countArr);
			form.appendChild(count);
			
			document.body.appendChild(form);
			form.submit();
		});
	});
	</script>
	<jsp:include page="../common/footer.jsp"></jsp:include>	
</body>
</html>