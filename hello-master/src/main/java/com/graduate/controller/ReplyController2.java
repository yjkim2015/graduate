package com.graduate.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.graduate.domain.Criteria2;
import com.graduate.domain.PageMaker2;
import com.graduate.domain.ReplyVO2;
import com.graduate.service.ReplyService2;


@RestController
@RequestMapping("/replies2")
public class ReplyController2 {

	
	@Inject
	private ReplyService2 service;
	
	@RequestMapping(value="",method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO2 vo){
		//뭐하며 ㄴ에러남
		ResponseEntity<String> entity=null;
		
		try {
			service.addReply(vo);
			entity= new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value="/all/{bno}",method=RequestMethod.GET)
	public ResponseEntity<List<ReplyVO2>> list(
			@PathVariable("bno") Integer bno)
	{
		ResponseEntity<List<ReplyVO2>> entity=null;
		try {
			entity=new ResponseEntity<>(
					service.listReply(bno),HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value="/{rno}",method= {RequestMethod.PUT,RequestMethod.PATCH})
	public ResponseEntity<String> update(
			@PathVariable("rno") Integer rno,
			@RequestBody ReplyVO2 vo){
		
		ResponseEntity<String> entity= null;
		try {
			vo.setRno(rno);
			service.modifyReply(vo);
			entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(
					e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	
	}
	
	@RequestMapping(value="/{rno}",method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(
			@PathVariable("rno") Integer rno){
		System.out.println(rno);
		ResponseEntity<String> entity = null;
		try {
			service.removeReply(rno);
			entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(
					e.getMessage(),HttpStatus.BAD_REQUEST);
		}
	return entity;
	}

	@RequestMapping(value="/{bno}/{page}",method=RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> listPage(
			@PathVariable("bno") Integer bno,
			@PathVariable("page") Integer page){
		
		ResponseEntity<Map<String,Object>> entity=null;
		
		try {
			Criteria2 cri= new Criteria2();
			cri.setPage(page);
			
			PageMaker2 pageMaker = new PageMaker2();
			pageMaker.setCri(cri);
			
			Map<String,Object> map= new HashMap<String,Object>();
			List<ReplyVO2> list = service.listReplyPage(bno, cri);
			
			map.put("list", list);
			
			int replyCount = service.count(bno);
			pageMaker.setTotalCount(replyCount);
			
			map.put("pageMaker", pageMaker);
			
			entity= new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity= new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
