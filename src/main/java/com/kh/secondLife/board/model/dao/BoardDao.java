package com.kh.secondLife.board.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.secondLife.board.model.vo.Board;
import com.kh.secondLife.common.model.vo.PageInfo;

@Repository
public interface BoardDao {

	int selectListCount();

	List<Board> selectBoardList(PageInfo pi);

}
