package com.graduate.service;


import java.util.List;

import com.graduate.domain.BoardVO4;
import com.graduate.domain.Criteria5;
import com.graduate.domain.SearchCriteria5;



public interface BoardService4 {

		public void regist(BoardVO4 board)throws Exception;
		
		public BoardVO4 read(Integer bno)throws Exception;
		
		public void modify(BoardVO4 board)throws Exception;
		
		public void remove(Integer bno)throws Exception;
		
		public List<BoardVO4> listAll() throws Exception;
		
		public List<BoardVO4> listCriteria(Criteria5 cri) throws Exception;
		
		public int listCountCriteria(Criteria5 cri)throws Exception;
		
		public List<BoardVO4> listSearchCriteria(SearchCriteria5 cri) throws Exception;
		
		public int listSearchCount(SearchCriteria5 cri) throws Exception;
		
		public List<String> getAttach(Integer bno)throws Exception;

		
}
