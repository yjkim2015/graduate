package com.graduate.service;


import java.util.List;

import com.graduate.domain.Criteria2;
import com.graduate.domain.Criteria4;
import com.graduate.domain.ReplyVO2;
import com.graduate.domain.ReplyVO3;



public interface ReplyService3 {

	public void addReply(ReplyVO3 vo) throws Exception;
	
	public List<ReplyVO3> listReply(Integer bno)throws Exception;
	
	public void modifyReply(ReplyVO3 vo) throws Exception;
	
	public void removeReply(Integer rno) throws Exception;
	
	public List<ReplyVO3> listReplyPage(Integer bno,Criteria4 cri)
	throws Exception;
	
	public int count(Integer bno)throws Exception;
	
}
