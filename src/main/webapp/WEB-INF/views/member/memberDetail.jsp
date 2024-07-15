<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Second Life - 상품의 새 삶</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="/secondlife/resources/css/member/memberDetail.css">
  <style>
  	.main-container {
  		display: flex;
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
      color: #7F5539;
      font-weight: bold;
    }

    .선택들 p {
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
      margin-top: 120px;
      margin-left: 100px;
    }

    .card-content .table th {
      font-size: 25px;
      padding: 8px;
      border: 0;
      text-align: right;
      color: #EDE0D4;
    }

    .card-content .table td {
      border: 0;
      padding: 10px;
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

    .buttons .수정,
    .buttons .탈퇴 {
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

    .buttons .수정 p {
      margin-top: 2px;
    }

    .buttons .탈퇴 p {
      margin-top: 2px;
    }

    header {
      background-color: #E6CCB2;
    }

    .header-title h3,
    .footer-info h5 {
      color: #7F5539;
    }

    .header-menu-item a,
    .footer-term a {
      color: #9C6644;
      text-decoration: none;
      font-weight: bold;
    }

    .header-menu-item a:hover,
    .footer-term a:hover {
      color: #B08968;
    }

    .header-user-menu-item a {
      color: #7F5539;
    }
  </style>
</head>

<body>
  <div id="container">
  <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    

    <main class="main-container">
      <div class="marginer"></div>
      <div class="content">
        <div class="tap">
          <div class="choice">
            <div class="choices">
              <div class="선택들">
                <a href="/secondlife/member/memberDetail/${member.memberNo}"><p>사용자 정보</p></a>
              </div>
            </div>
            <div class="choices">
              <div class="선택들">
                <a href="/secondlife/member/sellerSell/${member.memberNo}"><p>판매내역</p></a>
              </div>
            </div>
            <div class="choices">

            </div>
            
            <div class="choices">
            </div>
          </div>
        </div>

        <div class="main">
          <div class="빈공간"></div>
          <div class="main-title">
            <p>사용자 정보</p>
          </div>
          <div class="card">
            <div class="card-content">
              <table class="table">
                <tr>
                  <th>닉네임</th>
                  <td>${member.nickname}</td>
                </tr>
                <tr>
                  <th>이메일</th>
                  <td>${member.email }</td>
                </tr>
              </table>
              <img src="/빠끄껀.jpg" alt="" width="180px" height="200px">
            </div>
          </div>
        </div>
      </div>
      <div class="marginer"></div>
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  </div>
</body>

</html>