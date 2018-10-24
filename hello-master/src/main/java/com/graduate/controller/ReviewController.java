package com.graduate.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.graduate.domain.BoardVO2;
import com.graduate.domain.PageMaker2;
import com.graduate.domain.SearchCriteria2;
import com.graduate.service.BoardService2;



@Controller
@RequestMapping(value="/review")
public class ReviewController {

private static final Logger logger= LoggerFactory.getLogger(ReviewController.class);
	
	@Inject 
	private BoardService2 service;
	
	
	@RequestMapping(value="/register" , method=RequestMethod.GET)
	public void registGET() throws Exception{
		logger.info("regist get ......");
	}
	@RequestMapping(value="/register" , method=RequestMethod.POST)
	public String registPOST(BoardVO2 board, RedirectAttributes rttr)
			throws Exception{
		logger.info("regist post ......");
		logger.info(board.toString());
		
		service.regist(board);
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/review/";
	}
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String listPage(@ModelAttribute("cri") SearchCriteria2 cri,
			Model model) throws Exception{
		logger.info(cri.toString());
		System.out.println("하이이이이22");

		model.addAttribute("list2",service.listSearchCriteria(cri));
		
		System.out.println("하이이이이");

		PageMaker2 pageMaker = new PageMaker2();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listSearchCount(cri));
		model.addAttribute("pageMaker",pageMaker);
		return "/review/review";
	}
	
	@RequestMapping(value="/readPage",method=RequestMethod.GET)
	public void read(@RequestParam("bno") int bno,
			@ModelAttribute("cri") SearchCriteria2 cri, Model model)
		throws Exception{
		model.addAttribute(service.read(bno));
	}
	
	@RequestMapping(value="/removePage",method=RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno,
			SearchCriteria2 cri,
			RedirectAttributes rttr) throws Exception{
		
		service.remove(bno);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("msg","SUCCESS");
		return "redirect:/review/";
	}
	
	@RequestMapping(value="/modifyPage",method=RequestMethod.GET)
	public void modifyPagingGET(int bno,
			@ModelAttribute("cri") SearchCriteria2 cri,
			Model model) throws Exception
	{
		model.addAttribute(service.read(bno));
	}
	
	@RequestMapping(value="/modifyPage",method=RequestMethod.POST)
	public String modifyPagingPOST(BoardVO2 board,
			SearchCriteria2 cri,
			RedirectAttributes rttr) throws Exception{
		
		logger.info(cri.toString());
		service.modify(board);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("msg","SUCCESS");
		
		logger.info(rttr.toString());
		
		return "redirect:/review/";
	}
	
	@RequestMapping("/getAttach/{bno}")
	@ResponseBody
	public List<String> getAttach(@PathVariable("bno") Integer bno)throws Exception{
	return service.getAttach(bno);
}
	
}
