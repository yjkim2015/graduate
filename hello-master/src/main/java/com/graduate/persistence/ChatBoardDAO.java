package com.graduate.persistence;

import java.util.List;

import com.graduate.domain.ChatBoardVO;
import com.graduate.domain.ChatList;
import com.graduate.domain.Criteria3;
import com.graduate.domain.SearchCriteria3;



public interface ChatBoardDAO {
	
	public void create(ChatBoardVO vo)throws Exception;
	
	public ChatBoardVO read(Integer bno)throws Exception;
	
	public void update(ChatBoardVO vo)throws Exception;
	
	public void delete(Integer bno)throws Exception;
	
	public List<ChatBoardVO > listAll()throws Exception;
	
	public List<ChatBoardVO > listPage(int page)throws Exception;
	
	public List<ChatBoardVO > listCriteria(Criteria3 cri)throws Exception;
	
	public int countPaging(Criteria3 cri)throws Exception;
	
	public List<ChatBoardVO > listSearch(SearchCriteria3 cri)throws Exception;
	
	public int listSearchCount(SearchCriteria3 cri)throws Exception;
	
	public void insert(ChatList chat)throws Exception;

	public List<ChatList> chatnameandcount(Integer bno)throws Exception;

	public void removeName(ChatList chatname)throws Exception;

}
