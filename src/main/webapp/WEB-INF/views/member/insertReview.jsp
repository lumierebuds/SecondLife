<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Second Life - 상품의 새 삶</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/secondlife/resources/css/member/insertReview.css">
    <style>
        textarea::placeholder {
            color: #9C6644;
        }
    </style>
</head>
<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		
		<main class="centered-content">
			<div class="marginer"></div>

				<div class="content">
   
					<div class="review-form">
    					<h2>리뷰</h2>
    					<div class="image-preview" id="imagePreview">
							<span class="image-preview__default-text">이미지 미리보기</span>
        					<img src="" alt="Image Preview" class="image-preview__image" style="display: none;">
						</div>
						<!-- <div class="file-upload-wrapper">
    						<input type="text" id="file-path" class="file-path" readonly>
    						<label for="file-upload" class="file-upload-label">파일첨부</label>
    						<input type="file" id="file-upload" class="file-upload-input">
						</div> -->
						<br><br>
						<textarea placeholder="리뷰를 작성해주세요."></textarea>
						<div class="star-rating-box">
    						<span class="star-rating-text">별점</span>
    							<div class="star-rating">
									<input type="radio" id="star5" name="rating" value="5"><label for="star5">★</label>
									<input type="radio" id="star4" name="rating" value="4"><label for="star4">★</label>
									<input type="radio" id="star3" name="rating" value="3"><label for="star3">★</label>
									<input type="radio" id="star2" name="rating" value="2"><label for="star2">★</label>
									<input type="radio" id="star1" name="rating" value="1"><label for="star1">★</label>
    							</div>
       					</div>
        				<button type="button" class="submit-button">작성하기</button>
    				</div>
				</div>

			<div class="marginer"></div>
        </main>
		
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	</div>
</body>
</html>