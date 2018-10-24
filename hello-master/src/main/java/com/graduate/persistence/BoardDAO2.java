package com.graduate.persistence;

import java.util.List;

import com.graduate.domain.BoardVO2;
import com.graduate.domain.Criteria2;
import com.graduate.domain.SearchCriteria2;



public interface BoardDAO2 {
	
	public void create(BoardVO2 vo)throws Exception;
	
	public BoardVO2 read(Integer bno)throws Exception;
	
	public void update(BoardVO2 vo)throws Exception;
	
	public void delete(Integer bno)throws Exception;
	
	public List<BoardVO2> listAll()throws Exception;
	
	public List<BoardVO2> listPage(int page)throws Exception;
	
	public List<BoardVO2> listCriteria(Criteria2 cri)throws Exception;
	
	public int countPaging(Criteria2 cri)throws Exception;
	
	public List<BoardVO2> listSearch(SearchCriteria2 cri)throws Exception;
	
	public int listSearchCount(SearchCriteria2 cri)throws Exception;
	
	public void addAttach(String fullName,Integer bno)throws Exception;
	
	public List<String> getAttach(Integer bno)throws Exception;

	public void deleteAttach(Integer bno)throws Exception;
	
	public void replaceAttach(String fullName,Integer bno)throws Exception;
	
	public void updateReplyCnt(Integer bno, int amount)throws Exception;
	
	public void updateViewCnt(Integer bno)throws Exception;
	
}
