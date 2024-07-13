package com.kh.secondLife.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TradeCategory {
	private int tradeCategoryNo; // 거래 방식 번호 (택배거래=0, 직거래=1)
	private String tradeMethod; // 거래 방식 (택배거래, 직거래)
}
