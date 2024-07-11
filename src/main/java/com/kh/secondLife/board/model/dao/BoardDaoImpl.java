package com.kh.secondLife.board.model.dao;

import org.springframework.stereotype.Repository;

@Repository
public class BoardDaoImpl implements BoardDao {


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.secondLife.board.model.vo.Board;
import com.kh.secondLife.common.model.vo.PageInfo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BoardDaoImpl implements BoardDao{
	
	private final SqlSession sqlSession;
	
	@Override
	public String selectCategoryName(Map<String, Object> paramMap) {
		
		return sqlSession.selectOne("board.selectCategoryName", paramMap);
	}
	
	@Override
	public int selectListCount(Map<String, Object> paramMap) {
		
		return sqlSession.selectOne("board.selectListCount", paramMap);
	}

	@Override
	public List<Board> selectBoardList(PageInfo pi, Map<String, Object> paramMap) {
		
		// rowBounds 방식 (전체 게시글을 가지고 와서 페이징 처리)
		
		int offset = (pi.getCurrentPage() - 1) * pi.getPageLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return sqlSession.selectList("board.selectBoardList", paramMap, rowBounds);
	}

	@Override
	public Board selectBoard(int boardNo) {
		
		return sqlSession.selectOne("board.selectBoard", boardNo);
	}

	@Override
	public List<Board> selectRecommendBoard(Map<String, Object> paramMap) {
		
		return sqlSession.selectList("board.selectRecommendBoard", paramMap);
	
	}

}
