package com.kh.secondLife.member.model.service;

import com.kh.secondLife.member.model.vo.Member;

public interface MemberService {
	
	Member login(Member m);

	int insertMember(Member m);

	int updateMember(Member m);

	int idCheck(String id);
	
	int deleteMember(String id);
	
	// 게시글 상세조회시 판매자 정보 조회 
	Member selectMemberInfo(int boardWriter);


	String findIdByEmail(String email);

	String getMemberById(String id);

	boolean deleteMemberById(String memberId);

}
