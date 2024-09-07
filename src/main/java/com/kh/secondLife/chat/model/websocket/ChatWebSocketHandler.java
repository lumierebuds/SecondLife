package com.kh.secondLife.chat.model.websocket;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.secondLife.chat.model.service.ChatService;
import com.kh.secondLife.chat.model.vo.ChatMessage;

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
//        log.info("session ?? {}", session.getId());
    	sessions.add(session);
    }
    
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessions.remove(session);
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	
		// 전달받은 메세지는 JSON 형태.
    	ObjectMapper objectMapper = new ObjectMapper();
    	ChatMessage chatMessage = objectMapper.readValue(message.getPayload(), ChatMessage.class);
    	
    	// 메세지 DB에 추가
    	int result = chatService.insertMessage(chatMessage);
    	
    	// 성공적으로 저장 시 같은 채팅방의 사용자들에게 전송
    	if(result > 0) {
    		for (WebSocketSession s : sessions) {
    			int chatRoomNo = 0;
    			try {
    				chatRoomNo = (int) s.getAttributes().get("chatRoomNo");    				
    			} catch (NullPointerException ne) {
					log.error("Session : NullPointerException Occurred");
					return;
				} catch (Exception e) {
    				e.printStackTrace();
    				return;
    			}
				
				// 각 세션의 채팅방 번호와 전달받은 메세지의 채팅방 번호 비교
				if(chatRoomNo == chatMessage.getChatRoomNo()) {
					s.sendMessage(new TextMessage(objectMapper.writeValueAsString(chatMessage)));
				}
            }
    	}
    }
}
