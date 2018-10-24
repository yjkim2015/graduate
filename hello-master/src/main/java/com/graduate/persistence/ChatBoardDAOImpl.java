package com.graduate.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.graduate.domain.ChatBoardVO;
import com.graduate.domain.ChatList;
import com.graduate.domain.Criteria3;
import com.graduate.domain.SearchCriteria3;


@Repository
public class ChatBoardDAOImpl implements ChatBoardDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace="com.graduate.mapper.ChatMapper";
	
	@Override
	public void create(ChatBoardVO vo) throws Exception {
		
		session.insert(namespace+".create",vo);
	}

	@Override
	public ChatBoardVO read(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		
		return session.selectOne(namespace+".read",bno);
	}

	@Override
	public void update(ChatBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".update",vo);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".delete",bno);
	}

	@Override
	public List<ChatBoardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listAll");
	}
	
	@Override
	public List<ChatBoardVO> listPage(int page)throws Exception{
		if(page<=0)
		{
			page=1;
		}
		page=(page-1)*10;
		return session.selectList(namespace+".listPage",page);
	}

	@Override
	public List<ChatBoardVO> listCriteria(Criteria3 cri) throws Exception{
		return session.selectList(namespace+".listCriteria",cri);
	}
	
	@Override
	public int countPaging(Criteria3 cri)throws Exception{
		return session.selectOne(namespace+".countPaging",cri);
	}
	@Override
	public List<ChatBoardVO> listSearch(SearchCriteria3 cri)throws Exception
	{
		return session.selectList(namespace+".listSearch",cri);
	}
	@Override
	public int listSearchCount(SearchCriteria3 cri)throws Exception{
		return session.selectOne(namespace+".listSearchCount",cri);
	}

	@Override
	public void insert(ChatList chat)throws Exception{
		 session.insert(namespace+".insert",chat);
	}
	
	@Override
	public List<ChatList> chatnameandcount(Integer bno)throws Exception{
		return session.selectList(namespace+".chatnameandcount",bno);
	}

	@Override
	public void removeName(ChatList chatname)throws Exception{
		session.delete(namespace+".removeName",chatname);
	}


}
