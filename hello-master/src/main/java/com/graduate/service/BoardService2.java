package com.graduate.service;


import java.util.List;

import com.graduate.domain.BoardVO2;
import com.graduate.domain.Criteria2;
import com.graduate.domain.SearchCriteria2;



public interface BoardService2 {

		public void regist(BoardVO2 board)throws Exception;
		
		public BoardVO2 read(Integer bno)throws Exception;
		
		public void modify(BoardVO2 board)throws Exception;
		
		public void remove(Integer bno)throws Exception;
		
		public List<BoardVO2> listAll() throws Exception;
		
		public List<BoardVO2> listCriteria(Criteria2 cri) throws Exception;
		
		public int listCountCriteria(Criteria2 cri)throws Exception;
		
		public List<BoardVO2> listSearchCriteria(SearchCriteria2 cri) throws Exception;
		
		public int listSearchCount(SearchCriteria2 cri) throws Exception;
		
		public List<String> getAttach(Integer bno)throws Exception;

		
}
