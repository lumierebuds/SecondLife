<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Second Life - 상품의 새 삶</title>
    <link rel="stylesheet" href="/secondlife/resources/css/member/sellerSell.css">
    <link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
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

.gun {
	margin-top: 3px;
	margin-left: 20px;
	width: 50px;
	height: 40px;
	background-color: #DDB892;
	border-radius: 5px;
	color: #7F5539;
	display: flex;
	font-weight: bold;
}

.gun p {
	margin-left: 5px;
	font-size: 25px;
	font-weight: bold;
}

.delete {
	margin-top: 20px;
	display: flex;
	margin-left: 365px;
}

.title-title input{
    margin-left: 30px;
	font-size: 30px;
	font-weight: bold;
	color: #7F5539;
	background-color: #F2E7DC;
}

.nall {
	margin-left: 10px;
}

.hello {
	margin: 0 30px;
}

.information {
	margin-top: 20px;
	margin-left: 30px;
	width: 760px;
	height: 190px;
	border: 1px solid #B08968;
	border-radius: 10px;
	background-color: #E6CCB2;
	
}

.box1 {
	display: flex;
}

.box-1 {
	accent-color: #7F5539
}

.information .box1 .box-1 {
	margin-top: 15px;
	margin-left: 15px;
	width: 20px;
	height: 20px;
	background-color: #B08968;
	border-radius: 3px;
}

.information .box1 .date {
	margin-left: 10px;
	margin-top: 13px;
}

.information .box1 .date p {
	margin-bottom: 0px;
	font-weight: bold;
	color: #7F5539;
}

.information .box1 .condition {
	margin-top: 13px;
}

.information .box1 .condition p {
	margin-left: 505px;
	margin-bottom: 0px;
	font-weight: bold;
	color: #7F5539;
}

.hello2 {
	margin: 10px 15px;
}

.box2 {
	display: flex;
}

.box2 img {
	margin-top: 10px;
	margin-left: 10px;
	border-radius: 5px;
}

.box2 .text {
	margin-top: 10px;
	margin-left: 10px;
}

.box2 .won p {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 20px;
	color: #7F5539;
}

.box2 .info1 p {
	font-size: 15px;
	font-weight: bold;
	margin-bottom: 10px;
	color: #7F5539;
}

.box2 .info2 p {
	font-size: 10px;
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

.목록들{
	overflow-y: auto; /* scroll 대신 auto 사용 */
	max-height: 489px; /* 필요한 높이로 조정 */
}

</style>
</head>
<body>
    <div id="container">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<main class="centered-content" >
			<div class="marginer"></div>
			<div class="content">
				<div class="tap">
					<div class="choice">
						<div class="choices">
							<div class="선택들">
				               <a href="/secondlife/member/memberDetail/${member.memberNo}"><p>사용자 정보</p></a>
				             </div>
						</div>
						<div class="선택들">
			                <a href="/secondlife/member/sellerSell"><p>판매완료 내역</p></a>
			             </div>
					</div>
				</div>

				<div class="main"  >
					<div class="title">
						<div class="빈공간"></div>
						<div class="semi-title">
							<div class="title-title">
								<p>${member.nickname}님의 판매완료 내역</p>
							</div>
							<div class="gun">
								<p>${fn:length(boardList)}건</p>
							</div>
							
						</div>

						<hr class="hello">
						<div class="목록들" style="overflow-y: auto; max-height: 489px;" >
						<c:if test="${not empty boardList}">
						<c:forEach items="${boardList}" var="board" >
						<div class="information"  >
							<div class="box1">
								<input type="checkbox" class="box-1">
								<div class="date" >
									<p>${board.createDate}</p>
								</div>
								<div class="condition">
									<p>거래완료 &gt</p>
								</div>
							</div>
							<hr class="hello2">
							<div class="box2">
								<img src="/secondlife/${board.biList.get(0).imgPath}${board.biList.get(0).changeName}" alt="" width="80px" height="100px">
								<div class="text">
									<div class="won">
										<p>${board.price}원</p>
									</div>
									<div class="info1">
										<p>${board.productName}</p>
									</div>
									<div class="info2">
										<p>
											<c:if test="${board.tradeCategoryNo == 0}">택배거래</c:if>
											<c:if test="${board.tradeCategoryNo == 1}">직거래</c:if>
											<c:if test="${board.tradeCategoryNo == 2}">택배거래 혹은 직거래</c:if>
										</p>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
						</c:if>
						</div>
						
					</div>
				</div>
			</div>
			<div class="marginer"></div>
		</main>

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
</body>
</html>