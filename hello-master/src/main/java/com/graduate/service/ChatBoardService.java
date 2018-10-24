package com.graduate.service;


import java.util.List;

import com.graduate.domain.ChatBoardVO;
import com.graduate.domain.ChatList;
import com.graduate.domain.Criteria3;
import com.graduate.domain.SearchCriteria3;

public interface ChatBoardService {

		public void regist(ChatBoardVO board)throws Exception;
		
		public ChatBoardVO read(Integer bno)throws Exception;
		
		public void modify(ChatBoardVO board)throws Exception;
		
		public void remove(Integer bno)throws Exception;
		
		public List<ChatBoardVO> listAll() throws Exception;
		
		public List<ChatBoardVO> listCriteria(Criteria3 cri) throws Exception;
		
		public int listCountCriteria(Criteria3 cri)throws Exception;
		
		public List<ChatBoardVO> listSearchCriteria(SearchCriteria3 cri) throws Exception;
		
		public int listSearchCount(SearchCriteria3 cri) throws Exception;
		
		public void insert(ChatList chat)throws Exception;
		
		public List<ChatList> chatnameandcount(Integer bno)throws Exception;
		
		public void removeName(ChatList chatname)throws Exception;
		
		
}
