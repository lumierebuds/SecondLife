package com.kh.secondLife.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.secondLife.board.model.vo.Board;
import com.kh.secondLife.board.model.vo.BoardImg;
import com.kh.secondLife.common.model.vo.PageInfo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BoardDaoImpl implements BoardDao{
	
	private final SqlSession sqlSession;
	
	@Override
	public int insertBoard(Board b) {
		return sqlSession.insert("board.insertBoard", b);
	}

	@Override
	public int insertBoardImg(BoardImg bi) {
		return sqlSession.insert("board.insertBoardImg", bi);
	}

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

	@Override
	public int selectBoardFavCount(int boardNo) {
		
		return sqlSession.selectOne("board.selectBoardFavCount",boardNo);
	}


	@Override
	public Map<String, Integer> getSalesCount(int boardWriter) {
		
		return sqlSession.selectOne("board.getSalesCount", boardWriter);
	}

	@Override
	public int getReviewCount(int boardWriter) {
		
		return sqlSession.selectOne("board.getReviewCount", boardWriter);
	}

	@Override
	public List<Board> selectSellorBoard(Map<String, Object> paramMap) {
		
		return sqlSession.selectList("board.selectSellorBoard", paramMap);
	}
	
	@Override
	public int selectBoardListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("board.selectBoardListCount", paramMap);
	}

	@Override
	public boolean deleteBoardByNo(int boardNo) {
		int result = sqlSession.delete("board.deleteBoardByNo", boardNo);
        return result > 0;
	}
	
	

	@Override
	public int increateCount(int boardNo) {
		
		return sqlSession.update("board.increaseCount", boardNo);
	}

}
