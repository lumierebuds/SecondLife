package com.kh.secondLife.chat.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.secondLife.chat.model.dao.ChatDao;
import com.kh.secondLife.chat.model.vo.ChatRoom;

@Service
public class ChatServiceImpl implements ChatService {

    @Autowired
    private ChatDao chatDAO;

    @Override
    public List<ChatRoom> selectChatRoomList() {
        return chatDAO.selectAllChatRooms();
    }

    @Override
    public void createChatRoom(ChatRoom chatRoom) {
    	chatDAO.insertChatRoom(chatRoom);
    }

    @Override
    public void leaveChatRoom(int chatRoomNo, int memberNo) {
    	chatDAO.deleteChatRoomMember(chatRoomNo, memberNo);
    }

    @Override
    public boolean isChatRoomEmpty(int chatRoomNo) {
        int memberCount = chatDAO.countChatRoomMembers(chatRoomNo);
        return memberCount == 0;
    }

    @Override
    public void deleteChatRoom(int chatRoomNo) {
    	chatDAO.deleteChatRoom(chatRoomNo);
    }

    @Override
    public List<ChatRoom> getChatRoomsByMemberNo(int memberNo) {
        return chatDAO.selectChatRoomsByMemberNo(memberNo);
    }
}