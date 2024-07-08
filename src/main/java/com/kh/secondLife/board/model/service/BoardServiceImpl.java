package com.kh.secondLife.board.model.service;

import java.util.List;

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
	public int selectListCount() {
		
		return boardDao.selectListCount();
	}

	@Override
	public List<Board> selectBoardList(PageInfo pi) {

		return boardDao.selectBoardList(pi);
	}
}
