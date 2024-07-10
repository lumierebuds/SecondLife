package com.kh.secondLife.admin.service;

import java.util.List;

import com.kh.secondLife.member.model.vo.Member;

public interface AdminService {

	Member login(Member m);

	List<Member> selectMemberAll();
	
}