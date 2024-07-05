<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Second Life - 상품의 새 삶</title>
</head>
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

.container > div:nth-of-type(1) {
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

.form-group input[type="text"],
.form-group input[type="password"],
.form-group select,
.form-group input[type="file"],
.form-group textarea,
.form-group input[type="email"] {
    
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    width: 270px;
    max-width: 100%; 
}

.form-group input[name="id"]{
    width: 340px;
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

.duplicate-check {
    padding: 8px 12px;
    background-color: #DDB892;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    white-space: nowrap;
    margin-left: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

.file-select{
    padding: 8px 12px;
    background-color: #DDB892;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    white-space: nowrap;
    margin-left: 10px;
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
    color: white;
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
    background-color: #DDB892;
    color: white;
    cursor: pointer;
    margin: 0 5px;
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
    margin-right: 85px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

form {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    padding: 0 20px;
}



</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
    <div id="container">
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

        <main class="centered-content">
            <div class="marginer"></div>
            <div class="content">

                <div class="container">
                <div><h2>회원가입</h2></div>
                <div class="form-container">
                    <form name="bodyform">
                        <div class="form-group">
                            <label for="id">*아이디</label>
                            <input type="text" id="id" name="id" placeholder="아이디 입력(6~20자)" required />
                            <button type="button" class="duplicate-check">아이디 중복체크</button>
                        </div>
                        <div class="form-group">
                            <label for="nickname">*닉네임</label>
                            <input type="text" id="nickname" name="nickname" placeholder="사용하실 닉네임을 입력해주세요" required />
                        </div>
                        <div class="form-group">
                            <label for="password">*비밀번호</label>
                            <input type="password" id="password" name="password" placeholder="비밀번호 입력(문자,숫자,특수문자 포함 8~20자)" required />
                        </div>
                        <div class="form-group">
                            <label for="confirm-password">*비밀번호 확인</label>
                            <input type="password" id="confirm-password" name="confirm-password" placeholder="비밀번호 재입력" required />
                        </div>
                        <div class="form-group">
                            <label for="name">*이름</label>
                            <input type="text" id="name" name="name" placeholder="이름을 입력해주세요" required />
                        </div>
                        <div class="form-group">
                            <label for="address">주소</label>
                            <input type="text" id="address" name="address">
                        </div>
                        <div class="form-group">
                            <label for="phone">*전화번호</label>
                            <input type="text" id="phone" name="phone" placeholder='휴대폰번호 입력("-"제외 11자리 입력)' required />
                        </div>
                        <div class="form-group email-group">
                            <label for="email">*이메일</label>
                            <input type="text" id="email" name="email" placeholder="이메일주소" required />
                            <span>@</span>
                            <select id="email-domain" name="email-domain">
                                <option value="naver.com">naver.com</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="daum.net">daum.net</option>
                                <option value="nate.com">nate.com</option>
                            </select>
                        </div>
                        <div class="form-group file-group">
                            <label for="profile-pic">프로필 사진</label>
                            <div class="file-input-container">
                                <input type="text" id="profile-pic" name="profile-pic" class="profile-pic-input">
                                <button type="button" class="file-select">파일 선택</button>
                            </div>
                        </div>
    
                        <div class="checkbox-container center">
                            <label for="agree-terms">
                                <input type="checkbox" id="agree-terms" name="agree-terms">
                                <span>개인정보 이용약관 동의(필수)</span>
                            </label>
                        </div>
    
                        <div class="checkbox-container center">
                            <label for="agree-email">
                                <input type="checkbox" id="agree-email" name="agree-email">
                                <span>이메일 수신 동의(선택)</span>
                            </label>
                        </div>
    
                        <div class="button-group">
                            <button type="submit">가입하기</button>
                            <button type="reset">취소</button>
                        </div>
                    </form>
                </div>

            </div>

            </div>
            <div class="marginer"></div>
        </main>
        
        
        <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    </div>

</html>
