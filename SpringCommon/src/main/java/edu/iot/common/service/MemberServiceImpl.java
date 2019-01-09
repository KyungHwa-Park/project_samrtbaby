package edu.iot.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.iot.common.dao.MemberDao;
import edu.iot.common.exception.LoginFailException;
import edu.iot.common.model.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao dao;
	
	@Override
	public Member login(String userId, String password) throws Exception {
		Member member = dao.findById(userId);
		if(member == null) {
			throw new LoginFailException("사용자 ID가 존재하지 않습니다.");
		} else {
			if(password.equals(member.getPassword())) {
				return member;
			} else {
				throw new LoginFailException("비밀번호가 일치하지 않습니다.");
			}			
		}
	}

	@Override
	public void join(Member member) throws Exception {
		dao.insert(member);
	}

	@Override
	public String idcheck(String userId) throws Exception {
		Member member = dao.findById(userId);
		if(member == null) {	// ID 중복 아님
			return "ok";
		}
		// ID 중복
		return "fail";
	}

	@Override
	public Member findById(String userId) throws Exception {
		return dao.findById(userId);
	}

	@Override
	public void delete(String userId) throws Exception {
		dao.delete(userId);		
	}
}





