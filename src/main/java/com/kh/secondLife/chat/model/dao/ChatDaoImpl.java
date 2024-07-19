package com.kh.secondLife.chat.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.secondLife.chat.model.vo.ChatMessage;
import com.kh.secondLife.chat.model.vo.ChatRoom;
import com.kh.secondLife.chat.model.vo.ChatRoomExt;
import com.kh.secondLife.chat.model.vo.ChatRoomJoin;

@Repository
public class ChatDaoImpl implements ChatDao {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<ChatRoom> selectAllChatRooms() {
        return sqlSession.selectList("chat.selectAllChatRooms");
    }

    @Override
    public int insertChatRoom(ChatRoom chatRoom) {
        return sqlSession.insert("chat.insertChatRoom", chatRoom);
    }
    
    @Override
	public int joinChatRoom(ChatRoomJoin chatRoomJoin) {
		return sqlSession.insert("chat.joinChatRoom", chatRoomJoin);
	}

    @Override
    public int leaveChatRoom(Map<String, Object> paramMap) {
        return sqlSession.delete("chat.leaveChatRoom", paramMap);
    }

    @Override
    public int countChatRoomMembers(int chatRoomNo) {
        return sqlSession.selectOne("chat.countChatRoomMembers", chatRoomNo);
    }

    @Override
    public int deleteChatRoom(int chatRoomNo) {
        return sqlSession.update("chat.deleteChatRoom", chatRoomNo);
    }

    @Override
    public List<ChatRoomExt> selectMemberChatRoomList(int memberNo) {
        return sqlSession.selectList("chat.selectMemberChatRoomList", memberNo);
    }

	@Override
	public int insertMessage(ChatMessage chatMessage) {
		return sqlSession.insert("chat.insertMessage", chatMessage);
	}

	@Override
	public List<ChatMessage> selectChatMessageList(int chatRoomNo) {
		return sqlSession.selectList("chat.selectChatMessageList", chatRoomNo);
	}

}