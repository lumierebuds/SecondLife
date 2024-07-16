package com.kh.secondLife.member.model.dao;

import java.util.List;

import com.kh.secondLife.board.model.vo.BoardExt;
import com.kh.secondLife.member.model.vo.Member;

public interface MemberDao {
	
	Member login(Member m);
	
	int insertMember(Member m);
	
	int updateMember(Member m);
	
	int idCheck(String id);
	
	int deleteMember(String id);

	String findIdByEmail(String email);

	String getMemberById(String id);
	
	// 게시글 상세조회시 판매자 정보 조회
	Member selectMemberInfo(int boardWriter);

	boolean deleteMemberById(String memberId);

	List<BoardExt> selectSellerBoardList(int memberNo);

	List<BoardExt> selectMySellBoardList(int memberNo);

	List<BoardExt> getWishlist(int memberNo);
	
	
}
