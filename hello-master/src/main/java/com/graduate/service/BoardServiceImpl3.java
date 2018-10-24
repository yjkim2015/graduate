package com.graduate.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.graduate.domain.BoardVO;
import com.graduate.domain.BoardVO2;
import com.graduate.domain.BoardVO3;
import com.graduate.domain.Criteria2;
import com.graduate.domain.Criteria4;
import com.graduate.domain.SearchCriteria2;
import com.graduate.domain.SearchCriteria4;
import com.graduate.persistence.BoardDAO2;
import com.graduate.persistence.BoardDAO3;

@Service
public class BoardServiceImpl3 implements BoardService3 {

	@Inject
	private BoardDAO3 dao;
@Transactional
	@Override
	public void regist(BoardVO3 board) throws Exception {
		dao.create(board);
		System.out.println(board.getBno());

		String[] files = board.getFiles();
		if(files == null) {return;}
		
		for (String fileName : files) {
			dao.addAttach(fileName,board.getBno());
		}
	}
@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public BoardVO3 read(Integer bno) throws Exception {
		dao.updateViewCnt(bno);
		return dao.read(bno);
	}

@Transactional
	@Override
	public void modify(BoardVO3 board) throws Exception {
		dao.update(board);
		
		Integer bno = board.getBno();
		//dao.deleteAttach(bno);
		
		/*String[] files= board.getFiles();
		
		if(files == null) {return;}
		
		for(String fileName : files) {
			dao.replaceAttach(fileName, bno);
		}*/
}

@Transactional
	@Override
	public void remove(Integer bno) throws Exception {
		dao.deleteAttach(bno);	
		dao.delete(bno);
	}
	@Override
	public List<BoardVO3> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<BoardVO3> listCriteria(Criteria4 cri)throws Exception{
		return dao.listCriteria(cri);
	}
	
	@Override
	public int listCountCriteria(Criteria4 cri) throws Exception{
		return dao.countPaging(cri);
	}
	
	@Override
	public List<BoardVO3> listSearchCriteria(SearchCriteria4 cri)
	throws Exception{
		return dao.listSearch(cri);
	}
	@Override
	public int listSearchCount(SearchCriteria4 cri) throws Exception{
		return dao.listSearchCount(cri);
	}
	
	@Override
	public List<String> getAttach(Integer bno)throws Exception{
		return dao.getAttach(bno);
	}
	
}
