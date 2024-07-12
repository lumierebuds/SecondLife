package com.kh.secondLife.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.secondLife.member.model.dao.MemberDao;
import com.kh.secondLife.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService{
	
//	@Autowired
	private final MemberDao dao;
	private final BCryptPasswordEncoder encoder;
	
	@Override
	public Member login(Member m) {
	    Member loginUser = dao.login(m);
	    
	    // 입력된 비밀번호와 데이터베이스의 비밀번호를 비교
	    if (loginUser != null && encoder.matches(m.getPwd(), loginUser.getPwd())) {
	        return loginUser;
	    } else {
	        return null;
	    }
	}

	@Override
	public int insertMember(Member m) {
		return dao.insertMember(m);
	}

	@Override
	public int updateMember(Member m) {
		return dao.updateMember(m);
	}

	@Override
	public int idCheck(String id) {
		return dao.idCheck(id);
	}
	
	@Override
    public int deleteMember(String id) {
        return dao.deleteMember(id);
    }
	
	// 게시글 상세조회시 판매자 정보 조회
	@Override
	public Member selectMemberInfo(int boardWriter) {
		
		return dao.selectMemberInfo(boardWriter);
	}
	
	
	

	@Override
    public String findIdByEmail(String email) {
        return dao.findIdByEmail(email);
    }

	@Override
	public String getMemberById(String id) {
		return dao.getMemberById(id);
	}

	@Override
	public boolean deleteMemberById(String memberId) {
		try {
            return dao.deleteMemberById(memberId);
        } catch (Exception e) {
            return false;
        }
	}

	
}
