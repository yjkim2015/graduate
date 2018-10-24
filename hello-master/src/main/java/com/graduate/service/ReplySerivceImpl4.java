package com.graduate.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.graduate.domain.Criteria5;
import com.graduate.domain.ReplyVO3;
import com.graduate.domain.ReplyVO4;
import com.graduate.persistence.BoardDAO4;
import com.graduate.persistence.ReplyDAO4;



@Service
public class ReplySerivceImpl4 implements ReplyService4 {
	
	@Inject
	private ReplyDAO4 dao;
	
	@Inject
	private BoardDAO4 boardDAO;
	
@Transactional
	@Override
	public void addReply(ReplyVO4 vo) throws Exception {
		dao.create(vo);
		boardDAO.updateReplyCnt(vo.getBno(),1);
	}

	@Override
	public List<ReplyVO4> listReply(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(bno);
	}

	@Override
	public void modifyReply(ReplyVO4 vo) throws Exception {
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
	public List<ReplyVO4> listReplyPage(Integer bno,Criteria5 cri)
	throws Exception{
		return dao.listPage(bno, cri);
	}
	
	@Override
	public int count(Integer bno) throws Exception{
		return dao.count(bno);
	}
}
