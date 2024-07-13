<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>Second Life - 거래글 등록</title>
<link rel="stylesheet"
	href="/secondlife/resources/css/board/boardEnrollForm.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
</head>

<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/common/navigation.jsp" />

		<main id="main-container">
			<div class="marginer"></div>
			<div class="content">

				<div class="board-upload">

					<form id="board-upload-form" action="/secondlife/board/list"
						method="post" enctype="multipart/form-data">

						<div class="imgUpload-container">
							<!--이미지 관련-->

							<div class="imgUpload">
								<img src="../resources/images/free-icon-camera.png" alt=""
									width="50px">
								<p>0/10</p>
							</div>

							<div class="additionalBox">
								<!--이미지들이 추가되는 가로 공간 div-->
								<!--동적 이미지가 들어갈 공간 <div><img></div>-->
							</div>
							<!-- 추가본 시작 -->
							<div class="custom-scrollbar" id="custom-scrollbar">
								<div class="custom-thumb" id="custom-thumb"></div>
							</div>
							<!-- 추가본 끝 -->
							<input type="file" id="fileInput" accept="image/*" multiple>
						</div>
						<div class="productNameAndCategory-container">
							<!-- 상품명, 카테고리 감싸는 큰 틀 div -->

							<input type="text" class="productName" name="productName"
								placeholder="상품명" maxlength="30" required>

							<div class="productCategory">
								<!-- ul이 들어가있는 정사각형div -->
								<ul class="categoryList">
									<li id="category-1">
										<button name="category" value="0" onclick="return false">
											<p>수입명품</p>
										</button>
									</li>
									<li id="category-2">
										<button name="category" value="1" onclick="return false">
											<p>패션의류</p>
										</button>
									</li>
									<li id="category-3">
										<button name="category" value="2" onclick="return false">
											<p>패션잡화</p>
										</button>
									</li>
									<li id="category-4">
										<button name="category" value="3" onclick="return false">
											<p>도서/음반/문구</p>
										</button>
									</li>
									<li id="category-5">
										<button name="category" value="4" onclick="return false">
											<p>출산/유아동</p>
										</button>
									</li>
									<li id="category-6">
										<button name="category" value="5" onclick="return false">
											<p>모바일/태블릿</p>
										</button>
									</li>
									<li id="category-7">
										<button name="category" value="6" onclick="return false">
											<p>가전제품</p>
										</button>
									</li>
									<li id="category-8">
										<button name="category" value="7" onclick="return false">
											<p>노트북/PC</p>
										</button>
									</li>
									<li id="category-9">
										<button name="category" value="8" onclick="return false">
											<p>가구/인테리어</p>
										</button>
									</li>
									<li id="category-10">
										<button name="category" value="9" onclick="return false">
											<p>리빙/생활</p>
										</button>
									</li>
									<li id="category-11">
										<button name="category" value="10" onclick="return false">
											<p>게임</p>
										</button>
									</li>
									<li id="category-12">
										<button name="category" value="11" onclick="return false">
											<p>오토바이</p>
										</button>
									</li>
									<li id="category-13">
										<button name="category" value="12" onclick="return false">
											<p>무료나눔</p>
										</button>
									</li>
									<input type="hidden" id="categoryNo" name="categoryNo" value="">
								</ul>
							</div>


						</div>
						<div class="price-container">
							<span>￦</span> <input name="price" type="text" placeholder="판매가격"
								id="price" required>
							<div class="freeSharing-box">
								<input type="checkbox" id="freeSharing" onclick="free()">
								<label for="freeSharing" class="custom-checkbox"></label> <label
									for="freeSharing">무료나눔</label>
							</div>
						</div>
						<section class="product-condition-container">
							<div class="writingbox">
								<textarea name="content" id="writing"
									placeholder="- 상품명(브랜드)																																																- 구매 시기																																																- 사용 기간																																																- 하자 여부																																																* 실제 촬영한 사진과 함께 상세 정보를 입력해주세요.																																																* 카카오톡 아이디 첨부 시 게시물 삭제 및 이용제재 처리될 수 있어요.																																																 																																																안전하고 건전한 거래환경을 위해 과학기술정보통신부, 한국인터넷진흥원, 세컨드라이프가 함께합니다."
									maxlength="1000" required></textarea>
							</div>
							<span class="writing-length"> 0/1000 </span>
							<p class="product-condition-font">상품상태</p>
							<div class="twotypebutton">
								<button value="0" onclick="return false">
									<span>중고</span>
								</button>
								<button value="1" onclick="return false">
									<span>새상품</span>
								</button>
							</div>
							<input type="hidden" id="condition" name="condition" value="">
							<div>
								<p class="tradingMethod-font">거래방법</p>
							</div>
							<div class="tradingMethod">
								<div>
									<input type="checkbox" name="tradeCategoryNo" value="0"
										id="deliveryTransaction"> <label
										for="deliveryTransaction" class="custom-checkbox"></label> <label
										for="deliveryTransaction">택배거래</label>
								</div>
								<div>
									<input type="checkbox" name="tradeCategoryNo" value="1"
										id="directTransaction"> <label for="directTransaction"
										class="custom-checkbox"></label> <label
										for="directTransaction">직거래</label>
								</div>
							</div>
							<button class="uploadButton" type="submit">등록</button>
						</section>

					</form>

				</div>

			</div>
			<div class="marginer"></div>
		</main>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	
	<script src="/secondlife/resources/js/board/boardEnrollForm.js"></script>
	<script>
		$('#board-upload-form').on('submit', function(e) {
			e.preventDefault();
			
			// 거래방법 두개다 선택할 시 "모두" -> value 2 로 바꿔주기
			if($('.tradingMethod > div').eq(0).find('input[name="tradeCategoryNo"]').is(":checked") &&
			$('.tradingMethod > div').eq(1).find('input[name="tradeCategoryNo"]').is(":checked")){
				$('input[name="tradeCategoryNo"]').val('2');
			}		
	
			// 이미지를 하나라도 선택해야 넘어가기 기능
			if(biList.length <= 0) {
				alert("이미지를 최소 하나는 등록하여야 합니다.");
				return false;
			}
			
			// 상품 상태 선택해야 넘어가기 기능
			if($('[name="condition"]').val() == ""){
				alert("상품 상태를 최소 하나는 선택하셔야 합니다.")
				return false;
			}
			
			// 거래방법 선택해야 넘어가기 기능
			if($('.tradingMethod > div').eq(0).find('input[name="tradeCategoryNo"]').is(":not(:checked)") &&
			$('.tradingMethod > div').eq(1).find('input[name="tradeCategoryNo"]').is(":not(:checked)")){
				alert("거래방법을 최소 하나는 선택하셔야 합니다.")
				return false;
			}
			
			// 카테고리 선택해야 넘어가기 기능
			if($('#categoryNo').val() == ""){
				alert("카테고리를 최소 하나는 선택하셔야 합니다.")
				return false;
			}
			
			var form = document.querySelector('#board-upload-form');
			
			// 자바스크립트에서 form 태그 만들기(기존 html form 태그 값 가져옴)
			var formData = new FormData(form);
			
			console.log("form - ", formData);
			console.log("biList = ", biList);
			for(var bi of biList) {
				formData.append("upfile[]", bi);
			}
	
			$.ajax({
				url: '/secondlife/board/insert',
				type: 'POST',
				data: formData,
				contentType: false,
				processData: false,
				success: function(response) {
					console.log(response);
					if(response.result > 0) {
						alert("게시물 등록 성공");
						console.log("boardNo는 ", response.boardNo);
						location.href = '/secondlife/board/detail/' + response.boardNo;
					} else {
						alert("게시물 등록 실패");
						location.replace(location.href);
					}
				},
				error: function(xhr) {
					console.log(xhr);
				}
			});
		});
	</script>
</body>
</html>