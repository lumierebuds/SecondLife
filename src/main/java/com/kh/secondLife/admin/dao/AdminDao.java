package com.kh.secondLife.admin.dao;

import java.util.List;

import com.kh.secondLife.member.model.vo.Member;

public interface AdminDao {

	Member login(Member m);

	List<Member> selectMemberAll();

}
