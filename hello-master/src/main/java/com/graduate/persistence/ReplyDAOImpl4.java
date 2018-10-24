package com.graduate.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.graduate.domain.Criteria5;
import com.graduate.domain.ReplyVO3;
import com.graduate.domain.ReplyVO4;

@Repository
public class ReplyDAOImpl4 implements ReplyDAO4 {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.graduate.mapper.4ReplyMapper";
	
	@Override
	public List<ReplyVO4> list(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".list4",bno);
	}

	@Override
	public void create(ReplyVO4 vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".create4",vo);
	
	}

	@Override
	public void update(ReplyVO4 vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".update4",vo);
	}

	@Override
	public void delete(Integer rno) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("gogog");
		session.delete(namespace+".delete4",rno);
	}

	@Override
	public List<ReplyVO4> listPage(Integer bno, Criteria5 cri) throws Exception{
	
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("bno", bno);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace+".listPage4",paramMap);
	}
	
	@Override
	public int count(Integer bno) throws Exception{
		return session.selectOne(namespace+".count4",bno);
	}
	
	@Override
	public int getBno(Integer rno)throws Exception{
		return session.selectOne(namespace+".getBno4",rno);
	}
}
