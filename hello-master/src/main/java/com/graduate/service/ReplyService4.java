package com.graduate.service;


import java.util.List;

import com.graduate.domain.Criteria5;
import com.graduate.domain.ReplyVO4;



public interface ReplyService4 {

	public void addReply(ReplyVO4 vo) throws Exception;
	
	public List<ReplyVO4> listReply(Integer bno)throws Exception;
	
	public void modifyReply(ReplyVO4 vo) throws Exception;
	
	public void removeReply(Integer rno) throws Exception;
	
	public List<ReplyVO4> listReplyPage(Integer bno,Criteria5 cri)
	throws Exception;
	
	public int count(Integer bno)throws Exception;
	
}
