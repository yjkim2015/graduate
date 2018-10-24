package com.graduate.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.graduate.domain.Criteria2;
import com.graduate.domain.ReplyVO2;
import com.graduate.persistence.BoardDAO2;
import com.graduate.persistence.ReplyDAO2;



@Service
public class ReplySerivceImpl2 implements ReplyService2 {
	
	@Inject
	private ReplyDAO2 dao;
	
	@Inject
	private BoardDAO2 boardDAO;
	
@Transactional
	@Override
	public void addReply(ReplyVO2 vo) throws Exception {
		dao.create(vo);
		boardDAO.updateReplyCnt(vo.getBno(),1);
	}

	@Override
	public List<ReplyVO2> listReply(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(bno);
	}

	@Override
	public void modifyReply(ReplyVO2 vo) throws Exception {
		dao.update(vo);
	}
@Transactional
	@Override
	public void removeReply(Integer rno) throws Exception {
	int bno= dao.getBno(rno);
	dao.delete(rno);
	boardDAO.updateReplyCnt(bno, -1);
	}

	@Override
	public List<ReplyVO2> listReplyPage(Integer bno,Criteria2 cri)
	throws Exception{
		return dao.listPage(bno, cri);
	}
	
	@Override
	public int count(Integer bno) throws Exception{
		return dao.count(bno);
	}
}
