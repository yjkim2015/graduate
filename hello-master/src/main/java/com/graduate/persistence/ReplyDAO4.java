package com.graduate.persistence;


import java.util.List;

import com.graduate.domain.Criteria5;
import com.graduate.domain.ReplyVO4;


public interface ReplyDAO4 {

	public List<ReplyVO4> list(Integer bno)throws Exception;
	
	public void create(ReplyVO4 vo) throws Exception;
	
	public void update(ReplyVO4 vo) throws Exception;
	
	public void delete(Integer rno) throws Exception;
	
	public List<ReplyVO4> listPage(Integer bno,Criteria5 cri)throws Exception;
	
	public int count(Integer bno) throws Exception;
	
	public int getBno(Integer rno) throws Exception;
	
	
}
