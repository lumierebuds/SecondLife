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

	int insertReview(Review review);
	
}
