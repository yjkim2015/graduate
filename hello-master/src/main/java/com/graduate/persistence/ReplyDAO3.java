package com.graduate.persistence;


import java.util.List;

import com.graduate.domain.Criteria2;
import com.graduate.domain.Criteria4;
import com.graduate.domain.ReplyVO2;
import com.graduate.domain.ReplyVO3;


public interface ReplyDAO3 {

	public List<ReplyVO3> list(Integer bno)throws Exception;
	
	public void create(ReplyVO3 vo) throws Exception;
	
	public void update(ReplyVO3 vo) throws Exception;
	
	public void delete(Integer rno) throws Exception;
	
	public List<ReplyVO3> listPage(Integer bno,Criteria4 cri)throws Exception;
	
	public int count(Integer bno) throws Exception;
	
	public int getBno(Integer rno) throws Exception;
	
	
}
