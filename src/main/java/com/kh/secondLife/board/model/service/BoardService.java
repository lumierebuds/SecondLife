package com.kh.secondLife.board.model.service;

import com.kh.secondLife.board.model.vo.Board;
import com.kh.secondLife.board.model.vo.BoardImg;

public interface BoardService {

	int insertBoard(Board b, BoardImg bi) throws Exception;

}
