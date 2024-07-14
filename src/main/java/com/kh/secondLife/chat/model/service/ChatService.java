package com.kh.secondLife.chat.model.service;

import java.util.List;

import com.kh.secondLife.chat.model.vo.ChatRoom;

public interface ChatService {

	List<ChatRoom> selectChatRoomList();
    void createChatRoom(ChatRoom chatRoom);
    void leaveChatRoom(int chatRoomNo, int memberNo);
    boolean isChatRoomEmpty(int chatRoomNo);
    void deleteChatRoom(int chatRoomNo);
    List<ChatRoom> getChatRoomsByMemberNo(int memberNo);  // 추가된 메서드
	
}
