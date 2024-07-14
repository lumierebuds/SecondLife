package com.kh.secondLife.board.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.secondLife.board.model.dao.BoardDao;
import com.kh.secondLife.board.model.vo.Board;
import com.kh.secondLife.board.model.vo.BoardImg;
import com.kh.secondLife.common.Utils;
import com.kh.secondLife.common.model.vo.PageInfo;

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
	public int insertBoard(Board b, List<BoardImg> biList) throws Exception {
		// 0) 전달된 이미지가 없다면 저장처리 거부
		if(biList.size() <= 0) {
			throw new Exception("이미지가 없습니다.");
		}
		
		// 1) 게시글 삽입전 , xss파싱처리 , 개행처리 수행
		String productName = b.getProductName();
		String content = b.getContent();
		productName = Utils.XSSHandling(productName);
		content = Utils.XSSHandling(content);
		content = Utils.newLineHandling(content);
		b.setProductName(productName);
		b.setContent(content);
		
		// 2) INSERT BOARD 후
		int result = boardDao.insertBoard(b); // 수행완료시 b에는 boardNo저장 -> selectKey확인
		log.debug("boardDao.insertBoard 실행 완료");
		
		int boardNo = b.getBoardNo();
		// 3) INSERT BOARD_IMG -> bi != null 등록
		for(BoardImg bi : biList) {
			bi.setBoardNo(boardNo);
			log.debug("작업 직전 이미지 - {}", bi);
			result *= boardDao.insertBoardImg(bi); // (메모) result가 둘중 하나라도 0이면 0이나오게 곱하기( ex)0x1=0 )
		}
		
		// 만일 거래글 등록이나, 거래글 이미지 저장 중
		// 하나라도 실패하면 강제 에러 발생 시켜서 @Transactional에서 롤백하게 함
		if (result == 0) {
			throw new Exception();
		}
		
		// 1-2)의 수행결과는 항상 동일하게 처리해야함
		// 처리결과값 반환
		return result;
	}


	@Override
	public String selectCategoryName(Map<String, Object> paramMap) {
		
		return boardDao.selectCategoryName(paramMap);
	}
	
	@Override
	public int selectListCount(Map<String, Object> paramMap) {
		
		return boardDao.selectListCount(paramMap);
	}

	
	@Override
	public List<Board> selectBoardList(PageInfo pi, Map<String, Object> paramMap) {

		return boardDao.selectBoardList(pi, paramMap);
	}

	@Override
	public Board selectBoard(int boardNo) {
		
		return boardDao.selectBoard(boardNo);
	}

	@Override
	public List<Board> selectRecommendBoard(Map<String, Object> paramMap) {
		
		return boardDao.selectRecommendBoard(paramMap);
	}

	@Override
	public int selectBoardFavCount(int boardNo) {
		
		return boardDao.selectBoardFavCount(boardNo);
	}

	@Override
	public Map<String, Integer> getSalesCount(int boardWriter) {
		
		return boardDao.getSalesCount(boardWriter);
	}

	@Override
	public int getReviewCount(int boardWriter) {
		
		return boardDao.getReviewCount(boardWriter);
	}

	@Override
	public List<Board> selectSellorBoard(Map<String, Object> paramMap) {
		
		return boardDao.selectSellorBoard(paramMap);
	}


	@Override
	public int increaseCount(int boardNo) {
		
		return boardDao.increaseCount(boardNo);
	}

	@Override
	public int selectBoardListCount(Map<String, Object> paramMap) {
		return boardDao.selectBoardListCount(paramMap);
	}

	// 게시물 수정 POST
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateBoard(Board board, List<MultipartFile> upfileList, int boardImgNo, String deleteList) {

		int result = boardDao.updateBoard(board);
		
		if(result == 0) {
			throw new RuntimeException("수정실패");
		}
		
		BoardImg bi = new BoardImg();
		String webPath = "/resources/images/board/N/";
		String serverFolderPath = application.getRealPath(webPath); // c://...
		
		log.debug("board {}", board);
		log.debug("upfile {}", upfile.isEmpty());
		log.debug("boardImgNo {}", boardImgNo);
		log.debug("deleteList {}", deleteList);
		
		// 사진이 없던곳에서 새롭게 추가된경우 -> INSERT
		if(boardImgNo == 0 && upfile != null && !upfile.isEmpty()) {
			bi.setRefBno(board.getBoardNo());
			bi.setImgLevel(0);
			
			String changeName = Utils.saveFile(upfile, serverFolderPath );
			bi.setChangeName(changeName);
			bi.setOriginName(upfile.getOriginalFilename());
			
			result *= boardDao.insertBoardImg(bi);
		}
		
		// 사진이 있던곳에서 새롭게 추가된경우 -> UPDATE
		else if(boardImgNo != 0 && upfile != null && !upfile.isEmpty()) {
			bi.setBoardImgNo(boardImgNo);
			
			String changeName = Utils.saveFile(upfile, serverFolderPath );
			bi.setChangeName(changeName);
			bi.setOriginName(upfile.getOriginalFilename());
			
			result *= boardDao.updateBoardImg(bi); 
		}
		
		// 사진이 있던곳에서 삭제가 된경우 -> DELETE
		else if(boardImgNo != 0 && upfile.isEmpty() && !deleteList.equals("")) {
			result *= boardDao.deleteBoardImg(deleteList);
			// 웹서버의 파일시스템 안에 있는 첨부파일도 삭제 해줘야함. (지금은 생략)
		}
		
		return result;
		
	}


}
