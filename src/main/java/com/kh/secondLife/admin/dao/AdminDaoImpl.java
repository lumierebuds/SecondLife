package com.kh.secondLife.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.secondLife.board.model.vo.Board;
import com.kh.secondLife.common.model.vo.PageInfo;
import com.kh.secondLife.member.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member login(Member m) {
		return sqlSession.selectOne( "admin.adminLogin" , m );
	}

	@Override
	public List<Board> selectManageBoardList(PageInfo pi, Map<String, Object> paramMap) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getPageLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return sqlSession.selectList("admin.selectManageBoardList", paramMap, rowBounds);
	}

	@Override
	public List<Member> selectMemberAll(PageInfo pi, Map<String, Object> paramMap) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getPageLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("admin.selectMemberAll", paramMap, rowBounds);
	}
	
	// 게시글 수 가져오는.
	@Override
	public int selectMemberAllCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("admin.selectMemberAllCount", paramMap);
	}



}
