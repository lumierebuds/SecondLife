package com.kh.secondLife.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.kh.secondLife.board.model.service.BoardService;
import com.kh.secondLife.board.model.vo.Board;
import com.kh.secondLife.board.model.vo.BoardImg;
import com.kh.secondLife.common.Pagenation;

import com.kh.secondLife.common.Utils;
import com.kh.secondLife.common.model.vo.PageInfo;

import com.kh.secondLife.member.model.service.MemberService;
import com.kh.secondLife.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;





@Controller // 이게 있어야 bean객체로 등록
@Slf4j
@SessionAttributes( {"loginUser"} )
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {
	
	private final ServletContext application;
	private final BoardService boardService;
	private final MemberService memberService;
	
	// 게시글 목록 페이지
	@GetMapping("/list")
	public String listBoard(
			@RequestParam(value="pageNo", defaultValue="1") int pageNo,
			@RequestParam Map<String, Object> paramMap,
			Model model
			) {
		
		// (카테고리) 카테고리로 검색할시에 카테고리 이름을 가져와서 뷰에 넘겨주기
		String categoryName = boardService.selectCategoryName(paramMap);
		
		// 1. 전체 게시글 수 조회(페이징 처리)
		int listCount = boardService.selectListCount(paramMap);
		int pageLimit = 10; // 웹 페이지에서 보여지는 페이징바의 개수 
		int boardLimit = 30; // 게시글의 개수 
		
		PageInfo pi = Pagenation.getPageInfo(listCount, pageNo, pageLimit, boardLimit);
		
		// 2. 페이징 처리를 해서 한 페이지에 필요한 게시글만 조회 (최대 30개) 
		List<Board> list= boardService.selectBoardList(pi, paramMap);
		
		model.addAttribute("list",list); // 조회된 게시글 목록
		model.addAttribute("listCount", listCount); // 전체 게시글의 게수  
		model.addAttribute("pi", pi); // 페이지 정보를 담은 페이지 객체 
		model.addAttribute("categoryName", categoryName);
		
		// 3. 현재 페이지에 따라 페이징 바의 색깔을 갈색으로 칠해준다.
		
		return "board/boardListView";
	}
	
	/*------------------------------게시글 등록/수정------------------------------*/
	// 게시글 등록 페이지
	@GetMapping("/insert")
	public String enrollBoard() {
		return "board/boardEnrollForm";
	}
	
	// 게시글 등록 페이지 -> 게시글 등록 버튼 눌렀을 때
	@ResponseBody
	@PostMapping("/insert")
	public Map<String, Object> insertBoard(
			Board b ,
			@ModelAttribute("loginUser") Member loginUser,
			Model model , // errorMsg
			RedirectAttributes ra, // alertMsg
			//첨부파일
			@RequestParam(value="upfile[]", required=false) MultipartFile[] upfile // 항상 객체 생성
			) {
		// 넘어온 값 확인
		log.debug("loginUser - {}", loginUser);
		log.debug("업로드 파일 정보 - {}", upfile);
		
		// 업무로직
		// 1) 웹서버에 클라이언트가 전달한 FILE저장
		List<BoardImg> biList = new ArrayList<>();
		// MultipartFile 객체들을 담은 배열을 리스트로 변환
		List<MultipartFile> upfileList = Arrays.asList(upfile);
		
		if(upfileList != null && !upfileList.isEmpty()) {
			//첨부파일, 이미지등을 저장할 저장경로 얻어오기.
			String webPath = "resources/images/board/";
			String serverFolderPath = application.getRealPath(webPath);
			
			//디렉토리가 존재하지 않는다면 생성하는 코드 추가
			File dir = new File(serverFolderPath);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			// 사용자가 등록한 첨부파일의 이름을 수정
			for(MultipartFile image : upfileList) {
				
				String changeName = Utils.saveFile(image, serverFolderPath);
				
				BoardImg bi = new BoardImg();
				bi.setChangeName(changeName);
				log.debug("이미지의 원본명 - {}", image.getOriginalFilename());
				bi.setOriginName(image.getOriginalFilename());
				bi.setImgPath(webPath);
				
				biList.add(bi);
			}
			
		}
		
		// 2) 저장 완료시 파일이 저장된 경로를 BOARD_IMG에 등록후 테이블에 추가
		// -> 1) Board INSERT
		// -> 2) BOARD_IMG INSERT -> 클라이언트가 upfile에 데이터를 작성했을때만.
		//log.debug("board : {}" , b); // Board(boardNo=0, categoryNo=0, boardWriter=홍길동, ...)
		// boardWriter 추가
		b.setBoardWriter(loginUser.getMemberNo());
		log.debug("거래글 정보 - {}", b);
		int result = 0;
		try {
			result = boardService.insertBoard(b, biList);
			log.debug("거래글 정보(등록 후) - {}", b);
		} catch (Exception e) {
			ra.addFlashAttribute("errorMsg", e.getMessage());
		}
		
		Map<String, Object> resultMap = new HashMap<>();
		
		resultMap.put("result", result);
		resultMap.put("boardNo", b.getBoardNo());
		
		// 3) 반환값을 통해 메세지 등록
//		String url = "";
//		if(result > 0) {
//			ra.addFlashAttribute("alertMsg", "글 작성 성공");
//			url = "redirect:/";
//			url = "redirect:/board/detail/"+b.getBoardNo();
//		}else {
//			model.addAttribute("errorMsg", "게시글 작성 실패");
//			url = "common/errorPage";
//		}
		// 4) 응답페이지 설정
		return resultMap;
	}
	
//	// 게시글 수정 페이지
//	@GetMapping("/update/{boardNo}")
//	public String updateBoard(
//			@PathVariable("boardNo") int boardNo,
//			Model model
//			) {
//		// 작성했던 게시글 정보가 보이게 한후, 모델에 담아서 포워딩
//		Board board = boardService.selectBoard(boardNo);
//		BoardImg boardImg = boardService.selectBoardImg(boardNo);
//		// 게시글 본문내용 변경 <br> -> \n
//		board.setContent(Utils.newLineClear(board.getContent()));
//		
//		model.addAttribute("board", board);
//		model.addAttribute("boardImg", boardImg);
//		
//		return "board/boardUpdateForm";
//	}
//	
//	// 게시글 수정 페이지 -> 게시글 수정 버튼 눌렀을 때
//	@PostMapping("/update/{boardNo}")
//	public String updateBoard2(
//			@PathVariable("boardCode") String boardCode,
//			@PathVariable("boardNo") int boardNo,
//			Model model,
//			Board board, // 저장할 게시판 데이터
//			RedirectAttributes ra,
//			// 첨부파일
//			@RequestParam(value="upfile", required = false) MultipartFile upfile,
//			int boardImgNo,
//			String deleteList // 일반게시판 1, 사진게시판 1,2,3
//			) {
//		// 업무로직
//		// BOARD테이블 수정하고
//		log.debug("board ? {} , boardImgNo ? {}" , board, boardImgNo);
//		
//		// upfile에 전달된 IMG이 있으면 이미지테이블 수정 , 추가
//		// 사진이 없던곳에서 새롭게 추가된경우 -> INSERT
//		// 사진이 있던곳에서 새롭게 추가된경우 -> UPDATE
//		// 사진이 있던곳에서 삭제가 된경우 -> DELETE
//		// 원래 사진이 없었고, 추가된 것도 없는 경우 -> 아무것도 안함.
//		int result = 0;
//		
//		result = boardService.updateBoard(board, upfile, boardImgNo, deleteList);
//		
//		if(result > 0) {
//			ra.addFlashAttribute("alertMsg", "게시글 수정 성공");
//			// 작업성공시 리다이렉트
//			return "redirect:/board/detail/" + boardCode + "/" + boardNo;
//		}else {
//			model.addAttribute("errorMsg", "게시글 수정 실패");
//			return "common/errorPage";
//		}
//		
//	}
	/*------------------------------게시글 등록/수정 끝------------------------------*/
	
	// 게시글 상세 페이지 
	@GetMapping("/detail/{boardNo}")
	public String detailBoard(
			@PathVariable(name="boardNo", required = true) int boardNo,
			@RequestParam Map<String, Object> paramMap,
			Model model,
			HttpServletRequest req,
			HttpServletResponse res
			) {
		
		// 1. 게시글의 내용을 조회하기 		
		Board board = boardService.selectBoard(boardNo);
		
		// 게시글이 존재할때
		if(board != null) { 
			Cookie cookie = null; 
			Cookie[] cookies = req.getCookies(); 
			
			if(cookies != null && cookies.length > 0) {
				for(Cookie c : cookies) {
					if("readBoardNo".equals(c.getName())) {
						cookie = c;
						break;
					}
				}
			}
			int result = 0; 
			
			if(cookie == null) {
				cookie = new Cookie("readBoardNo", boardNo +"");
				result = boardService.increaseCount(boardNo); // update 쿼리문 실행 
			}
			else {
				
				String[] arr = cookie.getValue().split("/"); 
				List<String> list = Arrays.asList(arr); 
				if(list.indexOf(boardNo +"") == -1) {
					result = boardService.increaseCount(boardNo);
					cookie.setValue(cookie.getValue() + "/" + boardNo);
				}
				
			}
			if(result >0) {
				board.setCount(board.getCount() + 1); // 1 증가 시키기 
				
				cookie.setPath(req.getContextPath());
				cookie.setMaxAge(1 * 60 * 60); 
				res.addCookie(cookie);
			}
			
		} else { // 게시글이 존재하지 않을때  
			model.addAttribute("errorMsg","존재하지 않는 거래글입니다.");
			return "common/errorPage";
		}
		
		int	favCount = boardService.selectBoardFavCount(boardNo);
		
		// 2. 게시글을 작성한 판매자 정보를 조회하기 
		int boardWriter = board.getBoardWriter();
		Member member = memberService.selectMemberInfo(boardWriter);
		Map<String, Integer> salesCount = boardService.getSalesCount(boardWriter);
		int reviewCount = boardService.getReviewCount(boardWriter);
		
		// 3. 게시글을 작성한 판매자의 판매중인 게시글 조회(최대 3개) 
		paramMap.put("boardWriter", boardWriter);
		paramMap.put("boardNo", boardNo);
		//	List<Board> sellerBoard = boardService.selectSellorBoard(paramMap);
		
		// 3. 해당 게시글이 참고하는 카테고리의 거래 게시글을 조회하기(최대 4개) 
		// 이 카테고리의 이름을 조회하도록 한다. 
		
		int category = board.getCategoryNo();
		String productName = board.getProductName();
		
		paramMap.put("productName", productName);
		paramMap.put("category", category);
		String categoryName = boardService.selectCategoryName(paramMap);
		
		System.out.println(paramMap);	
		List<Board> list = boardService.selectRecommendBoard(paramMap);
		List<Board> sellorList = boardService.selectSellorBoard(paramMap);
		
		
		// 4. 페이지 렌더링 
		model.addAttribute("board", board);
		model.addAttribute("list", list);
		model.addAttribute("sellorList",sellorList);
		model.addAttribute("favCount", favCount);
		model.addAttribute("member", member);
		model.addAttribute("salesCount", salesCount);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("categoryName", categoryName);
		
		return "board/boardDetailView";
	}
	
	
	@PostMapping("/like/{boardNo}")
	@ResponseBody 
	public Map<String, Object> insertLike(
			@PathVariable (value="boardNo", required=true) int boardNo,
			@ModelAttribute("loginUser") Member member,
			RedirectAttributes ra
			){
			
		// 게시글 찜 기능 
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		// 1. 게시글 찜을 누를때 DB에 추가 
		paramMap.put("memberNo", member.getMemberNo());
		paramMap.put("boardNo", boardNo);
		
		int result = 0;
		
		// 2. 예외처리를 해서 중복된 행이 추가되지 않게 만든다.   
		try {
			result = boardService.insertLike(paramMap);
		} catch (Exception e) {
			result = 0; 
		}
		
		paramMap.put("result", result);
		
		System.out.println(paramMap);
		return paramMap;
	}
	
}
