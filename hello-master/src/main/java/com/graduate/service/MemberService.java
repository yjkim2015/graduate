package com.graduate.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.graduate.domain.MemberVO;

public interface MemberService {

	public void create(MemberVO member)throws Exception;
	
	public int check(MemberVO vo)throws Exception;

	public boolean userAuth(MemberVO vo)throws Exception;
	
	public int checkLogin(MemberVO vo)throws Exception;
	
	public String getNaming(MemberVO vo)throws Exception;

	public MemberVO getEmailCheck(MemberVO vo)throws Exception;
	
	public void updateEmail(MemberVO vo)throws Exception;
	
	
	
}
