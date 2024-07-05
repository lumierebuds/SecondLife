<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	display: flex;
}

#container {
	display: flex;
	flex-direction: column;
	border: 1px solid red;
	box-sizing: border-box;
}

.marginer {
	width: 15%;
	flex-grow: 1;
	height: 100%;
	border: 1px solid black;
}

header {
	height: 100px;
	background-color: #f8f9fa;
	display: flex;
}

.header-area {
	flex-basis: 1024px;
	flex-shrink: 0;
	height: 100%;
	display: flex;
	align-items: center;
	border-bottom: 1px solid black;
	border-top: 1px solid black;
}

.title {
	width: 25%;
	height: 100%;
	display: flex;
	align-items: center;
}

.menu {
	width: 40%;
	height: 100%;
	display: flex;
	align-items: center;
	padding-bottom: 5px;
}

.menu-item {
	width: 50%;
	display: flex;
	justify-content: center;
}

.menu a {
	font-weight: 600;
	margin: 0;
	font-size: 24px;
	color: black;
}

.user-menu {
	width: 35%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: flex-end;
}

.user-menu-item {
	height: 60%;
	display: flex;
	align-items: center;
	margin: 0px 5px;
}

.user-menu img {
	margin: 10px;
}

.user-menu a {
	font-weight: 600;
	color: black;
}

header img {
	height: 40%;
	margin: 0px 20px 3px 0px;
}

main {
	width: 99.9vw;
	flex-basis: 600px;
	display: flex;
	border-collapse: collapse;
}

.content {
	flex-basis: 1024px;
	flex-shrink: 0;
	height: 100%;
	border: 1px solid black;
	background-color: #E6CCB2;
}

.container {
	display: flex;
	flex-direction: column;
}

.container>div:nth-of-type(1) {
	display: flex;
	justify-content: center;
	margin-top: 20px;
	color: #9C6644;
}

.container h2 {
	font-weight: 600;
}

.form-group {
	display: flex;
	align-items: center;
	width: 100%;
	margin-top: 10px;
	color: white;
}

.form-group label {
	flex: 0 0 120px;
	margin-right: 20px;
	text-align: right;
}

.form-group input[type="text"], .form-group input[type="password"],
	.form-group select, .form-group input[type="file"], .form-group textarea,
	.form-group input[type="email"] {
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	width: 270px;
	max-width: 100%;
}

.form-group [name="id"], .form-group [name="name"] {
	background-color: #B6B6B6;
}

.email-group input[type="text"] {
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	width: 116px;
	max-width: 100%;
}

.email-group select {
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	width: 120px;
	max-width: 100%;
}

.email-group span {
	margin: 0 10px;
}

.file-group .file-input-container {
	display: flex;
	align-items: center;
}

.file-group .profile-pic-input {
	width: 180px; /* 적절한 너비로 수정 */
	max-width: 100%;
}

.file-select {
	padding: 8px 12px;
	background-color: black;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	white-space: nowrap;
	margin-left: 10px;
	background-color: #DDB892;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

.checkbox-container {
	display: flex;
	align-items: center;
	justify-content: center;
	margin-top: 10px;
}

.checkbox-container label {
	margin-left: 136px;
}

.checkbox-container input[type="checkbox"] {
	margin-right: 5px;
}

.button-group {
	display: flex;
	justify-content: center;
	margin-top: 20px;
	width: 100%;
}

.button-group button {
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	color: white;
	cursor: pointer;
	margin: 0 5px;
	background-color: #DDB892;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

.button-group button[type="reset"] {
	background-color: #9C6644;
	color: white;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

.form-container {
	background-color: #7F5539;
	padding: 20px;
	border-radius: 8px;
	margin: 20px 100px;
	max-width: 800px;
	justify-content: center;
	display: flex;
}

form {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	padding: 0 20px;
}
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<div id="container">


		<main class="centered-content">
			<div class="marginer"></div>
			<div class="content">

				<div class="container">
					<div>
						<h2>회원정보수정</h2>
					</div>
					<div class="form-container">
						<form>
							<div class="form-group">
								<label for="id">아이디</label> <input type="text" id="id" name="id"
									readonly>
							</div>

							<div class="form-group">
								<label for="nickname">닉네임</label> <input type="text"
									id="nickname" name="nickname" placeholder="수정하실 닉네임을 입력하세요">
							</div>
							<div class="form-group">
								<label for="password">비밀번호</label> <input type="password"
									id="password" name="password" placeholder="수정하실 비밀번호를 입력하세요">
							</div>
							<div class="form-group">
								<label for="confirm-password">비밀번호 확인</label> <input
									type="password" id="confirm-password" name="confirm-password"
									placeholder="비밀번호를 재입력하세요">
							</div>
							<div class="form-group">
								<label for="name">이름</label> <input type="text" id="name"
									name="name" readonly>
							</div>
							<div class="form-group">
								<label for="address">주소</label> <input type="text" id="address"
									name="address">
							</div>
							<div class="form-group">
								<label for="phone">전화번호</label> <input type="text" id="phone"
									name="phone" placeholder='휴대폰번호 입력("-"제외 11자리 입력)'>
							</div>
							<div class="form-group email-group">
								<label for="email">이메일</label> <input type="text" id="email"
									name="email" placeholder="이메일주소"> <span>@</span> <select
									id="email-domain" name="email-domain">
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="daum.net">daum.net</option>
									<option value="nate.com">nate.com</option>
								</select>
							</div>
							<div class="form-group file-group">
								<label for="profile-pic">프로필 사진</label>
								<div class="file-input-container">
									<input type="text" id="profile-pic" name="profile-pic"
										class="profile-pic-input">
									<button type="button" class="file-select">파일 선택</button>
								</div>
							</div>



							<div class="button-group">
								<button type="submit">수정하기</button>
								<button type="reset">취소</button>
							</div>
						</form>
					</div>

				</div>

			</div>
			<div class="marginer"></div>
		</main>


	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>