package com.graduate.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
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

import com.graduate.domain.BoardVO;
import com.graduate.domain.BoardVO3;
import com.graduate.domain.BoardVO4;
import com.graduate.domain.Criteria;
import com.graduate.domain.PageMaker;
import com.graduate.domain.PageMaker4;
import com.graduate.domain.PageMaker5;
import com.graduate.domain.SearchCriteria4;
import com.graduate.domain.SearchCriteria5;
import com.graduate.service.BoardService4;


@Controller
@RequestMapping(value="/help/")
public class HelpController {
	
	private static final Logger logger=LoggerFactory.getLogger(HelpController.class);

	@Inject
	private BoardService4 service4;

	@RequestMapping(value="/",method=RequestMethod.GET)
	public String food(@ModelAttribute("cri") SearchCriteria5 cri,
			Model model) throws Exception{
		logger.info(cri.toString());

		model.addAttribute("list7",service4.listSearchCriteria(cri));
		PageMaker5 pageMaker = new PageMaker5();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service4.listSearchCount(cri));
		model.addAttribute("pageMaker",pageMaker);

		return "/help/help";
	}
	
	@RequestMapping(value="/register" , method=RequestMethod.GET)
	public void foodregistGET() throws Exception{
		logger.info("regist get ......");
	}
	
	@RequestMapping(value="/register" , method=RequestMethod.POST)
	public String foodregistPOST(BoardVO4 board, RedirectAttributes rttr)
			throws Exception{
		logger.info("regist post ......");
		logger.info(board.toString());
		
		service4.regist(board);
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/help/";
	}
	@RequestMapping(value="/readPage",method=RequestMethod.GET)
	public void foodread(@RequestParam("bno") int bno,
			@ModelAttribute("cri") SearchCriteria5 cri, Model model,@RequestParam("title") String title)
		throws Exception{
		
		
		
		model.addAttribute(service4.read(bno));
	
	}
	
	@RequestMapping(value="/removePage",method=RequestMethod.POST)
	public String foodremove(@RequestParam("bno") int bno,
			SearchCriteria5 cri,
			RedirectAttributes rttr) throws Exception{
		
		service4.remove(bno);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("msg","SUCCESS");
		return "redirect:/help/";
	}
	@RequestMapping(value="/modifyPage",method=RequestMethod.GET)
	public void foodmodifyPagingGET(int bno,
			@ModelAttribute("cri") SearchCriteria5 cri,
			Model model) throws Exception
	{
		model.addAttribute(service4.read(bno));
	}
	
	@RequestMapping(value="/modifyPage",method=RequestMethod.POST)
	public String foodmodifyPagingPOST(BoardVO4 board,
			SearchCriteria5 cri,
			RedirectAttributes rttr) throws Exception{
		
		logger.info(cri.toString());
		service4.modify(board);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("msg","SUCCESS");
		
		logger.info(rttr.toString());
		
		return "redirect:/help/";
	}
	


	@RequestMapping("/getAttach/{bno}")
		@ResponseBody
		public List<String> helpgetAttach(@PathVariable("bno") Integer bno)throws Exception{
		return service4.getAttach(bno);
	}



}
