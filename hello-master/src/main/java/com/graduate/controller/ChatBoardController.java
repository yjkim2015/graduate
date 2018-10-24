package com.graduate.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.graduate.croller.Web;
import com.graduate.domain.ChatBoardVO;
import com.graduate.domain.ChatList;
import com.graduate.domain.MemberVO;
import com.graduate.domain.PageMaker3;
import com.graduate.domain.SearchCriteria3;
import com.graduate.service.ChatBoardService;
import com.graduate.util.ChatWebSocketHandler;

@Component
@Controller
@RequestMapping("/together/*")
public class ChatBoardController {

	private static final Logger logger= LoggerFactory.getLogger(ChatBoardController.class);




	@Inject 
	private ChatBoardService service;
	
	
	public String room;
	
	@RequestMapping(value="/register" , method=RequestMethod.GET)
	public void registGET() throws Exception{
		logger.info("regist get ......");
	}
	@RequestMapping(value="/register" , method=RequestMethod.POST)
	public String registPOST(ChatBoardVO board, RedirectAttributes rttr)
			throws Exception{
		logger.info("regist post ......");
		logger.info(board.toString());
		
		service.regist(board);
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/together/";
	}
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String infor(@ModelAttribute("cri") SearchCriteria3 cri,
			Model model) throws Exception{
		
		logger.info(cri.toString());

		model.addAttribute("list3",service.listSearchCriteria(cri));
		PageMaker3 pageMaker = new PageMaker3();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listSearchCount(cri));
		model.addAttribute("pageMaker",pageMaker);
		return "/together/together";
	}
	
	@RequestMapping(value="/readPage",method=RequestMethod.GET)
	public void read(@RequestParam("bno") int bno,
			@ModelAttribute("cri") SearchCriteria3 cri, Model model,HttpSession session)
		throws Exception{
		room= Integer.toString(bno);
	
		System.out.println(room+"컨트롤러 ");
		model.addAttribute(service.read(bno));
		
	}
	
	@RequestMapping(value="/removePage",method=RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno,
			SearchCriteria3 cri,
			RedirectAttributes rttr) throws Exception{
		
		service.remove(bno);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("msg","SUCCESS");
		return "redirect:/together/";
	}
	
	@RequestMapping(value="/modifyPage",method=RequestMethod.GET)
	public void modifyPagingGET(int bno,
			@ModelAttribute("cri") SearchCriteria3 cri,
			Model model) throws Exception
	{
		
		model.addAttribute(service.read(bno));
	}
	
	@RequestMapping(value="/modifyPage",method=RequestMethod.POST)
	public String modifyPagingPOST(ChatBoardVO board,
			SearchCriteria3 cri,
			RedirectAttributes rttr) throws Exception{
		
		logger.info(cri.toString());
		service.modify(board);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("msg","SUCCESS");
		
		logger.info(rttr.toString());
		
		return "redirect:/together/";
	}

	@RequestMapping(value="/nameList",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody  Map<String,List<String>> CheckLogin(String chatname,int bno,ChatList chatlist) throws Exception{
	System.out.println("들어왔다");
	Boolean isOkay=false;
	List<ChatList> chat;
	 Map<String,List<String>> map = new HashMap<>();
	 
		List<String> chat2= new ArrayList<String>();
		
		chat = service.chatnameandcount(bno);
		
		 for(int i=0;i<chat.size();i++) {
				if(chat.get(i).getChatname().equals(chatname))
				{
						isOkay=true;
				}
			}
		
		 chatlist.setBno(bno);
		 chatlist.setChatname(chatname);
		 if(isOkay==false) {service.insert(chatlist);}
		 chat = service.chatnameandcount(bno);
		
		 for(int i=0;i<chat.size();i++) {
				chat2.add(chat.get(i).getChatname());
			}
		 
		 map.put("chat2", chat2);
		 System.out.println(chat.size()+"보잉루");
		 System.out.println(chat2.size());
		
		 
		 return map;
		 
	}
	

	@RequestMapping(value="/realnameList",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody  Map<String,List<String>> realCheck(String chatname,int bno,ChatList chatlist) throws Exception{
	System.out.println("들어왔다");
	List<ChatList> chat;
	 Map<String,List<String>> map = new HashMap<>();
	 
		List<String> chat2= new ArrayList<String>();

		 chatlist.setBno(bno);
		 chatlist.setChatname(chatname);
		 chat = service.chatnameandcount(bno);
		
		 for(int i=0;i<chat.size();i++) {
				chat2.add(chat.get(i).getChatname());
			}
		 
		 map.put("chat2", chat2);
		 System.out.println(chat.size()+"보잉루");
		 System.out.println(chat2.size());
		 System.out.println(chat2.get(0));
		 
		 return map;
		 
	}
	
	@RequestMapping(value="/nameremove",method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<String> remove(
			String chatname,int bno,ChatList chatlist) throws Exception{
		System.out.println("컴온");System.out.println("컴온");
		List<String> chat2= new ArrayList<String>();
		List<ChatList> chat;
		 Map<List<String>,String> map = new HashMap<>();


		System.out.println(chatname);
		chatlist.setChatname(chatname);
		
		service.removeName(chatlist);
		chat = service.chatnameandcount(bno);
		for(int i=0;i<chat.size();i++) {
			chat2.add(chat.get(i).getChatname());
		}
		 /*for (int i=0;i<chat.size();i++) {
			 map.put(chat2, chat.get(i).getChatname());
			 System.out.println(chat.get(i).getChatname());
		 }*/
		 System.out.println(chat.size()+"보잉루");
		 System.out.println(chat2.size());
		 System.out.println(chat2.get(0));
		 return chat2;
	
	}
}
