package com.kh.secondLife.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	
	private int boardNo; // 거래글 번호
	private int categoryNo; // 거래글 카테고리 번호 (수입명품=0, 패션의류=1, 패션잡화=2 등등)
	private int boardWriter; // 거래글 작성자 번호 = Member 필드의 memberNo
	private int tradeCategoryNo; // 거래 방식 번호 (택배거래=0, 직거래=1, 모두=2)
	private String productName; // 상품명 (ex. 마우스 팔아요)
	private int price; // 가격
	private int condition; // 물건 상태(중고=0, 새상품=1)
	private String content; // 물건 상세 정보 (거래글 작성한 내용)
	private Date createDate; // 등록 날짜 [기본값 : SYSDATE]
	private Date modifyDate; // 수정 날짜 [기본값 : SYSDATE]
	private String status; // 유효 여부 [기본값 : 'Y']
	private String saleCondition; // 거래 완료 여부 [기본값 : 'N']
	private int count; // 조회수
	private int purchaser;
	
}










