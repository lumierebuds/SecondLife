package com.kh.secondLife.chat.model.service;

import java.util.List;
import java.util.Map;

import com.kh.secondLife.chat.model.vo.ChatMessage;
import com.kh.secondLife.chat.model.vo.ChatRoom;
import com.kh.secondLife.chat.model.vo.ChatRoomExt;

public interface ChatService {

    int insertChatRoom(ChatRoom chatRoom) throws Exception;
    int leaveChatRoom(Map<String, Object> paramMap);
    int countChatRoomMember(int chatRoomNo);
    int deleteChatRoom(int chatRoomNo);
    List<ChatRoomExt> selectMemberChatRoomList(int memberNo);  // 추가된 메서드
	int insertMessage(ChatMessage chatMessage);
	List<ChatMessage> selectChatMessageList(int chatRoomNo);
}
