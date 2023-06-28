<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<style>
	* {
		font-family:'Noto Sans KR', sans-serif;
	}
	.header {
		margin-top: 200px;
		text-align: center;
		font-size: 30px;
    	font-weight: bold;
	}

	.mainDiv {
		display: flex;
		justify-content: center;
		align-items: flex-end;
		margin-top: 40px;
	}

	.formDiv {
		display: flex;
	    flex-direction: column;
	    align-items: center;
	}
	
	.inputArea {
		margin-bottom: 15px;
	}
	
	input {
		padding: 5px;
	    width: 300px;
    	margin-top: 5px;
	}
	
	.marginLeft {
		margin-left: 40px;
	}
	
	.marginRight {
		margin-right: 40px;
	}
	
	#register_Btn {
		width: 150px;
		margin-top: 20px;
	}
	
	#cancel_Btn {
		width: 150px;
		margin-top: 20px;
		border: 1px solid black;
	}
	
</style>
</head>
<body>
<div class="header">상품 등록</div>
<div class="mainDiv">
	<div class="formDiv">
	<form method="Post" action="${contextPath}/insertProduct.pr">
		<div class="inputArea marginRight">
		 <label for="gdsName">상품번호</label><br/>
		 <input type="number" id="productName" name="productNo" />
		</div>
		<div class="inputArea marginRight">
		 <label for="gdsName">상품명</label><br/>
		 <input type="text" id="productName" name="productName" />
		</div>
		
		<div class="inputArea marginRight">
		 <label for="gdsPrice">상품가격</label><br/>
		 <input type="number" id="productPrice" name="productPrice" />
		</div>
		
		<div class="inputArea marginRight">
		 <label for="gdsPrice">할인율</label><br/>
		 <input type="number" id="discountRate" name="discountRate" />
		</div>
		
		<div class="inputArea marginRight">
		 <label for="gdsStock">상품타입1</label><br/>
		 <input type="text" id="productType" name="productType" />
		</div> 
		<div class="inputArea marginRight">
		 <label for="gdsStock">상품타입2</label><br/>
		 <input type="text" id="productType2" name="productType2" />
		</div>
	</div>
		
	<div class="formDiv">
		<div class="inputArea marginLeft">
		 <label for="gdsDes">상품소개</label><br/>
		 <input type="text" id="productInfo" name="productInfo">
		</div>
		
		<div class="inputArea marginLeft">
		 <label for="gdsDes">상품메인 사진</label><br/>
		 <input type="text" id="productMainPic" name="productMainPic">
		</div>
		
		<div class="inputArea marginLeft">
		 <label for="gdsDes">상품사진1</label><br/>
		 <input type="text" id="productDetailPic1" name="productDetailPic1">
		</div>
		
		<div class="inputArea marginLeft">
		 <label for="gdsDes">상품사진2</label><br/>
		 <input type="text" id="productDetailPic2" name="productDetailPic2">
		</div>
		<div class="inputArea marginLeft">
		 <label for="gdsDes">상품사진3</label><br/>
		 <input type="text" id="productDetailPic3" name="productDetailPic3">
		</div>
		
		<div class="inputArea marginLeft">
		 <button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
		 <button type="button" id="cancel_Btn" class="btn btn-cancel" onclick="javascript:history.back()">취소</button>
		</div>
	</form>
	</div>
</div>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>