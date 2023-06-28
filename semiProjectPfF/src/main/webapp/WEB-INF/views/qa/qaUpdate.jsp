<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 수정 창</title>
<script type="text/javascript" src="js/jquery-3.6.4.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!--  부트스트랩 아이콘 이용  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- 구글 폰트 -->
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">

<style>
body{font-family:'Noto Sans KR', sans-serif;}
.custom-container { max-width: 1250px;  margin-left: auto; margin-right: auto;}
.radio{ background-color: lightgrey; color:black; width:200px;}
.radio2{margin-left:1px}
.radio3{margin-left:1px}
#questionOptions{width: 59.8%; height: 35px; margin-left: 110px;}
#orderNumber{margin-left:110px; width:50.5%; height:35px;}
#orderNumberButton{background-color: lightgrey; color:black; width:20%;}
#writer{width: 59.8%; height: 35px; margin-left: 110px;}
#phone{width: 59.8%; height: 35px; margin-left: 110px;}
#email{width: 59.8%; height: 35px; margin-left: 110px;}
#subject{width: 59.8%; height: 35px; margin-left: 110px;}
#content{width: 59.8%; height: 230px; margin-left: 110px; resize: none; overflow: auto;}
#imagePreview {display: flex; flex-wrap: wrap; margin-left:105px}
#imagePreview img {width: 130px; height: 130px; margin:5px;}
#imageButton {display: flex; justify-content: center; align-items: center; width: 130px; height: 130px; border: 2px dashed #ccc; cursor: pointer; margin-left: 110px;}
#imageButton i {font-size: 20px; color:lightgrey;}
#cancel{border-width: 1px; font-weight: bold; background-color: white; color: grey; width:20%; height:40px;}
#write{border-width:1px; font-weight: bold; background-color: lightgrey; color:blacsk; width:20%; height:40px; margin-left: 3px}
#buttonSpan{margin-left: 58.5%;}
.image-container{display: flex; justify-content: space-between;}
.delete-button i{cursor: pointer;}
</style>
</head>
<body>
	<div class="container">
		<h2 style="text-align:center;">인클루드(헤더)</h2>
	</div>
	<br><br><br><br><br>
	<div class="container custom-container">
		<h3>문의작성</h3>
		<hr style="border-color: dimgrey; height:3px;">
		<fieldset>	
			<form action="{ contextPath }/updateQA.bo" method="get">
				<div class="row">	
					<div class="col-md-2">
						<label>문의유형</label>	
					</div>
					<div class="col-md-2">
						<input type="radio" class="btn-check" name="options" id="option1" value="memberInformation" autocomplete="off"  onclick="addOptions(['가입/인증', '로그인/정보', '탈퇴/기타'])">
						<label class="btn btn-secondary radio radio2" for="option1" >회원정보</label>
					</div>
					<div class = "col-md-2">
						<input type="radio" class="btn-check" name="options" id="option2" value="productCheck" autocomplete="off" onclick="addOptions(['상품 문의', '불량/하자', 'AS'])">
						<label class="btn btn-secondary radio radio2" for="option2">상품확인</label>
					</div>
					<div class="col-md-6">
						<input type="radio" class="btn-check" name="options" id="option3" value="orderbuying" autocomplete="off" onclick="addOptions(['주문 변경', '결제수단', '기타'])">
						<label class="btn btn-secondary radio radio2" for="option3">주문/결제</label>
					</div> 
				</div>	
				<div class="row" style="margin-top: 10px;">
					<div class="col-md-2"></div>
					<div class="col-md-2">
						<input type="radio" class="btn-check" name="options" id="option4" value="delivery" autocomplete="off" onclick="addOptions(['배송 일반', '기타'])">
						<label class="btn btn-secondary radio radio3" for="option4">배송</label>
					</div>
					<div class="col-md-2">
						<input type="radio" class="btn-check" name="options" id="option5" value="changeCancel" autocomplete="off" onclick="addOptions(['교환/반품', '취소/반품(환불)'])">
						<label class="btn btn-secondary radio radio3" for="option5">교환/취소(반품)</label>
					</div>						
					<div class="col-md-6">
						<input type="radio" class="btn-check" name="options" id="option6" value="service" autocomplete="off" onclick="addOptions(['혜택', '후기', '프로모션/이벤트', '웹 이용문의', '고객센터', '기타'])">
						<label class="btn btn-secondary radio radio3" for="option6">서비스</label>
					</div><br><br><br>
				</div>	
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<select id="questionOptions" required>
					 		<option value="">문의 유형을 선택해주세요.</option>
						</select>	
					</div>
				</div><br><hr>
				<div class="row">
					<div class="col-md-1" style="margin-top:13px;">
						<label for="orderNumber2">주문번호</label>	
					</div>
					<div class="col-md-10 input-group mb-3" id="orderNumber" style="margin-top:13px;">
      					<input type="text" class="form-control" id="orderNumber2" name="orderNumber" aria-label="Recipient's username" aria-describedby="button-addon2" readonly>
  						<button class="btn btn-outline-secondary" type="button" id="orderNumberButton" onclick="clickChoice()">조회</button>
					</div>
				</div><hr>
				
				<div class="row">
					<div class="col-md-1">
						<label for="subject">제목</label>
					</div>
					<div class="col-md-10">
						<input type="text" id="subject" name="subject" required>
					</div>
				</div><hr>
				<div class="row">
					<div class="col-md-1">
						<label for="content">문의내용</label>
					</div>
					<div class="col-md-10">
						<textarea id="content" name="content" required></textarea>
					</div>
				</div><hr>
				<div class="row">
					<div class="col-md-1">
						<label>사진</label>
					</div>
					<div class="col-md-10">
						<input type="file" id="fileInput" onchange="addImages()" multiple style="display: none;">
  						<label for="fileInput" id="file-label">
	   						<div id="imageButton">
	      						<i id="icon" class="bi bi-plus-lg"></i>
	   						</div>
  						</label>
  						<div id="imagePreview"></div>
					</div>
				</div><hr>
				<span id="buttonSpan">
					<button type="button" id="cancel" onclick="confirmCancel()">취소</button>
					<button type="submit" id="write">작성하기</button>
				</span>
			</form>
		</fieldset>
	</div>	
	<br><br><br><br><br><br><br><br><br><br>
	<div class="container">
		<h2 style="text-align:center;">인클루드(풋터)</h2>
	</div>	
	<script>
	// 문의 유형 선택
		const addOptions = (options) => {
			  const questionOptions = document.getElementById('questionOptions');
			  questionOptions.innerHTML = ''; // 기존 옵션 초기화
			  
			  for (let i = 0; i < options.length; i++) {
			    const newOption = document.createElement('option');
			    newOption.text = options[i];
			    questionOptions.add(newOption);
			  }
			}
		
		// 파일 첨부 (추가,삭제)
		let selectedFiles = [];  

		  const addImages = () => {
		    const fileInput = document.getElementById('fileInput');
		    const imagePreview = document.getElementById('imagePreview');

		    for (let i = 0; i < fileInput.files.length; i++) {
		      const file = fileInput.files[i];
		      selectedFiles.push(file); // 선택한 파일 배열에 추가

		      const imageContainer = document.createElement('div');
		      imageContainer.classList.add('image-container');

		      const image = document.createElement('img');
		      image.src = URL.createObjectURL(file);
		      imageContainer.appendChild(image);

		      const deleteButton = document.createElement('span');
		      deleteButton.classList.add('delete-button');
		      deleteButton.innerHTML = '<i class="bi bi-x-circle-fill"></i>';
		      deleteButton.querySelector('i').addEventListener('click', function() {
		        removeImage(imageContainer, file);
		      });
		      imageContainer.appendChild(deleteButton);

		      imagePreview.appendChild(imageContainer);

		      image.addEventListener('load', function() {
		        URL.revokeObjectURL(image.src);
		      });	  
		    }
		    fileInput.value = ''; // 파일 첨부 버튼 초기화
		  }

		  const removeImage = (imageContainer, file) => {
		    imageContainer.remove();
		    const index = selectedFiles.indexOf(file);
		    if (index > -1) {
		      selectedFiles.splice(index, 1);
		    }
		  }
		  
		  //문의작성취소 버튼 누르면 확인창
		  function confirmCancel() {
			  // 확인 창 표시
			  var result = confirm("취소하시겠습니까?");
			  
			  // 확인 버튼을 선택한 경우
			  if (result) {
				  history.back();
			  } 
			}
		  
		  function clickChoice() {
			  alert("주문번호는 수정이 불가합니다.\n다른 주문번호로 문의를 원하시는 경우 신규 작성해주시기 바랍니다.");
		  }	  
	</script>
</body>
</html>