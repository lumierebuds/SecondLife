package com.kh.secondLife.member.dao;

import com.kh.secondLife.member.model.vo.Member;

public interface MemberDao {
	
	Member login(Member m);
	
	int insertMember(Member m);
	
	int updateMember(Member m);
	
	int idCheck(String id);
	
}
