<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	margin-top: 130px;
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

.delete {
	margin-top: 20px;
	display: flex;
	margin-left: 525px;
}

.delete button {
	width: 60px;
	height: 20px;
	border: 0;
	background-color: #B08968;
	border-radius: 3px;
	color: #EDE0D4;
	font-weight: bold;
}

.delete button p {
	font-size: 10px;
	margin-top: 2px;
}

.nall {
	margin-left: 10px;
}

.hello {
	margin: 0 30px;
}

.찜 {
	margin-top: 20px;
	margin-left: 30px;
	width: 760px;
	height: 190px;
	border: 1px solid #B08968;
	border-radius: 10px;
	display: flex;
	background-color: #E6CCB2;
}

.찜 img {
	margin-top: 13px;
	margin-left: 15px;
	border-radius: 10px;
}

.찜 .titles {
	display: flex;
}

.찜 .box {
	margin-top: 20px;
	margin-left: 5px;
	width: 20px;
	height: 20px;
	background-color: grey;
	border-radius: 3px;
	accent-color: #7F5539;
}

.찜 p {
	margin-left: 20px;
	color: #7F5539;
}

.찜 .information .title p {
	font-size: 20px;
	font-weight: bold;
	margin-top: 15px;
	margin-bottom: 0px;
}

.찜 .information .won p {
	font-size: 20px;
	font-weight: 900;
	margin-top: 10px;
	margin-bottom: 0px;
}

.찜 .information .date p {
	margin-top: 5px;
}

.hello2 {
	width: 580px;
	margin: 10px 20px;
}

.찜 .location p {
	font-weight: bold;
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

.찜들 {
	overflow-y: auto; /* scroll 대신 auto 사용 */
	max-height: 489px; /* 필요한 높이로 조정 */
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
									<p>찜 목록</p>
								</div>
								<div class="delete">
									<div class="all">
										<button>
											<p>전체삭제</p>
										</button>
									</div>
									<div class="nall">
										<button>
											<p>선택삭제</p>
										</button>
									</div>
								</div>
							</div>

							<hr class="hello">
							
							<div class="찜들전체">
							<div class="찜들" style="overflow-y: auto; max-height: 489px;">
								<c:if test="${wishlist ne null}">
								<c:forEach var="board" items="${wishlist }">
								<div class="찜">
									<img src="/secondlife/${board.biList.get(0).imgPath}${board.biList.get(0).changeName}" alt="" width="120px" height="160px">
									<div class="information">
										<div class="titles">
											<div class="title">
												<p>${board.productName}</p>
											</div>
											<input type="checkbox" class="box">
										</div>
										<div class="won">
											<p>${board.price}원</p>
										</div>
										<div class="date">
											<p>${board.createDate}</p>
										</div>
										
										
									</div>
								</div>
								</c:forEach>
								</c:if> 
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