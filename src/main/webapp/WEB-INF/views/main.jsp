<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="/secondlife/resources/css/main.css">
</head>

<body onselectstart="return false">
	<div id="container">
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>

		<main id="main-container">
			<div class="marginer"></div>
			<div class="content">
				<div class="intro">
					<div class="section-divider">
						<div class="section-quarter intro-title">
							<h1 class="bold">함께해 온 추억에게</h1>
							<h1 class="bold">찾아온 두번째 삶</h1>
						</div>
						<div class="section-quarter"></div>
					</div>
					<div class="section-divider">
						<div class="section-quarter"></div>
						<div class="section-quarter intro-content">
							<p>모두가 함께 만드는 신뢰성 있는 중고 거래</p>
							<p>세컨드라이프가 함께합니다.</p>
						</div>
					</div>
				</div>
				<hr>
				<div class="show">
					<h2 class="section-title">최근 거래 품목</h2>
					<div class="cards-container" id="cardsContainer">
						<div class="card">
							<img src="https://via.placeholder.com/180x150" alt="Item">
							<div class="card-title">거래물 제목</div>
							<div class="card-subtitle">거래 물품명</div>
						</div>
						<div class="card">
							<img src="https://via.placeholder.com/180x150" alt="Item">
							<div class="card-title">거래물 제목</div>
							<div class="card-subtitle">거래 물품명</div>
						</div>
						<div class="card">
							<img src="https://via.placeholder.com/180x150" alt="Item">
							<div class="card-title">거래물 제목</div>
							<div class="card-subtitle">거래 물품명</div>
						</div>
						<div class="card">
							<img src="https://via.placeholder.com/180x150" alt="Item">
							<div class="card-title">거래물 제목</div>
							<div class="card-subtitle">거래 물품명</div>
						</div>
						<div class="card">
							<img src="https://via.placeholder.com/180x150" alt="Item">
							<div class="card-title">거래물 제목</div>
							<div class="card-subtitle">거래 물품명</div>
						</div>
						<div class="card">
							<img src="https://via.placeholder.com/180x150" alt="Item">
							<div class="card-title">거래물 제목</div>
							<div class="card-subtitle">거래 물품명</div>
						</div>
						<div class="card">
							<img src="https://via.placeholder.com/180x150" alt="Item">
							<div class="card-title">거래물 제목</div>
							<div class="card-subtitle">거래 물품명</div>
						</div>
						<div class="card">
							<img src="https://via.placeholder.com/180x150" alt="Item">
							<div class="card-title">거래물 제목</div>
							<div class="card-subtitle">거래 물품명</div>
						</div>
						<div class="card">
							<img src="https://via.placeholder.com/180x150" alt="Item">
							<div class="card-title">거래물 제목</div>
							<div class="card-subtitle">거래 물품명</div>
						</div>
						<div class="card">
							<img src="https://via.placeholder.com/180x150" alt="Item">
							<div class="card-title">거래물 제목</div>
							<div class="card-subtitle">거래 물품명</div>
						</div>
						<div class="card">
							<img src="https://via.placeholder.com/180x150" alt="Item">
							<div class="card-title">거래물 제목</div>
							<div class="card-subtitle">거래 물품명</div>
						</div>
					</div>
				</div>
			</div>
			<div class="marginer"></div>
		</main>

		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	</div>

	<div class="modal-background" id="modalBackground">
		<!-- 로그인 모달 -->
		<div class="modal-content modal-login">
			<img src="https://via.placeholder.com/50" alt="로고">
			<form action="/secondlife/member/login" method="post">
				<input type="text" placeholder="아이디" name="id"> <input type="password"
					placeholder="비밀번호" name="pwd">
				<div class="additional-options">
					<a id="find-id" onclick="return false">계정을 잊어버리셨나요?</a> <a
						id="register" href="/secondlife/member/signup">회원 가입</a>
				</div>
				<div class="flex-right">
					<input type="checkbox" id="rememberMe"> <label
						for="rememberMe">로그인 유지</label>
				</div>
				<button class="submit-btn">확 인</button>
			</form>
		</div>
		<!-- 계정 찾기 모달(아이디/비밀번호) -->
		<div class="modal-content modal-find-form">
			<img src="https://via.placeholder.com/50" alt="로고">
			<div class="tab-buttons">
				<button id="id-select" value="find-id-form" class="find-btn">아이디
					찾기</button>
				<button id="pwd-select" value="find-pwd-form" class="find-btn">비밀번호
					찾기</button>
			</div>
			<form action="" class="find-form find-id-form">
				<label for="emailInput">가입 시 사용한 이메일을 입력해주세요</label> <input
					type="text" id="emailInput" name="email" placeholder="이메일">
				<button class="submit-btn">확 인</button>
			</form>
			<form action="" class="find-form find-pwd-form">
				<label for="idInput">아이디</label> <input type="text" id="id-input"
					name="id" placeholder="아이디">
				<div class="flex-right">
					<button id="id-submit" onclick="return false">인증번호 보내기</button>
				</div>
				<div class="certi-area">
					<label for="certi-num">인증번호</label> <input type="text"
						name="certiNum" id="certi-num">
					<button id="certi-num-btn">확 인</button>
				</div>
				<button class="submit-btn">확 인</button>
			</form>
		</div>
		<div class="modal-content result-form" style="display: flex;">
			<img src="https://via.placeholder.com/50" alt="로고"> <label
				for="pwd-result">임시 비밀번호가 발급되었습니다</label> <input type="text"
				id="pwd-result" value="" placeholder="아이디 찾기 결과" disabled>
		</div>
		<div class="modal-content result-form" style="display: flex;">
			<img src="https://via.placeholder.com/50" alt="로고"> <label
				for="id-result">아이디 찾기 결과</label> <input type="text" id="id-result"
				value="" placeholder="아이디 찾기 결과" disabled>
		</div>
	</div>

	<script src="/secondlife/resources/js/main.js">
    </script>
    
    <c:if test="${not empty fn:trim(alertMsg)}">
        <script>
            alert("${alertMsg}");
        </script>
        <c:remove var="alertMsg" scope="session" />
    </c:if>

</body>

</html>