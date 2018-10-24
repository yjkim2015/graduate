package com.graduate.persistence;


import java.util.List;

import com.graduate.domain.Criteria2;
import com.graduate.domain.ReplyVO2;


public interface ReplyDAO2 {

	public List<ReplyVO2> list(Integer bno)throws Exception;
	
	public void create(ReplyVO2 vo) throws Exception;
	
	public void update(ReplyVO2 vo) throws Exception;
	
	public void delete(Integer rno) throws Exception;
	
	public List<ReplyVO2> listPage(Integer bno,Criteria2 cri)throws Exception;
	
	public int count(Integer bno) throws Exception;
	
	public int getBno(Integer rno) throws Exception;
	
	
}
