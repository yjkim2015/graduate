package com.graduate.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.graduate.domain.MemberVO;

public interface MemberDAO {

	public void register(MemberVO vo)throws Exception;
	
	public int checkId(MemberVO vo)throws Exception;

	public void createAuthKey(String user_email, String user_authCode )throws Exception;
	
	public boolean userAuth(MemberVO vo)throws Exception;
	
	public int checkLogin(MemberVO vo)throws Exception;
	
	public String getNaming(MemberVO vo)throws Exception;

	public MemberVO getEmailCheck(MemberVO vo)throws Exception;
	
	public void updateEmail(MemberVO vo)throws Exception;
	

}
