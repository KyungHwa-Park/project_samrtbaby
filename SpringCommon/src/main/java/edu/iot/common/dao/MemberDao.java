package edu.iot.common.dao;

import edu.iot.common.model.Member;

public interface MemberDao 
	extends CrudDao<Member, String>{

//	추가 개발 (비밀번호 변경)
//	int changePassword(Map<String, String> map) throws Exception;

}
