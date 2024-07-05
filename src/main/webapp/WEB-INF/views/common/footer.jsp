<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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

footer {
	height: 200px;
	border-collapse: collapse;
	display: flex;
}

.footer-area {
	flex-basis: 1024px;
	flex-shrink: 0;
	height: 100%;
	border-bottom: 1px solid black;
	border-top: 1px solid black;
	display: flex;
	flex-direction: column;
	background-color: #E6CCB2;
}

.footer-area hr {
	width: 100%;
	margin: 0px;
}

.footer-area h5, h6 {
	font-weight: 600;
	margin-right: 5px;
}

.footer-area div>h5 {
	margin-bottom: 12px;
	color: #9C6644;
}

.footer-area div>p {
	margin: 1px 0px 5px 0px;
}

.footer-info {
	display: flex;
	flex-direction: column;
	padding: 15px 0px;
	background-color: #E6CCB2;
}

.footer-info div {
	display: flex;
	align-items: baseline;
}

.footer-term {
	padding: 8px 0px;
}

.footer-term a {
	margin-right: 20px;
	font-weight: 600;
	color: #9C6644;
}
</style>
</head>
<body>
	<footer>
		<div class="marginer"></div>
		<div class="footer-area">
			<div class="footer-info">
				<h5>세컨드 라이프</h5>
				<div>
					<h6>전화</h6>
					<p>1544-XXXX</p>
				</div>
				<div>
					<h6>이메일</h6>
					<p>second@life.com</p>
				</div>
				<div>
					<h6>주소</h6>
					<p>서울특별시 강남구 테헤란로 KH 강남1지원</p>
				</div>
			</div>
			<hr>
			<div class="footer-term">
				<a href="">이용약관</a> <a href="">개인정보처리방침</a>
			</div>
		</div>
		<div class="marginer"></div>
	</footer>
</body>
</html>