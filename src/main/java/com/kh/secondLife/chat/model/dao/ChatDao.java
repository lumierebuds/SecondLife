package com.kh.secondLife.chat.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.secondLife.chat.model.vo.ChatRoom;

@Mapper
public interface ChatDao {
    List<ChatRoom> selectAllChatRooms();
    void insertChatRoom(ChatRoom chatRoom);
    void deleteChatRoomMember(int chatRoomNo, int memberNo);
    int countChatRoomMembers(int chatRoomNo);
    void deleteChatRoom(int chatRoomNo);
    List<ChatRoom> selectChatRoomList(int memberNo);  // 추가된 메서드
}