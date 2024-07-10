package com.kh.secondLife.chat.model.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.secondLife.chat.model.dao.ChatRoomDAO;
import com.kh.secondLife.chat.model.vo.ChatRoom;

@Repository
public class ChatRoomDAOImpl implements ChatRoomDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<ChatRoom> selectAllChatRooms() {
        return sqlSession.selectList("chatMapper.selectAllChatRooms");
    }

    @Override
    public void insertChatRoom(ChatRoom chatRoom) {
        sqlSession.insert("chatMapper.insertChatRoom", chatRoom);
    }

    @Override
    public void deleteChatRoomMember(int chatRoomNo, int memberNo) {
        Map<String, Object> params = new HashMap<>();
        params.put("chatRoomNo", chatRoomNo);
        params.put("memberNo", memberNo);
        sqlSession.delete("chatMapper.deleteChatRoomMember", params);
    }

    @Override
    public int countChatRoomMembers(int chatRoomNo) {
        return sqlSession.selectOne("chatMapper.countChatRoomMembers", chatRoomNo);
    }

    @Override
    public void deleteChatRoom(int chatRoomNo) {
        sqlSession.delete("chatMapper.deleteChatRoom", chatRoomNo);
    }

    @Override
    public List<ChatRoom> selectChatRoomsByMemberNo(int memberNo) {
        return sqlSession.selectList("chatMapper.selectChatRoomsByMemberNo", memberNo);
    }
}