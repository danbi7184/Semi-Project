<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Passion For Fashion</title>
	<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<style>
		* {
			font-family: 'Noto Sans KR', sans-serif;
			margin: 0;
			padding: 0;
		}
		
		.top {
		    padding: 8px 15px;
		    background-color: #517bdb;
		    color: white;
		    font-size: 15px;
		    font-weight: 500;
		}	
		
		.payInfo, .couponInfo {
		    width: calc(100% - 30px);
		    margin: 10px 15px;
		    border-top: 1px solid darkgray;
		    border-bottom: 1px solid darkgray;
		}
		
		.payInfo tr:first-child, .couponInfo tr:first-child {
			border-bottom: 1px solid lightgray;
		}
		
		.payInfo td, .couponInfo td {
			font-size: 13px;
			vertical-align: middle;
		}
		
		.payInfo td:first-child {
			text-align: center;
			padding: 12px;
		    font-weight: 500;
	        background-color: #e8e8e8;
		}
		
		.payInfo td:last-child {
			text-align: right;
    		padding-right: 20px;
		}
		
		.couponInfo {
			margin-top: 20px;
		}
		
		.couponInfo tr:first-child td {
			text-align: center;
			padding: 12px;
		    font-weight: 500;
	        background-color: #e8e8e8;
            vertical-align: middle;
		}
		
		#useBtn {
			border: 1px solid #517bdb;
		    color: white;
		    background-color: #517bdb;
		    border-radius: 5%;
		    padding: 5px;
		    font-size: 14px;
		}
		
		#cancelBtn {
			border: 1px solid gray;
		    background-color: white;
		    border-radius: 5%;
		    padding: 5px 10px;
		    font-size: 14px;
		}
		
		#usedCouponPrice {
			text-align: right;
    		padding-right: 5px;
    		width: 70px;
		}
	</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }"></c:set>
	<div class="top">Passion For Fashion 쿠폰 사용</div>
	<table class="table payInfo">
		<tbody>
			<tr>
			  <td width="40%">결제할 금액</td>
			  <td style="color: #517bdb; font-weight: 500;" id="price">17,500원</td>
			</tr>
			<tr>
			  <td width="40%">상품권 결제금액</td>
			  <td><input type="text" id="usedCouponPrice" readonly>원</td>
			</tr>
		</tbody>
	</table>
	
	<table class="table couponInfo">
		<tbody>
			<c:if test="${ empty list }">
				<tr>
					<td>보유하신 쿠폰이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${ !empty list }">
				<tr>
					<td colspan="2">상품권</td>
					<td>결제금액</td>
				</tr>
				
				<c:forEach items="${ list }" var="cp">
					<tr>
						<td width="10%" style="text-align: center;"><input type="radio" name="coupon"/></td>
						<td width="50%" style="text-align: center;">
							<input type="hidden" value="${ cp.couponNo }" id="couponNo"/>
							<div>${ cp.couponName }</div>
							<div>(<fmt:formatDate value="${ cp.couponCreateDate }" pattern="yy.MM.dd"/> ~ <fmt:formatDate value="${ cp.couponExpireDate }" pattern="yy.MM.dd"/>)</div>
						</td>
						<td width="40%" style="text-align: center;">
							<span><fmt:formatNumber value="${ cp.couponPrice }" pattern="#,###,###"/></span>&nbsp;원
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	
	<div style="text-align: center; margin-top: 50px;">
		<c:if test="${ !empty list }">
			<button id="useBtn">상품권 사용하기</button>
		</c:if>
		<button id="cancelBtn">취소</button>
	</div>
	
	<script>
		window.onload = () => {
			const radioBtns = document.querySelector(".couponInfo").querySelectorAll("input");
			const priceInput = document.querySelector("#usedCouponPrice");
			for(const radioBtn of radioBtns) {
				radioBtn.addEventListener('click', function() {
					priceInput.value = this.parentElement.parentElement.querySelector("span").innerText;
				});
			}
			
			let couponNo;
			let couponPrice;
			if(${ !empty list }) {
				document.querySelector("#useBtn").addEventListener("click", function() {
					for(const radioBtn of radioBtns) {
						if(radioBtn.checked) {
							couponNo = radioBtn.parentElement.parentElement.querySelector("#couponNo").value;
							couponPrice = radioBtn.parentElement.parentElement.querySelector("span").innerText.replace(',', '');
							console.log(couponNo);
							console.log(couponPrice);
							break;
						}
					}
					
					let data = {
						isCanceled: false,
						couponNo: couponNo,
						couponPrice: couponPrice	
					}
					let jsonData = JSON.stringify(data);
					window.opener.postMessage(jsonData, window.opener.origin);
					window.close();
				});
			}
			
			document.querySelector("#cancelBtn").addEventListener("click", function() {
				let data = {
					isCanceled: true,
					couponNo: null,
					couponPrice: 0
				}
				let jsonData = JSON.stringify(data);
				window.opener.postMessage(jsonData, window.opener.origin);
				window.close();
			});
		}
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>