package com.graduate.persistence;

import java.util.List;

import com.graduate.domain.BoardVO2;
import com.graduate.domain.BoardVO3;
import com.graduate.domain.Criteria2;
import com.graduate.domain.Criteria4;
import com.graduate.domain.SearchCriteria2;
import com.graduate.domain.SearchCriteria3;
import com.graduate.domain.SearchCriteria4;



public interface BoardDAO3 {
	
	public void create(BoardVO3 vo)throws Exception;
	
	public BoardVO3 read(Integer bno)throws Exception;
	
	public void update(BoardVO3 vo)throws Exception;
	
	public void delete(Integer bno)throws Exception;
	
	public List<BoardVO3> listAll()throws Exception;
	
	public List<BoardVO3> listPage(int page)throws Exception;
	
	public List<BoardVO3> listCriteria(Criteria4 cri)throws Exception;
	
	public int countPaging(Criteria4 cri)throws Exception;
	
	public List<BoardVO3> listSearch(SearchCriteria4 cri)throws Exception;
	
	public int listSearchCount(SearchCriteria4 cri)throws Exception;
	
	public void addAttach(String fullName,Integer bno)throws Exception;
	
	public List<String> getAttach(Integer bno)throws Exception;

	public void deleteAttach(Integer bno)throws Exception;
	
	public void replaceAttach(String fullName,Integer bno)throws Exception;
	
	public void updateReplyCnt(Integer bno, int amount)throws Exception;
	
	public void updateViewCnt(Integer bno)throws Exception;
	
}
