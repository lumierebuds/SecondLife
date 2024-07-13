package com.kh.secondLife.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Category {
	private int categoryNo; // 거래글 카테고리 번호 (수입명품=0, 패션의류=1, 패션잡화=2 등등)
	private String categoryName; // 거래글 카테고리 이름 (수입명품, 패션의류, 패션잡화, ...)
}
