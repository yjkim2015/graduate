package com.graduate.service;


import java.util.List;

import com.graduate.domain.Criteria2;
import com.graduate.domain.ReplyVO2;



public interface ReplyService2 {

	public void addReply(ReplyVO2 vo) throws Exception;
	
	public List<ReplyVO2> listReply(Integer bno)throws Exception;
	
	public void modifyReply(ReplyVO2 vo) throws Exception;
	
	public void removeReply(Integer rno) throws Exception;
	
	public List<ReplyVO2> listReplyPage(Integer bno,Criteria2 cri)
	throws Exception;
	
	public int count(Integer bno)throws Exception;
	
}
