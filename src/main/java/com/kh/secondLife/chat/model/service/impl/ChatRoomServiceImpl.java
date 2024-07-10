package com.kh.secondLife.chat.model.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.secondLife.chat.model.dao.ChatRoomDAO;
import com.kh.secondLife.chat.model.service.ChatRoomService;
import com.kh.secondLife.chat.model.vo.ChatRoom;

@Service
public class ChatRoomServiceImpl implements ChatRoomService {

    @Autowired
    private ChatRoomDAO chatRoomDAO;

    @Override
    public List<ChatRoom> getAllChatRooms() {
        return chatRoomDAO.selectAllChatRooms();
    }

    @Override
    public void createChatRoom(ChatRoom chatRoom) {
        chatRoomDAO.insertChatRoom(chatRoom);
    }

    @Override
    public void leaveChatRoom(int chatRoomNo, int memberNo) {
        chatRoomDAO.deleteChatRoomMember(chatRoomNo, memberNo);
    }

    @Override
    public boolean isChatRoomEmpty(int chatRoomNo) {
        int memberCount = chatRoomDAO.countChatRoomMembers(chatRoomNo);
        return memberCount == 0;
    }

    @Override
    public void deleteChatRoom(int chatRoomNo) {
        chatRoomDAO.deleteChatRoom(chatRoomNo);
    }
}