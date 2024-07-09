package com.kh.secondLife.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.secondLife.board.model.dao.BoardDao;
import com.kh.secondLife.board.model.vo.Board;
import com.kh.secondLife.common.model.vo.PageInfo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	private final BoardDao boardDao;

	@Override
	public int selectListCount(Map<String, Object> paramMap) {
		
		return boardDao.selectListCount(paramMap);
	}

	@Override
	public List<Board> selectBoardList(PageInfo pi, Map<String, Object> paramMap) {

		return boardDao.selectBoardList(pi, paramMap);
	}


}
