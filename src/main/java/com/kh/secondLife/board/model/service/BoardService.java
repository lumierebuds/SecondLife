package com.kh.secondLife.board.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.secondLife.board.model.vo.Board;
import com.kh.secondLife.common.model.vo.PageInfo;

@Service
public interface BoardService {

	int selectListCount();

	List<Board> selectBoardList(PageInfo pi);

}
