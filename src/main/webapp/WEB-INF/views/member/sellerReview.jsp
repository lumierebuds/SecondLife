<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Second Life - 상품의 새 삶</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/secondlife/resources/css/common.css">
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
								<a href="/secondlife/member/myPage"><p>사용자 정보</p></a>
							</div>
						</div>
						<div class="choices">
							<div class="선택들">
								<a href="/secondlife/member/sell"><p>판매내역</p></a>
							</div>
						</div>
						
						<div class="choices">
							<div class="선택들">
								<a href="/secondlife/member/review"><p>받은 리뷰</p></a>
							</div>
						</div>
						
					</div>
				</div>


				<div class="main">
					<!-- 여기서 작업 -->
					<div class="title">
						<div class="빈공간"></div>
						
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
</body>
</html>