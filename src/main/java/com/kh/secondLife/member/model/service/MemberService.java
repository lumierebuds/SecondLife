package com.kh.secondLife.member.model.service;

import com.kh.secondLife.member.model.vo.Member;

public interface MemberService {
	
	Member login(Member m);

	int insertMember(Member m);

	int updateMember(Member m);

	int idCheck(String id);
}
