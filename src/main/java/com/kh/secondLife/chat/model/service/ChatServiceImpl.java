package com.kh.secondLife.chat.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.secondLife.chat.model.dao.ChatDao;
import com.kh.secondLife.chat.model.vo.ChatMessage;
import com.kh.secondLife.chat.model.vo.ChatRoom;
import com.kh.secondLife.chat.model.vo.ChatRoomExt;
import com.kh.secondLife.chat.model.vo.ChatRoomJoin;

@Service
public class ChatServiceImpl implements ChatService {

    @Autowired
    private ChatDao chatDao;

    @Transactional(rollbackFor = {Exception.class})
    @Override
    public int insertChatRoom(ChatRoom chatRoom) {

    	int result = chatDao.insertChatRoom(chatRoom);
    	
    	ChatRoomJoin firstJoin = new ChatRoomJoin();
    	firstJoin.setChatRoomNo(chatRoom.getChatRoomNo());
    	result *= chatDao.joinChatRoom(firstJoin);
    	
    	ChatRoomJoin secondJoin = new ChatRoomJoin();
    	secondJoin.setChatRoomNo(chatRoom.getChatRoomNo());
    	result *= chatDao.joinChatRoom(secondJoin);
    			
    	return result;
    }

    @Override
    public int leaveChatRoom(Map<String, Object> paramMap) {
    	return chatDao.leaveChatRoom(paramMap);
    }

    @Override
    public int countChatRoomMember(int chatRoomNo) {
        return chatDao.countChatRoomMembers(chatRoomNo);
    }

    @Override
    public int deleteChatRoom(int chatRoomNo) {
    	return chatDao.deleteChatRoom(chatRoomNo);
    }

    @Override
    public List<ChatRoomExt> selectMemberChatRoomList(int memberNo) {
        return chatDao.selectMemberChatRoomList(memberNo);
    }

	@Override
	public int insertMessage(ChatMessage chatMessage) {
		return chatDao.insertMessage(chatMessage);
	}

	@Override
	public List<ChatMessage> selectChatMessageList(int chatRoomNo) {
		return chatDao.selectChatMessageList(chatRoomNo);
	}
}