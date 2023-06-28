<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 작성 창</title>
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
#orderNumberDiv{margin-left:110px; width:50.5%; height:35px;}
#orderBtn{background-color: lightgrey; border: 1px solid lightgrey; width:20%;}
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
.highlight {color: #ff5300;}
/*모달창 css*/
.modal{display: none; position: fixed; z-index: 1; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgba(0, 0, 0, 0.4);}
.modal-content {background-color: #fefefe; margin: 15% auto; padding: 20px; border: 1px solid #888; width: 60%;}
.button{background-color: white; color: black; border: 1px solid lightgrey; width:10vh; height:33px; margin-bottom:4px;}
.orderRadio{display: flex; align-items: center; justify-content: center; height: 100%; width: 100%; margin: 0;}
.locationControll {text-align: center; vertical-align: middle;}
.img-block > img {width: 30%; height:15vh; vertical-align: middle;}
div>a{text-decoration: none !important; color:black;}
div>a:hover{text-decoration: none !important; color:black;}
.modalButton{width:25%;}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="../common/navbar.jsp"></jsp:include>
	</div>
	<div class="container custom-container" style="margin-top: 50px; margin-bottom: 50px;">
		<h3>문의 작성</h3>
		<hr style="border-color: dimgrey; height:3px;">
		<fieldset>	
			<form action="${ contextPath }/insertQA.qa" method="post" enctype="multipart/form-data">
				<div class="row">	
					<div class="col-md-1">
						<label>문의유형</label>	
					</div>
					<div class="col-md-10">
						<select id="questionOptions" name="qaTypeNo" required>
					 		<option value="">문의 유형을 선택해주세요.</option>
					 		<option value="1">회원</option>
					 		<option value="2">상품</option>
					 		<option value="3">배송</option>
					 		<option value="4">기타</option>
						</select>	
					</div>
				</div>	
				<br><hr style="border-color: dimgrey; height:2px;">
				<div class="row">
					<div class="col-md-1" style="margin-top:13px;">
						<label for="orderNumber2">주문번호</label>	
					</div>
					<div class="col-md-10 input-group mb-3" id="orderNumberDiv" style="margin-top:13px;">
      					<input type="text" class="form-control" id="orderNumber" name="qaOrderNo" aria-label="Recipient's username" aria-describedby="button-addon2" readonly>
  						<button  type="button" id="orderBtn">조회</button>
					</div>
					<p id="answerNote" style="margin-left: 215px;">* 입력시 정확한 답변 처리가 가능합니다.</p>
				</div><hr style="border-color: dimgrey; height:2px;">
				<div class="row">
					<div class="col-md-1">
						<label for="subject">제목</label>
					</div>
					<div class="col-md-10">
						<input type="text" id="subject" name="qaTitle" maxlength="90" required>
					</div>
				</div><hr style="border-color: dimgrey; height:2px;">
				<div class="row">
					<div class="col-md-1">
						<label for="content">문의내용</label>
					</div>
					<div class="col-md-10">
						<textarea id="content" name="qaContent" maxlength="300" required></textarea>
					</div>
				</div><hr style="border-color: dimgrey; height:2px;">
				<div class="row">
					<div class="col-md-1">
						<label>사진</label>
					</div>
					<div class="col-md-10">
						<input type="file" id="fileInput" name="fileInput" onchange="addImages()" multiple style="display: none;">
  						<label for="fileInput" id="file-label">
	   						<span id="imageButton">
	      						<i id="icon" class="bi bi-plus-lg"></i>
	   						</span>
  						</label>
  						<div id="imagePreview"></div>
					</div>
				</div><hr style="border-color: dimgrey; height:2px;">
				<span id="buttonSpan">
					<button type="button" id="cancel" onclick="confirmCancel()">취소</button>
					<button type="submit" id="write">작성하기</button>
				</span>
			</form>
		</fieldset>
	</div>
	
	<!-- 주문번호 조회창 -->	
	<div id="orderModal" class="modal">
	  	<div class="modal-content">
	    <h3>주문조회</h3>
	    <hr style="border-color: dimgrey; height:3px;">
	    <!-- 주문조회 내용을 표시할 영역 -->
	    <div class="container" id="orderDetails">
	    	<div class="btn-group" role="group" aria-label="Button Group">
				<input type="radio" class="btn-check" name="options" id="option1" autocomplete="off">
				<label class="btn btn-secondary button" for="option1">1주일</label>
				<input type="radio" class="btn-check" name="options" id="option2" autocomplete="off">
				<label class="btn btn-secondary button" for="option2">1개월</label>
				<input type="radio" class="btn-check" name="options" id="option3" autocomplete="off">
				<label class="btn btn-secondary button" for="option3">3개월</label>
				<input type="radio" class="btn-check" name="options" id="option4" autocomplete="off">
				<label class="btn btn-secondary button" for="option4">전체 시기</label>
	   	    </div><br><br>
	   	    <div>
	   	    	<table class="table table-hover mx-auto"> <!-- 게시판 목록 -->
					<colgroup>
						<col style="width:36px">
						<col style="width:240px">
						<col style="width:150px">
						<col style="width:104px">
					</colgroup>
					<thead>
						<tr style="border-bottom: 2px solid lightgrey; border-top: 2px solid lightgrey;">
							<th scope="col" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품정보</th>
							<th class="locationControll" scope="col">주문번호</th>
							<th class="locationControll" scope="col">주문일자</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="locationControll">
								<input type="radio" class="orderRadio" name="order_list" value=20230515035254001>
							</td>
							<td>
								<div class="n-prd-row">
									<a href="{ contextPath }/detailproduct.pr" class="img-block">
										<img src="나선환.jpg" alt="제품 상세 페이지">
										<span style="display: inline-block; vertical-align: middle;">
											<span>나루토 카라티</span><br>
	     								    <span>[FREE 옵션]</span>
										</span>
									</a>
								</div>
							</td>
							<td class="locationControll">202305150352540001</td>
							<td class="locationControll">2023.05.15</td>
						</tr>
						<tr>
							<td class="locationControll">
								<input type="radio" class="orderRadio" name="order_list" value=30230515035254001>
							</td>
							<td>
								<div class="n-prd-row">
									<a href="{ contextPath }/detailproduct.pr" class="img-block">
										<img src="나선환.jpg" alt="제품 상세 페이지">
										<span style="display: inline-block; vertical-align: middle;">
											<span>나루토 카라티</span><br>
	     								    <span>[FREE 옵션]</span>
										</span>
									</a>
								</div>
							</td>
							<td class="locationControll">202305150352540001</td>
							<td class="locationControll">2023.05.15</td>
						</tr>
						<tr>
							<td class="locationControll">
								<input type="radio" class="orderRadio" name="order_list" value=20230515035254001>
							</td>
							<td>
								<div class="n-prd-row">
									<a href="{ contextPath }/detailproduct.pr" class="img-block">
										<img src="나선환.jpg" alt="제품 상세 페이지">
										<span style="display: inline-block; vertical-align: middle;">
											<span>나루토 카라티</span><br>
	     								    <span>[FREE 옵션]</span>
										</span>
									</a>
								</div>
							</td>
							<td class="locationControll">202305150352540001</td>
							<td class="locationControll">2023.05.15</td>
						</tr>
						<tr>
							<td class="locationControll">
								<input type="radio" class="orderRadio" name="order_list" value=20230515035254001>
							</td>
							<td>
								<div class="n-prd-row">
									<a href="{ contextPath }/detailproduct.pr" class="img-block">
										<img src="나선환.jpg" alt="제품 상세 페이지">
										<span style="display: inline-block; vertical-align: middle;">
											<span>나루토 카라티</span><br>
	     								    <span>[FREE 옵션]</span>
										</span>
									</a>
								</div>
							</td>
							<td class="locationControll">202305150352540001</td>
							<td class="locationControll">2023.05.15</td>
						</tr>
						<tr>
							<td class="locationControll">
								<input type="radio" class="orderRadio" name="order_list" value=20230515035254001>
							</td>
							<td>
								<div class="n-prd-row">
									<a href="{ contextPath }/detailproduct.pr" class="img-block">
										<img src="나선환.jpg" alt="제품 상세 페이지">
										<span style="display: inline-block; vertical-align: middle;">
											<span>나루토 카라티</span><br>
	     								    <span>[FREE 옵션]</span>
										</span>
									</a>
								</div>
							</td>
							<td class="locationControll">202305150352540001</td>
							<td class="locationControll">2023.05.15</td>
						</tr>
					</tbody>
				</table>	
	   	    </div>
	   	    <div>
	   	    	<nav aria-label="Page navigation example" style="margin-bottom: 5%;"> <!-- 페이지 넘어가는 버튼 -->
				  <ul  class="pagination" style="justify-content: center;">
				    <li class="page-item">
				    	<a class="page-link" href="#" aria-label="Previous">
				        	<span style="color: black;" aria-hidden="true">&laquo;</span>
				    	</a>
				    </li>
				    <li class="page-item">
				     	<a class="page-link" style="color: black;" href="#">1</a>
				    </li>
				    <li class="page-item">
				    	<a class="page-link" style="color: black;" href="#">2</a>
				    </li>
				    <li class="page-item">
				    	<a class="page-link" style="color: black;" href="#">3</a>
				    </li>
				    <li class="page-item">
				    	<a class="page-link" style="color: black;" href="#">4</a>
				    </li>
				    <li class="page-item">
				    	<a class="page-link" style="color: black;" href="#">5</a>
				    </li>
				    <li class="page-item">
				    	<a class="page-link" href="#" aria-label="Next">
				      		<span style="color: black;" aria-hidden="true">&raquo;</span>
				    	</a>
				    </li>
				  </ul>	  
				</nav>
	   	    </div>
	   	    <div style="margin-left: 310px;">
	   	    	<button type="button" class="btn btn-light modalButton cancelButton" style="font-weight: bold; color: grey;">취소</button>
	   	    	<button type="button" class="btn btn-secondary modalButton" onclick="clickChoice()">선택하기</button>
	   	    </div>
	  	</div>
  </div>
</div>
	<div class="container">
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>	
	<script>
	// 문의 유형 선택
		const addOptions = (options) => {
			  const questionOptions = document.getElementById('questionOptions');
			  questionOptions.innerHTML = ''; // 기존 옵션 초기화
			  
			  
			  for (let i = 0; i < options.length; i++) {
			    const newOption = document.createElement('option');
			    newOption.text = options[i];
			    questionOptions.add(newOption)
			  }	 
			  
			  const answerNote = document.getElementById('answerNote');

			    if (options.includes('교환/반품') || options.includes('취소/반품(환불)') || options.includes('상품 문의') || options.includes('불량/하자') || options.includes('AS') || options.includes('주문 변경')) {
		        	answerNote.innerHTML = '* 필수 입력 항목';
		        	answerNote.classList.add('highlight');
		      } else {
			    	answerNote.innerHTML = '* 입력시 정확한 답변 처리가 가능합니다.';
		        	answerNote.classList.remove('highlight');
		      }   
			   
		}
		 
	    function handleSelectChange() {
	    	  // 선택된 옵션의 값을 가져옴
	    	  const questionOptions = document.getElementById('questionOptions').value;
	    	  
	    	  // 선택된 옵션에 따라 원하는 작업을 수행
	    	  if (questionOptions === "교환/반품" || questionOptions === "취소/반품(환불)" || questionOptions === "상품 문의" || questionOptions === "불량/하자" || questionOptions === "AS" || questionOptions === "주문 변경"){
	    		  answerNote.innerHTML = '* 필수 입력 항목';
			      answerNote.classList.add('highlight');
	    	  } else {
			    	answerNote.innerHTML = '* 입력시 정확한 답변 처리가 가능합니다.';
		        	answerNote.classList.remove('highlight');
		      } 
	    }	 
	   
	    window.onload = function() {
	    	document.getElementById('write').addEventListener('click', function(event) {
	    		const questionOptions = document.getElementById('questionOptions').value;
		    	if (questionOptions === "교환/반품" || questionOptions === "취소/반품(환불)" || questionOptions === "상품 문의" || questionOptions === "불량/하자" || questionOptions === "AS" || questionOptions === "주문 변경"){
		    		if(document.getElementById("orderNumber").value===''){
		    			event.preventDefault();
		    			alert("주문번호를 선택해 주십시오.")	
		    			document.getElementById("orderNumber").focus();
		            }
		    	}	
		    })	
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
		  
		  document.getElementById("orderBtn").addEventListener("click", function() {
			  // 주문조회 모달 창 보이기`
			  document.body.style.overflow = "hidden";
			  document.getElementById("orderModal").style.display = "block";
			  
			});

			// 모달 닫기 버튼 클릭 이벤트 핸들러
			document.getElementsByClassName("cancelButton")[0].addEventListener("click", function() {
			  // 주문조회 모달 창 숨기기
			  document.body.style.overflow = "";
			  document.getElementById("orderModal").style.display = "none";
			});
			
			//주문 조회 입력칸에 주문번호 가져오기(선택하기 버튼 클릭)
			function clickChoice() {
			  // 선택된 주문번호를 담을 변수
			  var orderNumber = "";
			
			  // 주문번호를 가져올 라디오 버튼들을 선택
			  var orderRadios = document.getElementsByClassName("orderRadio");
			
			  // 라디오 버튼을 순회하면서 선택된 주문번호 확인
			  for (var i = 0; i < orderRadios.length; i++) {
			    if (orderRadios[i].checked) {
			      orderNumber = orderRadios[i].value;
			      break; // 선택된 주문번호를 찾았으므로 루프 종료
			    }
			  }
			  // orderNumber 변수를 다른 곳에서 사용할 수 있도록 원하는 작업을 수행
			  document.getElementById("orderNumber").value = orderNumber;
			  document.getElementById("orderModal").style.display = "none";
			  document.body.style.overflow = "";
			
			}
			
			$.ajax({
				url:'${contextPath}/selectList.pr',
				data: 
			})
				
			
	</script>
</body>
</html>