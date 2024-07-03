package com.kh.secondLife.report.model.vo;

import java.util.List;

import com.kh.secondLife.board.model.vo.BoardExt;
import com.kh.secondLife.board.model.vo.BoardImg;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class ReportExt {
	private List<ReportImg> riList; // 신고글 이미지는 여러개이기 때문에 리스트로 선언 
}
