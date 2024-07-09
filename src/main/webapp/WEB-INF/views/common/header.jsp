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
    <div class="border-container">
        <header>
            <div class="marginer"></div>
            <div class="header-area">
                <div class="header-title">
                    <img src="/secondlife/resources/images/사이트 로고.png" alt="사이트로고">
                    <h3>SecondLife</h3>
                </div>
                <div class="header-menu">
                    <div class="header-menu-item">
                        <a href="/secondlife/board/list">거래 장터</a>
                    </div>
                </div>
                <div class="header-user-menu">
                    <div class="header-user-menu-item">
                        <button onclick="return false">
                            <img src="/secondlife/resources/images/세라톡 아이콘.png" alt="세라톡 아이콘">
                            세라톡
                        </button>
                    </div>
                    <div class="header-user-menu-item">
                        <button id="login" onclick="return false">
                            <img src="/secondlife/resources/images/로그인 아이콘.png" alt="로그인 아이콘">
                            로그인
                        </button>
                    </div>
                </div>
            </div>
            <div class="marginer"></div>
        </header>
    </div>
    
    <div class="modal-background" id="modalBackground">
		<!-- 로그인 모달 -->
		<div class="modal-content modal-login">
			<img src="https://via.placeholder.com/50" alt="로고">
			<form action="">
				<input type="text" placeholder="아이디"> <input type="password"
					placeholder="비밀번호">
				<div class="additional-options">
					<a id="find-id" onclick="return false">계정을 잊어버리셨나요?</a> <a
						id="register" href="member/signup">회원 가입</a>
				</div>
				<div class="flex-right">
					<input type="checkbox" id="rememberMe"> <label
						for="rememberMe">로그인 유지</label>
				</div>
				<button class="submit-btn" onclick="return false">확 인</button>
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
	
	<script src="/secondlife/resources/js/common.js"></script>
</body>
</html>