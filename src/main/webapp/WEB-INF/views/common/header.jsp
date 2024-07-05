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
  
  .menu a{
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

  .user-menu-item a{
    color: black;
  }
  
  .user-menu img {
    margin: 10px;
  }
  
  .user-menu a {
    font-weight: 600;
  }
  
  header img {
    height: 40%;
    margin: 0px 20px 3px 0px;
  }
</style>
</head>
<body>

	<header>
            <div class="marginer"></div>
            <div class="header-area">
                <div class="title">
                    <img src="사이트 로고.png" alt="사이트로고">
                    <h3>SecondLife</h3>
                </div>
                <div class="menu">
                    <div class="menu-item">
                        <a href="">거래 장터</a>
                    </div>
                </div>
                <div class="user-menu">
                    <div class="user-menu-item">
                        <img src="세라톡 아이콘.png" alt="사이트로고">
                        <a href="">세라톡</a>
                    </div>
                    <div class="user-menu-item">
                        <img src="로그인 아이콘.png" alt="사이트로고">
                        <a href="">로그인</a>
                    </div>
                </div>
            </div>
            <div class="marginer"></div>
        </header>
	
	
</body>
</html>