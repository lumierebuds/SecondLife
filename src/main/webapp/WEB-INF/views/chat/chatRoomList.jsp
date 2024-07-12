<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>채팅방 목록</title>
</head>
<body>
    <h1>채팅방 목록</h1>
    <div>
        <form action="/chat/room/create" method="post">
            <input type="text" name="boardNo" placeholder="게시판 번호">
            <input type="text" name="secondMemberNo" placeholder="상대방 번호">
            <input type="text" name="firstMemberNo" placeholder="내 번호">
            <input type="hidden" name="createDate" value="<%= new java.util.Date() %>">
            <input type="hidden" name="status" value="Y">
            <input type="text" name="notice" placeholder="공지사항">
            <button type="submit">채팅방 생성</button>
        </form>
    </div>
    <div>
        <ul>
            <c:forEach var="room" items="${chatRoomList}">
                <li>
                    <a href="/chat/room/${room.chatRoomNo}">채팅방 ${room.chatRoomNo}</a>
                </li>
            </c:forEach>
        </ul>
    </div>
</body>
</html>
