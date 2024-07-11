<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Second Life - 상품의 새 삶</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/secondLife/resources/css/main.css">

<style>
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
        color: #7F5539;
        font-weight: bold;
      }
      .선택들 p{
        margin-top: 30px;
      }

      .main .빈공간 {
        width: 817px;
        height: 60px;
      }
      .main .main-title {
        text-align: center;
      }
      .main .main-title p {
        font-size: 25px;
        font-weight: bold;
        margin-bottom: 20px;
        color: #7F5539;
      }

      .main .card {
        margin-left: 110px;
        width: 600px;
        height: 400px;
        background-color: #B08968;
        border-radius: 10px;
        color: #EDE0D4;
      }
      .card-content {
        display: flex;
      }

      .card-content .table {
        margin-top: 80px;
        margin-left: 100px;
      }

      .card-content .table th {
        font-size: 15px;
        padding: 8px;
        border: 0;
        text-align: right;
        color: #EDE0D4;
      }
      .card-content .table td {
        border: 0;
        padding: 8px;
        text-align: center;
        color: #EDE0D4;
      }

      .card-content img {
        border-radius: 5px;
        margin-right: 40px;
        margin-top: 80px;
      }

      .buttons {
        display: flex;
        margin-left: 180px;
        margin-top: 30px;
      }

      .buttons .수정, .buttons .탈퇴 {
        height: 30px;
        margin-left: 20px;
        border: none;
        color: #EDE0D4;
        font-weight: bold;
        border-radius: 5px;
      }

      .buttons .수정 {
        width: 120px;
        background-color: #7F5539;
      }

      .buttons .탈퇴 {
        width: 80px;
        background-color: #9C6644;
      }

      .buttons .수정 p{
        margin-top: 2px;
      }

      .buttons .탈퇴 p{
        margin-top: 2px;
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
      <header>
        <div class="marginer"></div>
        <div class="header-area">
          <div class="header-title">
            <img src="사이트 로고.png" alt="사이트로고">
            <h3>SecondLife</h3>
          </div>
          <div class="header-menu">
            <div class="header-menu-item">
              <a href="">거래 장터</a>
            </div>
          </div>
          <div class="header-user-menu">
            <div class="header-user-menu-item">
              <img src="세라톡 아이콘.png" alt="사이트로고">
              <a href="">세라톡</a>
            </div>
            <div class="header-user-menu-item">
              <img src="로그인 아이콘.png" alt="사이트로고">
              <a href="">로그인</a>
            </div>
          </div>
        </div>
        <div class="marginer"></div>
      </header>

      <main class="centered-content">
        <div class="marginer"></div>
        <div class="content">
          <div class="tap">
            <div class="choice">
              <div class="choices">
                <div class="선택들">
                  <p>내 정보</p>
                </div>
              </div>
              <div class="choices">
                <div class="선택들">
                  <p>판매내역</p>
                </div>
              </div>
              <div class="choices">
                <div class="선택들">
                  <p>구매내역</p>
                </div>
              </div>
              <div class="choices">
                <div class="선택들">
                  <p>받은 리뷰</p>
                </div>
              </div>
              <div class="choices">
                <div class="선택들">
                  <p>찜한글</p>
                </div>
              </div>
            </div>
          </div>

          <div class="main">
            <div class="빈공간"></div>
            <div class="main-title">
              <p>내 정보</p>
            </div>
            <div class="card">
              <div class="card-content">
                <table class="table">
                  <tr>
                    <th>이름</th>
                    <td>홍길동</td>
                  </tr>
                  <tr>
                    <th>전화번호</th>
                    <td>010-XXXX-XXXX</td>
                  </tr>
                  <tr>
                    <th>주소</th>
                    <td>서울특별시 강남구</td>
                  </tr>
                  <tr>
                    <th>이메일</th>
                    <td>hong33@gmail.com</td>
                  </tr>
                  <tr>
                    <th>닉네임</th>
                    <td>웃으면 복이 가요</td>
                  </tr>
                </table>
                <img src="/빠끄껀.jpg" alt="" width="180px" height="200px">
              </div>
              <div class="buttons">
                <button class="수정"><p>회원정보수정</p></button>
                <button class="탈퇴"><p>회원탈퇴</p></button>
              </div>
            </div>
          </div>
        </div>
        <div class="marginer"></div>
      </main>

      <footer>
        <div class="marginer"></div>
        <div class="footer-area">
          <div class="footer-info">
            <h5>세컨드 라이프</h5>
            <div>
              <h6>전화</h6><p>1544-XXXX</p>
            </div>
            <div>
              <h6>이메일</h6><p>second@life.com</p>
            </div>
            <div>
              <h6>주소</h6><p>서울특별시 강남구 테헤란로 KH 강남1지원</p>
            </div>
          </div>
          <hr>
          <div class="footer-term">
            <a href="">이용약관</a>
            <a href="">개인정보처리방침</a>
          </div>
        </div>
        <div class="marginer"></div>
      </footer>
    </div>
    
    
    
</body>










</html>