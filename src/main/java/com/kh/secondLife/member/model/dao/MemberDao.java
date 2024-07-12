package com.kh.secondLife.member.model.dao;

import com.kh.secondLife.member.model.vo.Member;
import com.kh.secondLife.member.model.vo.Review;

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
	
	int insertReview(Review review);
}
