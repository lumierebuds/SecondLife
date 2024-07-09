<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Second Life - 상품의 새 삶</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/signup.css">
</head>
<body>
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

</html>