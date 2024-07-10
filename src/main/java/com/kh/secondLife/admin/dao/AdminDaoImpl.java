package com.kh.secondLife.admin.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.secondLife.member.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member login(Member m) {
		return sqlSession.selectOne( "admin.adminLogin" , m );
	}

}
