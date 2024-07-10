package com.kh.secondLife.board.model.dao;

import java.util.List;

import com.kh.secondLife.board.model.vo.Board;
import com.kh.secondLife.board.model.vo.BoardImg;

public interface BoardDao {

	int insertBoard(Board b);

	int insertBoardImg(BoardImg bi);

}
