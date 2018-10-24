package com.graduate.persistence;

import java.util.List;

import com.graduate.domain.BoardVO3;
import com.graduate.domain.BoardVO4;
import com.graduate.domain.Criteria5;
import com.graduate.domain.SearchCriteria5;



public interface BoardDAO4 {
	
	public void create(BoardVO4 vo)throws Exception;
	
	public BoardVO4 read(Integer bno)throws Exception;
	
	public void update(BoardVO4 vo)throws Exception;
	
	public void delete(Integer bno)throws Exception;
	
	public List<BoardVO4> listAll()throws Exception;
	
	public List<BoardVO4> listPage(int page)throws Exception;
	
	public List<BoardVO4> listCriteria(Criteria5 cri)throws Exception;
	
	public int countPaging(Criteria5 cri)throws Exception;
	
	public List<BoardVO4> listSearch(SearchCriteria5 cri)throws Exception;
	
	public int listSearchCount(SearchCriteria5 cri)throws Exception;
	
	public void addAttach(String fullName,Integer bno)throws Exception;
	
	public List<String> getAttach(Integer bno)throws Exception;

	public void deleteAttach(Integer bno)throws Exception;
	
	public void replaceAttach(String fullName,Integer bno)throws Exception;
	
	public void updateReplyCnt(Integer bno, int amount)throws Exception;
	
	public void updateViewCnt(Integer bno)throws Exception;
	
}
