package edu.iot.common.service;

import edu.iot.common.model.Member;

public interface MemberService {
	Member login(String userId, String password) throws Exception;
	
	void join(Member member) throws Exception;
	
	String idcheck(String userId) throws Exception;

	Member findById(String userId)  throws Exception;

	void delete(String userId) throws Exception;

	/* 추가 개발
	int update(Member member, Member nMember) throws Exception;
	int changePassword(Member member, String oldPassword, String newPassword)  throws Exception;
	*/
}
