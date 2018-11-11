package com.graduate.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.graduate.Mail.MailHandler;
import com.graduate.Mail.TempKey;
import com.graduate.domain.MemberVO;
import com.graduate.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;
	
	@Inject
	private JavaMailSender mailSender;
	
@Transactional
	@Override
	public void create(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		dao.register(member);
		String key = new TempKey().getKey(50, false); // ����Ű ����

		dao.createAuthKey(member.getFullemail(), key); // ����Ű DB����

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("회원가입 인증 코드 발급 안내입니다.]");
		/*sendMail.setText(
				new StringBuffer().append("<h1>�̸��� ���� Ȯ���� �����ð� �α��� ���ּ���.</h1>").append("<a href='http://192.168.56.1:8080/membership/emailConfirm?email=").append(member.getFullemail()).append("' target='_blank'>�̸��� ���� Ȯ��</a>").toString());
		*/
		sendMail.setText(
				new StringBuffer().append("<h1>이메일 인증 확인을 누르시고 로그인 해주세요.</h1>").append("<a href='https://13.59.1.183/membership/emailConfirm?email=").append(member.getFullemail()).append("' target='_blank'>이메일 인증 확인</a>").toString());
	
		sendMail.setFrom("forteas2003@skuniv.ac.kr", "With");
		sendMail.setTo(member.getFullemail());
		sendMail.send();
		}

	@Override
	public int check(MemberVO vo)throws Exception{
		// TODO Auto-generated method stub
		return dao.checkId(vo);
	}
	@Override
	public boolean userAuth(MemberVO vo)throws Exception{
		return dao.userAuth(vo);
	}

	@Override
	public int checkLogin(MemberVO vo)throws Exception{
		return dao.checkLogin(vo);
	}
	@Override
	public String getNaming(MemberVO vo)throws Exception{
		return dao.getNaming(vo);
	}

	@Override
	public MemberVO getEmailCheck(MemberVO vo)throws Exception{
		return dao.getEmailCheck(vo);
	}
	
	@Override
	public void updateEmail(MemberVO vo)throws Exception{
		dao.updateEmail(vo);
	}





}
