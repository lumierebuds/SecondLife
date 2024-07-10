package com.kh.secondLife.chat.model.dao;

import java.util.List;

import com.kh.secondLife.chat.model.vo.ChatRoom;

public interface ChatRoomDAO {
    List<ChatRoom> selectAllChatRooms();
    void insertChatRoom(ChatRoom chatRoom);
    void deleteChatRoomMember(int chatRoomNo, int memberNo);
    int countChatRoomMembers(int chatRoomNo);
    void deleteChatRoom(int chatRoomNo);
}