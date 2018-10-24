package com.graduate.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.graduate.croller.Web;
import com.graduate.domain.BoardVO;
import com.graduate.domain.MemberVO;
import com.graduate.domain.PageMaker;
import com.graduate.domain.SearchCriteria;
import com.graduate.service.BoardService;
import com.graduate.service.MemberService;


@Controller
@RequestMapping("/membership")
public class MembershipController {


	@Inject 
	private MemberService service;

	private static final Logger logger= LoggerFactory.getLogger(MembershipController.class);
	
	public static final String ZIPCODE_API_KEY = "401652aa7e13e7fa31534997356246";
    // api를 쓰기 위한 주소
    public static final String ZIPCODE_API_URL = "http://biz.epost.go.kr/KpostPortal/openapi";
	
	@RequestMapping(value="/member",method=RequestMethod.GET)
	public String membership(Model model) {

		
		return "membership";
	}
	@RequestMapping(value="/member",method=RequestMethod.POST)
	public String memberShip(MemberVO member, RedirectAttributes rttr,Model model,@RequestParam("emailaddr") String emailadd) throws Exception
	{
		logger.info("회원가입...");
		logger.info(member.toString());
		String addemail=emailadd;
		if(addemail=="") {
		member.setFullemail(member.getEmail1()+"@"+member.getEmail2());}
		else {
			member.setFullemail(member.getEmail1()+"@"+addemail);
		}
		System.out.println(member.getFullemail());
		service.create(member);
		rttr.addFlashAttribute("authmsg","가입 시 사용한 이메일을 인증해주세요");
		String name=member.getName1();
		model.addAttribute("name",name);

		return "welcome";
		
		}
		
	@RequestMapping(value="/checkId",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int idCheck(MemberVO member,Model model) throws Exception {
		return service.check(member);
	}
	
	@RequestMapping(value="/emailConfirm",method=RequestMethod.GET)
	public String emailConfirm(String fullemail,Model model,String email,MemberVO member)throws Exception{
		String checkemail = email;
		System.out.println(member.getEmailCheck());
		member.setFullemail(checkemail);
		member.setEmailCheck(true);
		service.updateEmail(member);
		System.out.println(member.getEmailCheck());
		System.out.println("이메일 인증 버튼 눌렀음");
		
		member=service.getEmailCheck(member);

		System.out.println(member.getFullemail());
		System.out.println(member.getName1());
		System.out.println(member.getEmailCheck());
		model.addAttribute("user_email",fullemail);
		return "welcome2";
		
	}
	@RequestMapping(value="/Login",method=RequestMethod.GET)
		public String Login() {
			return "Login";
		}
	@RequestMapping(value="/checkLogin",method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int CheckLogin(MemberVO member,Model model,HttpSession session) throws Exception{
		int check =service.checkLogin(member);
		String name=null;
		boolean emailcheck=false;

		if(check==2) {
			name=service.getNaming(member);
			emailcheck=service.userAuth(member);
			System.out.println(emailcheck);
		}
		if(emailcheck==true)
		{
			check=3;
		}
		session.setAttribute("id", member.getId());
		session.setAttribute("name", name);
		
		return check;
}
	@RequestMapping(value="/welcome3",method=RequestMethod.GET)
	public String welcome() {
		return "welcome3";
	}
	@RequestMapping(value="/checkPost",method= {RequestMethod.GET})
	public String checkPost()
	{
		return "checkPost";
	}
	@RequestMapping(value="/zip_codeList",method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody String zip_codelist(@RequestParam("query") String query) throws Exception {
			System.out.println("경로로들어온다");
			
	        Map<String, Object> paramMap = new HashMap<String, Object>();
	        StringBuilder queryUrl = new StringBuilder();
	        queryUrl.append(ZIPCODE_API_URL);
	        queryUrl.append("?regkey=");
	        queryUrl.append(ZIPCODE_API_KEY);
	        queryUrl.append("&target=");
	        queryUrl.append("postNew");
	        queryUrl.append("&query=");
	        queryUrl.append(query.replaceAll(" ", ""));
	        queryUrl.append("&countPerPage="+50);
	        System.out.println(queryUrl.toString());
	        // document 선언
	        Document document = Jsoup.connect(queryUrl.toString()).get();
	        System.out.println(document.toString());
	        // errorCode 선언
	        String errorCode = document.select("error_code").text();
	        
	        if(null == errorCode || "".equals(errorCode))
	        {
	            Elements elements = document.select("item");
	            System.out.println(elements+"왜안되냐 열받아죽겟네");
	            Elements elements2=document.select("totalCount");
	            System.out.println(elements2);
	            List<zip_codeVO> list = new ArrayList<zip_codeVO>();
	            zip_codeVO zip_codeVO = null;
	            
	            for(Element element : elements){
	                zip_codeVO = new zip_codeVO();
	                zip_codeVO.setZipcode(element.select("postcd").text());
	                // 지번 검색
	                zip_codeVO.setAddress(element.select("address").text());
	                list.add(zip_codeVO);
	            }
	            // list 결과 put
	            paramMap.put("list", list);
	        }else{
	            String errorMessage = document.select("message").text();
	            paramMap.put("errorCode", errorCode);
	            paramMap.put("errorMessage", errorMessage);
	        }
	        // Gson형태로 paramMap 리턴
	        return (new Gson()).toJson(paramMap);
	    }


	}

//** 이하경로 // * 1개의 경로