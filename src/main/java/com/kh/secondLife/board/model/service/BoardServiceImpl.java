package com.kh.secondLife.board.model.service;

import java.util.ArrayList;
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


	@Override
	public int insertLike(Map<String, Object> paramMap) throws Exception {
		
		int result = boardDao.insertLike(paramMap);
		
		return result;
	}


	@Override
	public int tradeClose(Map<String, Object> paramMap) {
		return boardDao.tradeClose(paramMap);
	}

	// 게시물 수정 POST
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateBoard(Board board, List<MultipartFile> upfileList) {

		/* 게시물 글 수정 */
		int result = boardDao.updateBoard(board);
		
		log.debug("글 업데이트 후 거래글 번호 - {}", board.getBoardNo());
		
		if(result == 0) {
			throw new RuntimeException("수정실패");
		}
		/* 게시물 글 수정 끝 */
		
		/* 게시물 첨부파일 수정 */
		
//		if(upfileList != null && !upfileList.isEmpty()) {
//			String webPath = "/resources/images/board/";
//			String serverFolderPath = application.getRealPath(webPath); // c://...
//		
//			for(MultipartFile image : upfileList) {
//				
//				String changeName = Utils.saveFile(image, serverFolderPath);
//				
//				BoardImg bi = new BoardImg();
//				bi.setChangeName(changeName);
//				log.debug("이미지의 원본명 - {}", image.getOriginalFilename());
//				bi.setImgPath(webPath);
//				
//				List<BoardImg> biList = new ArrayList<>();
//				
//				result *= boardDao.updateBoardImg(bi); 
//				
//				biList.add(bi);
//			}
//		
//		}
		
		// 1. MultipartFile[]의 파일들에서 파일명 뽑아서 List에 넣기
	      List<String> newImageNames = new ArrayList<>();
	      for(MultipartFile image : upfileList) {
	         newImageNames.add(image.getOriginalFilename()); // newImageNames => 추가한 첨부파일들 목록
	      }
	      
	      // 2. 기존 게시글의 이미지들 불러오기.
	      List<BoardImg> oldImages = boardDao.selectBoardImg(board.getBoardNo()); // oldImages => 전에 있던 목록
	      
	      // 3. 기존 게시글 이미지 리스트에서 이름만 뽑아서 리스트 만들기
	      List<String> oldImageNames = new ArrayList<>();
	      for(BoardImg image : oldImages) {
	         oldImageNames.add(image.getChangeName()); // 이름을 비교하기위해 기존 changeName으로 추가된 OriginalFilename과 비교
	      }
	      
	      ArrayList<String> tmpArr = new ArrayList<>(); // 기존이미지와 겹치지 않는 추가한 파일만 들어갈 목록
	      
	       tmpArr.addAll(newImageNames);
	       for (String item : oldImageNames) {
	           if (tmpArr.contains(item) == true) {
	               //일치하는 아이템을 지움
	               tmpArr.remove(item);
	           }
	       }
	       // tmpArr은 이제 기존에 없던 이미지명만 남음. -> INSERT 대상
	       
	       
	       ArrayList<String> tmpArr2 = new ArrayList<>(); // 새로운 이미지와 겹치지 않는 지울 목록만 들어갈 목록
	      
	       tmpArr2.addAll(oldImageNames);
	       for (String item : newImageNames) {
	           if (tmpArr2.contains(item) == true) {
	               //일치하는 아이템을 지움
	               tmpArr2.remove(item);
	           }
	       }
	      // tmpArr2는 이제 기존에 있는데 수정 후 없어진 이미지명만 남음. -> UPDATE 대상
	      
	       
	       // INSERT 대상 파일만 골라서 파일 저장 후 각 파일 정보 뽑아서 BoardImg 객체로 만들어서
	       // DB에 저장 요청 보내기
	      List<MultipartFile> newFiles = new ArrayList<>(); // ? 어디에 쓰이는 것인가
	      
	      String webPath = "resources/images/board/";
	      String serverFolderPath = application.getRealPath(webPath);
	      
	      for(MultipartFile file : upfileList) {
	         // upfile에서 기존에 없던 파일명만 tmpArr에 골라담은 상태
	         if(tmpArr.contains(file.getOriginalFilename())) {
	            String changeName = Utils.saveFile(file, serverFolderPath);
	            BoardImg bi = new BoardImg();
	            bi.setBoardNo(board.getBoardNo());
	            bi.setChangeName(changeName);
	            bi.setImgPath(webPath);
	            result *= boardDao.insertBoardImg(bi);
	         }
	      }
	      
	      // tmpArr2에는 삭제 대상 이미지 파일명이 들어있음.
	      // DB에서 파일명인 CHANGE_NAME은 UNIQUE 속성. 즉, 겹칠일 없음
	      // 그러니까 tmpArr2에 들어있는 이름들 하나하나마다 DB에 UPDATE 요청
	      // ↓
	      
	      for(String fileName : tmpArr2) {
	    	  result *= boardDao.updateBoardImg(fileName);
	      }
	      
		return result;
		
	}


}
