<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>세컨드 라이프 - secondLife</title>
    <link rel="stylesheet" href="../resources/css/chat/chatRoom.css">
</head>

<body>
   
    <header>
        <div class="secondlifeLogo-url">
            <a href="https://secondlife.com">
                <img src="../resources/images/secondLifeLogo.png" alt="SecondLife Logo" onclick="mainPage()">세컨드라이프
            </a>
        </div>
        <div></div>
        <div class="user-profile">
            <button class="rightbtn" onclick="myFunction()">
                
                <img class="profile-img" src="../resources/images/default_png.png" alt="${loginUser.nickname}">
                <div class="nickname-area">
                    <span class="menu-icon">
                        <svg width="12" height="7" viewbox="0 0 12 7" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M1 1L6 6L11 1" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"
                                stroke-linejoin="round"></path>
                        </svg>
                    </span>
                </div>
            </button>
            <div id="myDropdown" class="user-profile-content">
                <a href="#chat-alarm" class="chat-alert-toggle" id="chatAlertToggle">채팅켜기   🔔</a>
                <a href="#logout">로그아웃</a>                    
            </div>
        </div>
    </header>
    <div class="main-content">
        <nav class="sidebar">
            <ul>
                <li class="nav-item"><span class="nav-icon"></span>${loginUser.nickname}</li>
                <li class="nav-item active"><span class="nav-icon"></span>${loginUser.nickname}</li>
                <li class="nav-item"><span class="nav-icon"></span>${loginUser.nickname}</li>
            </ul>
        </nav>
        <div class="chat-window">
            <div class="message-collect">
                <!-- 메시지 내용들 -->
                <div class="message received">
                    <span class="message-icon">🐻</span>
                    <span class="message-text"></span>
                </div>
                <!-- 추가 메시지들... -->
                <div class="message sent">
                    <span class="message-text">아직 판매중입니다.</span>
                </div>
                <div class="message received">
                    <span class="message-icon">🐻</span>
                    <span class="message-text"></span>
                </div>
            </div>
            <div class="message-input" style="border: 1px solid">
                <textarea class="chat-message-area" placeholder="메시지를 입력하세요."></textarea>
                <div class="message-option">
                    <label class="option-wrapper">
                        <span class="option-tooltip">
                            📎
                        </span>
                        <input type="file" multiple accept="image/png, image/jpeg, image/gif">                       
                    </label>
                    <span class="text-length">0/1000</span>
                    <button type="submit">전송</button>
                </div>
            </div>
        </div>
    </div>
    </div>
    <script src="../resources/js/chat.js"></script>

    <script>
    function myFunction() {
        document.getElementById("myDropdown").classList.toggle("show");
      }
      
      // Close the dropdown if the user clicks outside of it
      window.onclick = function (event) {
        if (!event.target.matches('.rightbtn')) {
          var dropdowns = document.getElementsByClassName("user-profile-content");
          var i;
          for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
              openDropdown.classList.remove('show');
            }
          }
        }
      }
      
      const chatAlertToggle = document.getElementById('chatAlertToggle');
      let alertOn = true;
      
      chatAlertToggle.addEventListener('click', () => {
          alertOn = !alertOn;
          if (alertOn) {
              chatAlertToggle.textContent = '채팅 켜기 🔔';
              chatAlertToggle.classList.remove('active');
          } else {
              chatAlertToggle.textContent = '채팅 끄기 🔕';
              chatAlertToggle.classList.add('active');
          }
      });
      
      const fileInput = document.querySelector('.option-wrapper input[type="file"]');
      fileInput.addEventListener('change', (event) => {
          const fileName = event.target.files[0]?.name;
          if (fileName) {
              alert(`선택된 파일: ${fileName}`);
          }
      });
    </script>
</body>

</html>
