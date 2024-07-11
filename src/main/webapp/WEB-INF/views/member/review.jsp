<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Second Life - 상품의 새 삶</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="/secondlife/resources/css/myPage.css">
<style>
.centered-content {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.content {
	display: flex;
	background-color: #EDE0D4;
}

.tap {
	height: 600px;
	width: 20%;
	background-color: #E6CCB2;
	display: flex;
}

.choice {
	width: 100%;
	height: 70%;
	margin-top: 90px;
}

.선택들 {
	height: 84px;
	width: 100%;
	background-color: #DDB892;
	text-align: center;
	border: 1px solid #B08968;
	font-weight: bold;
}

.선택들 p {
	margin-top: 30px;
	color: #7F5539;
}

/* 여기서 스타일 작업 */
.빈공간 {
	width: 817px;
	height: 50px;
}

.semi-title {
	display: flex;
}

.title-title p {
	margin-left: 30px;
	font-size: 30px;
	font-weight: bold;
	color: #7F5539;
}

.star {
	margin-left: 210px;
	width: 390px;
	height: 50px;
	background-color: #DDB892;
	color: #7F5539;
	border-radius: 5px;
	display: flex;
}

.star .star-score p {
	font-size: 20px;
	font-weight: bold;
	margin-top: 10px;
	margin-left: 40px;
}

.star .star-star p {
	margin-left: 25px;
	font-size: 30px;
}

.profile-info {
	display: flex;
}

.profile-info .profile-picture {
	width: 70px;
	height: 70px;
	background-color: #7F5539;
	margin-left: 30px;
	border-radius: 40px;
}

.profile-info p {
	margin-top: 20px;
	color: #7F5539;
}

.profile-info .nick {
	font-size: 15px;
	font-weight: bold;
	margin-top: 10px;
	margin-left: 15px;
	margin-bottom: 5px;
}

.profile-info .person {
	margin-top: 0px;
	margin-left: 15px;
	font-size: 15px;
}

.reviews .box {
	display: flex;
	margin-left: 30px;
	width: 750px;
	height: 80px;
	background-color: #DDB892;
	border-radius: 10px;
}

.reviews .box .star2 {
	margin-top: 0px;
}

.reviews .box .star2 p {
	margin-top: 15px;
	margin-left: 30px;
	font-size: 30px;
	color: #7F5539;
}

.reviews .box .review {
	margin-top: 30px;
	margin-left: 30px;
	font-size: 15px;
	font-weight: bold;
	color: #7F5539;
}

header {
	background-color: #E6CCB2;
}

.header-title h3, .footer-info h5 {
	color: #7F5539;
}

.header-menu-item a, .footer-term a {
	color: #9C6644;
	text-decoration: none;
	font-weight: bold;
}

.header-menu-item a:hover, .footer-term a:hover {
	color: #B08968;
}

.header-user-menu-item a {
	color: #7F5539;
}
</style>
</head>
<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />



		<main class="centered-content">
			<div class="marginer"></div>











			<div class="content">
				<div class="tap">
					<div class="choice">
						<div class="choices">
							<div class="선택들">
								<a href="/secondlife/member/myPage"><p>내 정보</p></a>
							</div>
						</div>
						<div class="choices">
							<div class="선택들">
								<a href="/secondlife/member/sell"><p>판매내역</p></a>
							</div>
						</div>
						<div class="choices">
							<div class="선택들">
								<a href="/secondlife/member/buy"><p>구매내역</p></a>
							</div>
						</div>
						<div class="choices">
							<div class="선택들">
								<a href="/secondlife/member/review"><p>받은 리뷰</p></a>
							</div>
						</div>
						<div class="choices">
							<div class="선택들">
								<a href="/secondlife/member/basket"><p>찜 목록</p></a>
							</div>
						</div>
					</div>
				</div>

















				<div class="main">
					<!-- 여기서 작업 -->
					<div class="title">
						<div class="빈공간"></div>
						<div class="semi-title">
							<div class="title-title">
								<p>받은 리뷰</p>
							</div>
						</div>
						<div class="star">
							<div class="star-score">
								<p>평균 별점</p>
							</div>
							<div class="star-star">
								<p>5.0 ★★★★★</p>
							</div>
						</div>
					</div>
					<div class="reviews">
						<div class="profile-info">
							<div class="profile-picture"></div>
							<div class="info">
								<p class="nick">준씨샵</p>
								<p class="person">구매자 2024-06-12</p>
							</div>
						</div>
						<div class="box">
							<div class="star2">
								<p>★★★★★</p>
							</div>
							<div class="review">
								<p>빠른 쿨거래 감사합니다. 잘 사용하겠습니다. 정말 감사합니다.</p>
							</div>
						</div>

					</div>


				</div>
			</div>




			<div class="marginer"></div>
		</main>

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
</html>