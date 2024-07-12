package com.kh.secondLife.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.secondLife.member.model.vo.Member;
import com.kh.secondLife.member.model.vo.Review;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member login(Member m) {
		return sqlSession.selectOne( "member.login" , m );
	}

	@Override
	public int insertMember(Member m) {
		return sqlSession.insert("member.insertMember", m);
	}

	@Override
	public int updateMember(Member m) {
		return sqlSession.update("member.updateMember", m);
	}

	@Override
	public int idCheck(String id) {
		return sqlSession.selectOne("member.idCheck", id);
	}
	
	@Override
    public int deleteMember(String id) {
        return sqlSession.update("member.deleteMember", id);
    }

	@Override
	public String findIdByEmail(String email) {
		return sqlSession.selectOne("member.findIdByEmail", email);
	}

	@Override
	public String getMemberById(String id) {
		return sqlSession.selectOne("member.getMemberById" ,id);
	}
	
	// 게시글 상세조회시 판매자 정보 조회
	@Override
	public Member selectMemberInfo(int boardWriter) {
		return sqlSession.selectOne("member.selectMemberInfo", boardWriter);
	}
	
	@Override
	public int insertReview(Review review) {
		return sqlSession.insert("review.insertReview", review);
	}
	
}
