package com.kh.secondLife.chat.model.websocket;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.secondLife.chat.model.service.ChatService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@RequiredArgsConstructor
public class ChatWebSocketHandler extends TextWebSocketHandler {

    private final Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());

    private final ChatService chatService;
    
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        log.info("session ?? {}", session.getId());
    	sessions.add(session);
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	// 업무로직
    	// 1) 전달받은 메세지를 ChatMessage 테이블에 추가
    	// 2) 서버에서 세션에 접속 중인 상대 사용자에게 메세지 전달
    	//	  - 상대 사용자 memberNo 얻어서 해당 사용자에게 전송(그걸 받아서 화면에 출력하는 건 따로 해야함)
    	
    	// 0) 전달받은 메세지는 JSON 형태.
    	
        for (WebSocketSession webSocketSession : sessions) {
            webSocketSession.sendMessage(message);
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessions.remove(session);
    }
}
