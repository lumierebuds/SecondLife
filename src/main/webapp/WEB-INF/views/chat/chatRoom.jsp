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
            <a href="/secondlife">
                <img class="logoimg" src="../resources/images/defaultImg.png" alt="SecondLife Logo" onclick="mainPage()">
            </a>
            <span class="logoText">Second Life</span>
        </div>
        <div></div>
        <div class="user-profile">
            <button class="rightbtn" onclick="myFunction()">
                <img class="profile-img" src="../resources/images/defaultImg.png" alt="Profile Image">
                <span class="nickname">${loginUser.nickname}</span>
                <div class="nickname-area">
                    <span class="menu-icon">
                        <svg width="12" height="7" viewbox="0 0 12 7" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M1 1L6 6L11 1" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                        </svg>
                    </span>
                </div>
            </button>
            <div id="myDropdown" class="user-profile-content">
                <a href="#chat-alarm" class="chat-alert-toggle" id="chatAlertToggle">채팅켜기 🔔</a>
                <a href="#logout" class="logout-toggle">로그아웃</a>
            </div>
        </div>
    </header>
    <div class="main-content">
        <nav class="sidebar">
            <ul>
                <!-- 채팅방 목록을 foreach 문을 통해 렌더링 -->
                <c:forEach var="chatRoom" items="${chatRoomList}">
                    <li class="nav-item">
                        <div class="chat-room-info">
                            <img class="profile-img" src="../resources/images/defaultImg.png" alt="${loginUser.nickname}">
                            <div class="more-options">
                                <button class="more-options-btn" onclick="toggleDeleteButton(this)">
                                    &#8942; <!-- 미트볼 아이콘 (⋮) -->
                                </button>
                                <button class="delete-btn" style="display: none;" onclick="deleteChatRoom(${chatRoom.chatRoomNo})">삭제</button>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </nav>
        <div class="chat-window">
            <div class="message-collect">
                <div class="empty-box">
                    <svg width="96" height="81" viewBox="0 0 96 81" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M33.0004 0C15.0185 0 0 13.0729 0 29.6567C0 40.358 6.27606 49.642 15.5279 54.8364L13.8397 64.5305C13.7353 65.1299 13.928 65.7446 14.3535 66.1751L14.3573 66.179L14.3724 66.1939C14.3853 66.2066 14.4061 66.2267 14.4326 66.2506C14.4869 66.2995 14.568 66.3668 14.6744 66.435C14.9082 66.5849 15.1569 66.6709 15.3962 66.7073C15.7666 66.7637 16.0661 66.6901 16.1358 66.673L16.1413 66.6716C16.3174 66.6287 16.5003 66.558 16.6232 66.51C16.9302 66.3901 17.5014 66.1524 18.5787 65.6955C20.7218 64.7866 24.9636 62.9696 33.3799 59.3641C51.1931 59.1817 66.0008 46.1763 66.0008 29.7093C66.0008 13.1297 50.987 0 33.0004 0Z"
                            fill="#DCDEE3"></path>
                        <path d="M72.2312 29.4385C72.2312 48.2002 56.7085 62.679 37.8858 64.8408C44.0168 70.067 52.3818 73.2792 61.479 73.3633C70.2216 76.9749 74.6257 78.7941 76.8498 79.7036C77.9674 80.1606 78.5583 80.3977 78.8749 80.517C79.0036 80.5654 79.1863 80.6333 79.3599 80.6741L79.3652 80.6754C79.4339 80.6917 79.7238 80.7604 80.0821 80.7078C80.313 80.6739 80.5564 80.5935 80.7883 80.4501C80.8943 80.3846 80.9756 80.3195 81.0307 80.2717C81.0459 80.2585 81.0593 80.2464 81.0704 80.2362C81.0789 80.2284 81.0861 80.2217 81.0918 80.2163L81.1071 80.2017L81.111 80.1978C81.5557 79.764 81.7577 79.1325 81.6467 78.5179L79.9012 68.8524C89.4699 63.674 96 54.3943 96 43.6557C96 29.1206 84.0984 17.353 68.7254 14.6059C70.9682 19.0808 72.2312 24.0881 72.2312 29.4385Z"
                            fill="#DCDEE3"></path>
                    </svg>
                    <div class="empty-description">채팅할 상대를 선택해주세요.</div>
                </div>
            </div>
            <div class="message-input" style="border: 1px solid">
                <textarea class="chat-message-area" placeholder="메시지를 입력하세요."></textarea>
                <div class="message-option">
                    <label class="option-wrapper">
                        <span class="option-tooltip">사진</span>
                        <svg width="27" height="24" viewBox="0 0 27 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<mask id="mask0_27_1494" style="mask-type:luminance" maskUnits="userSpaceOnUse" x="0" y="0" width="27" height="24">
<path d="M27 0H0V24H27V0Z" fill="white"/>
</mask>
<g mask="url(#mask0_27_1494)">
<path d="M10.125 3H16.875L19.125 5H23.625C24.2463 5 24.75 5.44772 24.75 6V20C24.75 20.5523 24.2463 21 23.625 21H3.375C2.75368 21 2.25 20.5523 2.25 20V6C2.25 5.44772 2.75368 5 3.375 5H7.875L10.125 3ZM13.5 19C17.2279 19 20.25 16.3137 20.25 13C20.25 9.68629 17.2279 7 13.5 7C9.77208 7 6.75 9.68629 6.75 13C6.75 16.3137 9.77208 19 13.5 19ZM13.5 17C11.0147 17 9 15.2091 9 13C9 10.7909 11.0147 9 13.5 9C15.9853 9 18 10.7909 18 13C18 15.2091 15.9853 17 13.5 17Z" fill="#A8A8A8"/>
</g>
</svg>
                        
                        <input type="file" class="file-input" multiple accept="image/png, image/jpeg, image/gif">
                    </label>
                    <span class="text-length">0/1000</span>
                    <button class="send-message-btn" onclick="sendMessage()">전송</button>
                </div>
            </div>
        </div>
    </div>
    <script src="../resources/js/chat.js"></script>
</body>

</html>
