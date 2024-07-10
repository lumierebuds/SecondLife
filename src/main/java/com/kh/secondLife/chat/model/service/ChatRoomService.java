package com.kh.secondLife.chat.model.service;

import java.util.List;

import com.kh.secondLife.chat.model.vo.ChatRoom;

public interface ChatRoomService {
    List<ChatRoom> getAllChatRooms();
    void createChatRoom(ChatRoom chatRoom);
    void leaveChatRoom(int chatRoomNo, int memberNo);
    boolean isChatRoomEmpty(int chatRoomNo);
    void deleteChatRoom(int chatRoomNo);
}