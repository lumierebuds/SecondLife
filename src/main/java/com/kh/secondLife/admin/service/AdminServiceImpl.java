package com.kh.secondLife.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.secondLife.admin.dao.AdminDao;
import com.kh.secondLife.member.dao.MemberDao;
import com.kh.secondLife.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private final AdminDao adminDao;
	private final BCryptPasswordEncoder encoder;
	
	@Override
	public Member login(Member m) {
		
		
		Member loginUser = adminDao.login(m);
	    
	    // 입력된 비밀번호와 데이터베이스의 비밀번호를 비교
	    if (loginUser != null && encoder.matches(m.getPwd(), loginUser.getPwd())) {
	        return loginUser;
	    } else {
	        return null;
	    }
	}
	
	
	
	
}
