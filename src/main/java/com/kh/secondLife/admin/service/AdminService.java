package com.kh.secondLife.admin.service;

import java.util.List;
import java.util.Map;

import com.kh.secondLife.board.model.vo.Board;
import com.kh.secondLife.common.model.vo.PageInfo;
import com.kh.secondLife.member.model.vo.Member;

public interface AdminService {

	Member login(Member m);

	List<Member> selectMemberAll();

	List<Board> selectBoardList(PageInfo pi, Map<String, Object> paramMap);
	
}