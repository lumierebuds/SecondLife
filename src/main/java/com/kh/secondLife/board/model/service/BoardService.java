package com.kh.secondLife.board.model.service;

import java.util.List;

import com.kh.secondLife.board.model.vo.Board;
import com.kh.secondLife.board.model.vo.BoardImg;

public interface BoardService {

	int insertBoard(Board b, List<BoardImg> bi) throws Exception;

}
