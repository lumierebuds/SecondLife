package com.kh.secondLife.board.model.vo;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class BoardExt extends Board{
	
	private List<BoardImg> biList; // 거래 이미지 묶음 (거래글 이미지는 여러개이기 때문에 리스트로 선언)
	
}
