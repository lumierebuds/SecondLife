package com.kh.secondLife.board.model.service;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.secondLife.board.model.vo.Board;
import com.kh.secondLife.board.model.vo.BoardImg;
import com.kh.secondLife.common.model.vo.PageInfo;

@Service
public interface BoardService {

	int insertBoard(Board b, List<BoardImg> bi) throws Exception;

	int selectListCount(Map<String, Object> paramMap);

	List<Board> selectBoardList(PageInfo pi, Map<String, Object> paramMap);

	String selectCategoryName(Map<String, Object> paramMap);

	Board selectBoard(int boardNo);

	List<Board> selectRecommendBoard(Map<String, Object> paramMap);

	int selectBoardFavCount(int boardNo);

	Map<String, Integer> getSalesCount(int boardWriter);

	int getReviewCount(int boardWriter);

	int selectBoardListCount(Map<String, Object> paramMap);
	
}
