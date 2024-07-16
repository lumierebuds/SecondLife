package com.kh.secondLife.board.model.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kh.secondLife.board.model.vo.Board;
import com.kh.secondLife.board.model.vo.BoardImg;
import com.kh.secondLife.common.model.vo.PageInfo;

@Repository
public interface BoardDao {

	int insertBoard(Board b);

	int insertBoardImg(BoardImg bi);

	int selectListCount(Map<String, Object> paramMap);

	List<Board> selectBoardList(PageInfo pi, Map<String, Object> paramMap);

	String selectCategoryName(Map<String, Object> paramMap);

	Board selectBoard(int boardNo);

	List<Board> selectRecommendBoard(Map<String, Object> paramMap);

	int selectBoardFavCount(int boardNo);

	Map<String, Integer> getSalesCount(int boardWriter);

	int getReviewCount(int boardWriter);

	List<Board> selectSellorBoard(Map<String, Object> paramMap);

	int increateCount(int boardNo);
  
	int selectBoardListCount(Map<String, Object> paramMap);


	boolean deleteBoardByNo(int boardNo);

	int insertLike(Map<String, Object> paramMap);

	int deleteBoard(Map<String, Object> paramMap);
	

}
