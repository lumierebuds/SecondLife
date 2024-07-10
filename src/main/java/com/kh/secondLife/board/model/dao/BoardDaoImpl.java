package com.kh.secondLife.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.secondLife.board.model.vo.Board;
import com.kh.secondLife.board.model.vo.BoardImg;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BoardDaoImpl implements BoardDao {

	private final SqlSession sqlSession;
	
	@Override
	public int insertBoard(Board b) {
		return sqlSession.insert("board.insertBoard", b);
	}

	@Override
	public int insertBoardImg(BoardImg bi) {
		return sqlSession.insert("board.insertBoardImg", bi);
	}

}
