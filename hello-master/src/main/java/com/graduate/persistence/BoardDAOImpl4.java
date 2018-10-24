package com.graduate.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.graduate.domain.BoardVO4;
import com.graduate.domain.Criteria5;
import com.graduate.domain.SearchCriteria5;


@Repository
public class BoardDAOImpl4 implements BoardDAO4 {
	
	@Inject
	private SqlSession session;
	
	private static String namespace="com.graduate.mapper.4BoardMapper";
	
	@Override
	public void create(BoardVO4 vo) throws Exception {
		
		session.insert(namespace+".create2",vo);
	}

	@Override
	public BoardVO4 read(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".read2",bno);
	}

	@Override
	public void update(BoardVO4 vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".update2",vo);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".delete2",bno);
	}

	@Override
	public List<BoardVO4> listAll() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listAll2");
	}
	
	@Override
	public List<BoardVO4> listPage(int page)throws Exception{
		if(page<=0)
		{
			page=1;
		}
		page=(page-1)*10;
		return session.selectList(namespace+".listPage2",page);
	}

	@Override
	public List<BoardVO4> listCriteria(Criteria5 cri) throws Exception{
		return session.selectList(namespace+".listCriteria2",cri);
	}
	
	@Override
	public int countPaging(Criteria5 cri)throws Exception{
		return session.selectOne(namespace+".countPaging2",cri);
	}
	@Override
	public List<BoardVO4> listSearch(SearchCriteria5 cri)throws Exception
	{
		return session.selectList(namespace+".listSearch2",cri);
	}
	@Override
	public int listSearchCount(SearchCriteria5 cri)throws Exception{
		return session.selectOne(namespace+".listSearchCount2",cri);
	}
	
	@Override
	public void addAttach(String fullName,Integer bno) throws Exception{
		
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("fullName", fullName);
		paramMap.put("bno", bno);
		session.insert(namespace+".addAttach2",paramMap);
	}

	@Override
	public List<String> getAttach(Integer bno)throws Exception{
		
		return session.selectList(namespace+".getAttach2",bno);
	}
	
	@Override
	public void deleteAttach(Integer bno)throws Exception{
		
		session.delete(namespace+".deleteAttach2",bno);
	};
	
	@Override
	public void replaceAttach(String fullName,Integer bno)throws Exception{
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		
		paramMap.put("bno", bno);
		paramMap.put("fullNmae", fullName);
		
		session.insert(namespace+".replaceAttach2",paramMap);
	}
	
	@Override
	public void updateReplyCnt(Integer bno, int amount) throws Exception{
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		
		paramMap.put("bno",bno);
		paramMap.put("amount",amount);
		
		session.update(namespace+".updateReplyCnt",paramMap);
	}
	
	@Override
	public void updateViewCnt(Integer bno)throws Exception{
		session.update(namespace+".updateViewCnt",bno);
	}
}
