package com.kh.secondLife.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kh.secondLife.chat.model.vo.ChatMessage;
import com.kh.secondLife.chat.model.vo.ChatRoom;
import com.kh.secondLife.chat.model.vo.ChatRoomExt;
import com.kh.secondLife.chat.model.vo.ChatRoomJoin;

@Mapper
public interface ChatDao {
    List<ChatRoom> selectAllChatRooms();
    int insertChatRoom(ChatRoom chatRoom);
    int joinChatRoom(ChatRoomJoin chatRoomJoin);
    int leaveChatRoom(Map<String, Object> paramMap);
    int countChatRoomMembers(int chatRoomNo);
    int deleteChatRoom(int chatRoomNo);
    List<ChatRoomExt> selectMemberChatRoomList(int memberNo);  // 추가된 메서드
	int insertMessage(ChatMessage chatMessage);
	List<ChatMessage> selectChatMessageList(int chatRoomNo);
}