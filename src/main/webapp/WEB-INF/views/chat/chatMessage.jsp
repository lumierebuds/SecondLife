<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>채팅방</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <h1>채팅방</h1>
    <div>
        <ul id="messageList">
            <c:forEach var="message" items="${chatMessageList}">
                <li>${message.message}</li>
            </c:forEach>
        </ul>
    </div>
    <div>
        <input type="hidden" id="chatRoomNo" value="${chatRoomNo}">
        <input type="text" id="messageInput" placeholder="메시지 입력">
        <button id="sendButton">보내기</button>
    </div>
    <script>
        $(document).ready(function() {
            $("#sendButton").click(function() {
                var message = $("#messageInput").val();
                var chatRoomNo = $("#chatRoomNo").val();
                
                $.ajax({
                    url: "/chat/message/send",
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify({
                        message: message,
                        chatRoomNo: chatRoomNo,
                        memberNo: /* 로그인 유저의 번호 */,
                        createDate: new Date(),
                        status: 'Y'
                    }),
                    success: function(response) {
                        if (response === "success") {
                            // 메시지 목록을 다시 로드하거나 새로운 메시지를 목록에 추가
                            $("#messageList").append('<li>' + message + '</li>');
                            $("#messageInput").val('');
                        }
                    }
                });
            });
        });
    </script>
</body>
</html>
