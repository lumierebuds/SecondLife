package com.kh.secondLife.board.model.service;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.secondLife.board.model.dao.BoardDao;
import com.kh.secondLife.board.model.vo.Board;
import com.kh.secondLife.board.model.vo.BoardImg;
import com.kh.secondLife.common.Utils;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j // 로그출력하는 어노테이션
@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

	private final BoardDao boardDao;

	private final ServletContext application;
	
	@Override
	@Transactional(rollbackFor = {Exception.class}) // 어떤 예외든 발생시 rollback처리
	public int insertBoard(Board b, BoardImg bi) throws Exception {
		// 0) 게시글 삽입전 , xss파싱처리 , 개행처리 수행
				String productName = b.getProductName();
				String content = b.getContent();
				productName = Utils.XSSHandling(productName);
				content = Utils.XSSHandling(content);
				content = Utils.newLineHandling(content);
				b.setProductName(productName);
				b.setContent(content);
				
				// 1) INSERT BOARD 후
				int result = boardDao.insertBoard(b); // 수행완료시 b에는 boardNo저장 -> selectKey확인
				
				int boardNo = b.getBoardNo();
				// 2) INSERT BOARD_IMG -> bi != null 등록
				if(bi != null) {
					bi.setBoardImgNo(boardNo);
					result *= boardDao.insertBoardImg(bi); // (메모) result가 둘중 하나라도 0이면 0이나오게 곱하기( ex)0x1=0 )
				}
				
				if(result == 0) {
					throw new Exception("예외 발생");
				}
				
				// 1-2)의 수행결과는 항상 동일하게 처리해야함
				// 처리결과값 반환
				return result;
	}

}
