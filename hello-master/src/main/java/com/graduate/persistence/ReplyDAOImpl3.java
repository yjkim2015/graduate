package com.graduate.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.graduate.domain.Criteria2;
import com.graduate.domain.Criteria4;
import com.graduate.domain.ReplyVO2;
import com.graduate.domain.ReplyVO3;

@Repository
public class ReplyDAOImpl3 implements ReplyDAO3 {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.graduate.mapper.3ReplyMapper";
	
	@Override
	public List<ReplyVO3> list(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".list2",bno);
	}

	@Override
	public void create(ReplyVO3 vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".create2",vo);
	
	}

	@Override
	public void update(ReplyVO3 vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".update2",vo);
	}

	@Override
	public void delete(Integer rno) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("gogog");
		session.delete(namespace+".delete2",rno);
	}

	@Override
	public List<ReplyVO3> listPage(Integer bno, Criteria4 cri) throws Exception{
	
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("bno", bno);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace+".listPage2",paramMap);
	}
	
	@Override
	public int count(Integer bno) throws Exception{
		return session.selectOne(namespace+".count2",bno);
	}
	
	@Override
	public int getBno(Integer rno)throws Exception{
		return session.selectOne(namespace+".getBno",rno);
	}
}
