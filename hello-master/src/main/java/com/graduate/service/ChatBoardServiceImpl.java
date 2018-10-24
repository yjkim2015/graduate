package com.graduate.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.graduate.domain.ChatBoardVO;
import com.graduate.domain.ChatList;
import com.graduate.domain.Criteria3;
import com.graduate.domain.SearchCriteria3;
import com.graduate.persistence.ChatBoardDAO;


@Service
public class ChatBoardServiceImpl implements ChatBoardService {

	@Inject
	private ChatBoardDAO dao;
	

	@Override
	public void regist(ChatBoardVO board) throws Exception {
		dao.create(board);
	
		
	}

	@Override
	public ChatBoardVO read(Integer bno) throws Exception {
		return dao.read(bno);
	}

	@Override
	public void modify(ChatBoardVO board) throws Exception {
		dao.update(board);
	
}

	@Override
	public void remove(Integer bno) throws Exception {
	dao.delete(bno);
	}

	@Override
	public List<ChatBoardVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<ChatBoardVO> listCriteria(Criteria3 cri)throws Exception{
		return dao.listCriteria(cri);
	}
	
	@Override
	public int listCountCriteria(Criteria3 cri) throws Exception{
		return dao.countPaging(cri);
	}
	
	@Override
	public List<ChatBoardVO> listSearchCriteria(SearchCriteria3 cri)
	throws Exception{
		return dao.listSearch(cri);
	}
	@Override
	public int listSearchCount(SearchCriteria3 cri) throws Exception{
		return dao.listSearchCount(cri);
	}

	@Override
	public void insert(ChatList chat)throws Exception{
		dao.insert(chat);
	}

	@Override
	public List<ChatList> chatnameandcount(Integer bno)throws Exception{
		return dao.chatnameandcount(bno);
	}
	
	@Override
	public void removeName(ChatList chatname)throws Exception{
		dao.removeName(chatname);
	}


	
}
