package com.graduate.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.graduate.domain.MemberVO;
@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace="com.graduate.mapper.MemberMapper";

	@Override
	public void register(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".register",vo);
	}

	@Override
	public int checkId(MemberVO vo)throws Exception
	{
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".checkId",vo);
	}

	@Override
	public void createAuthKey(String user_email, String user_authCode) throws Exception {
		// TODO Auto-generated method stub
		MemberVO member = new MemberVO();
		member.setAuthCode(user_authCode);
		member.setFullemail(user_email);

		session.selectOne(namespace + ".createAuthKey", member);
	}
	
	@Override
	public boolean userAuth(MemberVO vo )throws Exception{
		return session.selectOne(namespace+".userAuth",vo);
	}
	@Override
	public int checkLogin(MemberVO vo)throws Exception{
		int c=session.selectOne(namespace+".checkId",vo);
		System.out.println(c);
		int b=0;
		if(c!=0) {
			b=session.selectOne(namespace+".checkLogin",vo);
			System.out.println(b);
		}
	return b+c;
	}
	@Override
	public String getNaming(MemberVO vo)throws Exception{
		return session.selectOne(namespace+".getNaming",vo);
	}

	@Override
	public MemberVO getEmailCheck(MemberVO vo)throws Exception{
		return session.selectOne(namespace+".getEmailCheck",vo);
	}
	
	@Override
	public void updateEmail(MemberVO vo)throws Exception{
		session.selectOne(namespace+".updateEmail",vo);
	}

}
