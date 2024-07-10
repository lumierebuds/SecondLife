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
	public List<Member> selectMemberAll() {
		return sqlSession.selectList("admin.selectMemberAll");
	}

	@Override
	public List<Board> selectBoardList(PageInfo pi, Map<String, Object> paramMap) {
		
		// rowBounds 방식 (전체 게시글을 가지고 와서 페이징 처리)

		int offset = (pi.getCurrentPage() - 1) * pi.getPageLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return sqlSession.selectList("admin.selectBoardList", paramMap);
	}



}
