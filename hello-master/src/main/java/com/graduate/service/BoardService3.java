package com.graduate.service;


import java.util.List;

import com.graduate.domain.BoardVO2;
import com.graduate.domain.BoardVO3;
import com.graduate.domain.Criteria2;
import com.graduate.domain.Criteria4;
import com.graduate.domain.SearchCriteria2;
import com.graduate.domain.SearchCriteria4;



public interface BoardService3 {

		public void regist(BoardVO3 board)throws Exception;
		
		public BoardVO3 read(Integer bno)throws Exception;
		
		public void modify(BoardVO3 board)throws Exception;
		
		public void remove(Integer bno)throws Exception;
		
		public List<BoardVO3> listAll() throws Exception;
		
		public List<BoardVO3> listCriteria(Criteria4 cri) throws Exception;
		
		public int listCountCriteria(Criteria4 cri)throws Exception;
		
		public List<BoardVO3> listSearchCriteria(SearchCriteria4 cri) throws Exception;
		
		public int listSearchCount(SearchCriteria4 cri) throws Exception;
		
		public List<String> getAttach(Integer bno)throws Exception;

		
}
