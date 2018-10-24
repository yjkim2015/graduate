package com.graduate.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.graduate.croller.Web;
import com.graduate.domain.BoardVO;
import com.graduate.domain.BoardVO3;
import com.graduate.domain.PageMaker;
import com.graduate.domain.PageMaker4;
import com.graduate.domain.SearchCriteria;
import com.graduate.domain.SearchCriteria4;
import com.graduate.service.BoardService;
import com.graduate.service.BoardService3;


@Controller
@RequestMapping("/information/*")
public class SearchBoardController {

	private static final Logger logger= LoggerFactory.getLogger(SearchBoardController.class);
	
	@Inject 
	private BoardService service;
	@Inject
	private BoardService3 service3;
	String href;
	String href2;
	Web web;
	

	@RequestMapping(value="/register" , method=RequestMethod.GET)
	public void registGET() throws Exception{
		logger.info("regist get ......");
	}
	
	@RequestMapping(value="/register" , method=RequestMethod.POST)
	public String registPOST(BoardVO board, RedirectAttributes rttr)
			throws Exception{
		logger.info("regist post ......");
		logger.info(board.toString());
		
		service.regist(board);
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/information/";
	}
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String infor(@ModelAttribute("cri") SearchCriteria cri,
			Model model) throws Exception{
		
		logger.info(cri.toString());

		model.addAttribute("list",service.listSearchCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listSearchCount(cri));
		model.addAttribute("pageMaker",pageMaker);
		return "/information/information";
	}
	
	@RequestMapping(value="/readPage",method=RequestMethod.GET)
	public void read(@RequestParam("bno") int bno,
			@ModelAttribute("cri") SearchCriteria cri, Model model,@RequestParam("title") String title)
		throws Exception{
		String[] arrhref = null;
		String[] arrhref2=null;
		String go=null;
		String url=null;
		int count=1;
		if(title.equals("홍콩")) {
			url="http://www.tourtips.com/dest/list/1001_hongkong?type=place&page=1";
		}else if(title.equals("홍콩-1")) {
			url="http://www.tourtips.com/dest/list/1001_hongkong?type=place&page=2";
		}
		else if(title.equals("홍콩-2")) {
			url="http://www.tourtips.com/dest/list/1001_hongkong?type=place&page=2";
		}
		else if(title.equals("홍콩-3")) {
			url="http://www.tourtips.com/dest/list/1001_hongkong?type=place&page=3";
		}else if(title.equals("홍콩-4")) {
			url="http://www.tourtips.com/dest/list/1001_hongkong?type=place&page=4";
		}else if(title.equals("홍콩-5")) {
			url="http://www.tourtips.com/dest/list/1001_hongkong?type=place&page=5";
		}else if(title.equals("홍콩-6")) {
			url="http://www.tourtips.com/dest/list/1001_hongkong?type=place&page=6";
		}else if(title.equals("마카오")) {
			url="http://www.tourtips.com/dest/list/1008_macau?type=place";
		}else if(title.equals("마카오-1")) {
			url="http://www.tourtips.com/dest/list/1008_macau?type=place";
		}else if(title.equals("마카오-2")) {
			url="http://www.tourtips.com/dest/list/1008_macau?type=place&page=2";
		}else if(title.equals("마카오-3")) {
			url="http://www.tourtips.com/dest/list/1008_macau?type=place&page=3";
		}else if(title.equals("오사카")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place";
		}
		else if(title.equals("오사카-1")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place";
		}else if(title.equals("오사카-2")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place&page=2";
		}else if(title.equals("오사카-3")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place&page=3";
		}else if(title.equals("오사카-4")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place&page=4";
		}else if(title.equals("오사카-5")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place&page=5";
		}else if(title.equals("오사카-6")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place&page=6";
		}else if(title.equals("오사카-7")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place&page=7";
		}else if(title.equals("오사카-8")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place&page=8";
		}else if(title.equals("오사카-9")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place&page=9";
		}else if(title.equals("오사카-10")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place&page=10";
		}else if(title.equals("오사카-11")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place&page=11";
		}else if(title.equals("오사카-12")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place&page=12";
		}else if(title.equals("후쿠오카")) {
			url="http://www.tourtips.com/dest/list/1003_fukuoka?type=place";
		}
		else if(title.equals("후쿠오카-1")) {
			url="http://www.tourtips.com/dest/list/1003_fukuoka?type=place";
		}else if(title.equals("후쿠오카-2")) {
			url="http://www.tourtips.com/dest/list/1003_fukuoka?type=place&page=2";
		}else if(title.equals("후쿠오카-3")) {
			url="http://www.tourtips.com/dest/list/1003_fukuoka?type=place&page=3";
		}else if(title.equals("후쿠오카-4")) {
			url="http://www.tourtips.com/dest/list/1003_fukuoka?type=place&page=4";
		}else if(title.equals("도쿄")) {
			url="http://www.tourtips.com/dest/list/1005_tokyo?type=place";
		}
		else if(title.equals("도쿄-1")) {
			url="http://www.tourtips.com/dest/list/1005_tokyo?type=place";
		}else if(title.equals("도쿄-2")) {
			url="http://www.tourtips.com/dest/list/1005_tokyo?type=place&page=2";
		}else if(title.equals("도쿄-3")) {
			url="http://www.tourtips.com/dest/list/1005_tokyo?type=place&page=3";
		}else if(title.equals("도쿄-4")) {
			url="http://www.tourtips.com/dest/list/1005_tokyo?type=place&page=4";
		}else if(title.equals("도쿄-5")) {
			url="http://www.tourtips.com/dest/list/1005_tokyo?type=place&page=5";
		}else if(title.equals("도쿄-6")) {
			url="http://www.tourtips.com/dest/list/1005_tokyo?type=place&page=6";
		}else if(title.equals("오키나와")) {
			url="http://www.tourtips.com/dest/list/1051_okinawa?type=place";
		}else if(title.equals("오키나와-1")) {
			url="http://www.tourtips.com/dest/list/1051_okinawa?type=place&page=1";
		}else if(title.equals("오키나와-2")) {
			url="http://www.tourtips.com/dest/list/1051_okinawa?type=place&page=2";
		}else if(title.equals("오키나와-3")) {
			url="http://www.tourtips.com/dest/list/1051_okinawa?type=place&page=3";
		}else if(title.equals("오키나와-4")) {
			url="http://www.tourtips.com/dest/list/1051_okinawa?type=place&page=4";
		}
		else if(title.equals("타이베이")) {
			url="http://www.tourtips.com/dest/list/1004_taipei?type=place";
		}
		else if(title.equals("타이베이-1")) {
			url="http://www.tourtips.com/dest/list/1004_taipei?type=place";
		}else if(title.equals("타이베이-2")) {
			url="http://www.tourtips.com/dest/list/1004_taipei?type=place&page=2";
		}else if(title.equals("타이베이-3")) {
			url="http://www.tourtips.com/dest/list/1004_taipei?type=place&page=3";
		}else if(title.equals("타이베이-4")) {
			url="http://www.tourtips.com/dest/list/1004_taipei?type=place&page=4";
		}else if(title.equals("타이베이-5")) {
			url="http://www.tourtips.com/dest/list/1004_taipei?type=place&page=5";
		}else if(title.equals("가오슝")) {
			url="http://www.tourtips.com/dest/list/1034_kaohsiung?type=place";
		}
		else if(title.equals("가오슝-1")) {
			url="http://www.tourtips.com/dest/list/1034_kaohsiung?type=place";
		}else if(title.equals("가오슝-2")) {
			url="http://www.tourtips.com/dest/list/1034_kaohsiung?type=place&page=2";
		}else if(title.equals("타이중")) {
			url="http://www.tourtips.com/dest/list/1035_taichung?type=place";
		}
		else if(title.equals("타이중-1")) {
			url="http://www.tourtips.com/dest/list/1035_taichung?type=place";
		}else if(title.equals("타이중-2")) {
			url="http://www.tourtips.com/dest/list/1035_taichung?type=place&page=2";
		}else if(title.equals("베이징(북경)")) {
			url="http://www.tourtips.com/dest/list/1006_beijing?type=place";
		}
		else if(title.equals("베이징(북경)-1")) {
			url="http://www.tourtips.com/dest/list/1006_beijing?type=place";
		}else if(title.equals("베이징(북경)-2")) {
			url="http://www.tourtips.com/dest/list/1006_beijing?type=place&page=2";
		}else if(title.equals("베이징(북경)-3")) {
			url="http://www.tourtips.com/dest/list/1006_beijing?type=place&page=3";
		}else if(title.equals("베이징(북경)-4")) {
			url="http://www.tourtips.com/dest/list/1006_beijing?type=place&page=4";
		}else if(title.equals("베이징(북경)-5")) {
			url="http://www.tourtips.com/dest/list/1006_beijing?type=place&page=5";
		}else if(title.equals("상하이(상해)")) {
			url="http://www.tourtips.com/dest/list/1007_shanghai?type=place";
		}
		else if(title.equals("상하이(상해)-1")) {
			url="http://www.tourtips.com/dest/list/1007_shanghai?type=place";
		}else if(title.equals("상하이(상해)-2")) {
			url="http://www.tourtips.com/dest/list/1007_shanghai?type=place&page=2";
		}else if(title.equals("상하이(상해)-3")) {
			url="http://www.tourtips.com/dest/list/1007_shanghai?type=place&page=3";
		}else if(title.equals("상하이(상해)-4")) {
			url="http://www.tourtips.com/dest/list/1007_shanghai?type=place&page=4";
		}else if(title.equals("상하이(상해)-5")) {
			url="http://www.tourtips.com/dest/list/1007_shanghai?type=place&page=5";
		}else if(title.equals("칭다오(청도)")) {
			url="http://www.tourtips.com/dest/list/1033_qingdao?type=place";
		}
		else if(title.equals("칭다오(청도)-1")) {
			url="http://www.tourtips.com/dest/list/1033_qingdao?type=place";
		}else if(title.equals("칭다오(청도)-2")) {
			url="http://www.tourtips.com/dest/list/1033_qingdao?type=place&page=2";
		}else if(title.equals("칭다오(청도)-3")) {
			url="http://www.tourtips.com/dest/list/1033_qingdao?type=place&page=3";
		}else if(title.equals("황산")) {
			url="http://www.tourtips.com/dest/list/1039_huangshan?type=place";
		}
		else if(title.equals("황산-1")) {
			url="http://www.tourtips.com/dest/list/1039_huangshan?type=place";
		}else if(title.equals("황산-2")) {
			url="http://www.tourtips.com/dest/list/1039_huangshan?type=place&page=2";
		}else if(title.equals("황산-3")) {
			url="http://www.tourtips.com/dest/list/1039_huangshan?type=place&page=3";
		}else if(title.equals("황산-4")) {
			url="http://www.tourtips.com/dest/list/1039_huangshan?type=place&page=4";
		}else if(title.equals("장가계")) {
			url="http://www.tourtips.com/dest/list/1045_zhangjiajie?type=place";
		}
		else if(title.equals("장가계-1")) {
			url="http://www.tourtips.com/dest/list/1045_zhangjiajie?type=place";
		}else if(title.equals("장가계-2")) {
			url="http://www.tourtips.com/dest/list/1045_zhangjiajie?type=place&page=2";
		}else if(title.equals("장가계-3")) {
			url="http://www.tourtips.com/dest/list/1045_zhangjiajie?type=place&page=3";
		}else if(title.equals("장가계-4")) {
			url="http://www.tourtips.com/dest/list/1045_zhangjiajie?type=place&page=4";
		}else if(title.equals("서안")) {
			url="http://www.tourtips.com/dest/list/1048_xian?type=place";
		}
		else if(title.equals("서안-1")) {
			url="http://www.tourtips.com/dest/list/1048_xian?type=place";
		}else if(title.equals("서안-2")) {
			url="http://www.tourtips.com/dest/list/1048_xian?type=place&page=2";
		}else if(title.equals("서안-3")) {
			url="http://www.tourtips.com/dest/list/1048_xian?type=place&page=3";
		}else if(title.equals("서안-4")) {
			url="http://www.tourtips.com/dest/list/1048_xian?type=place&page=4";
		}else if(title.equals("호치민")) {
			url="http://www.tourtips.com/dest/list/1050_hochiminh?type=place";
		}
		else if(title.equals("호치민-1")) {
			url="http://www.tourtips.com/dest/list/1050_hochiminh?type=place";
		}else if(title.equals("호치민-2")) {
			url="http://www.tourtips.com/dest/list/1050_hochiminh?type=place&page=2";
		}else if(title.equals("호치민-3")) {
			url="http://www.tourtips.com/dest/list/1050_hochiminh?type=place&page=3";
		}else if(title.equals("하노이")) {
			url="http://www.tourtips.com/dest/list/1049_hanoi?type=place";
		}
		else if(title.equals("하노이-1")) {
			url="http://www.tourtips.com/dest/list/1049_hanoi?type=place";
		}else if(title.equals("하노이-2")) {
			url="http://www.tourtips.com/dest/list/1049_hanoi?type=place&page=2";
		}else if(title.equals("하노이-3")) {
			url="http://www.tourtips.com/dest/list/1049_hanoi?type=place";
		}else if(title.equals("다낭")) {
			url="http://www.tourtips.com/dest/list/1046_danang?type=place";
		}
		else if(title.equals("다낭-1")) {
			url="http://www.tourtips.com/dest/list/1046_danang?type=place";
		}else if(title.equals("다낭-2")) {
			url="http://www.tourtips.com/dest/list/1046_danang?type=place&page=2";
		}else if(title.equals("라오스")) {
			url="http://www.tourtips.com/dest/list/1042_laos?type=place";
		}
		else if(title.equals("라오스-1")) {
			url="http://www.tourtips.com/dest/list/1042_laos?type=place";
		}else if(title.equals("라오스-2")) {
			url="http://www.tourtips.com/dest/list/1042_laos?type=place&page=2";
		}else if(title.equals("라오스-3")) {
			url="http://www.tourtips.com/dest/list/1042_laos?type=place&page=3";
		}else if(title.equals("라오스-4")) {
			url="http://www.tourtips.com/dest/list/1042_laos?type=place&page=4";
		}else if(title.equals("쿠알라룸푸르")) {
			url="http://www.tourtips.com/dest/list/1041_kualalumpur?type=place";
		}
		else if(title.equals("쿠알라룸푸르-1")) {
			url="http://www.tourtips.com/dest/list/1041_kualalumpur?type=place";
		}else if(title.equals("쿠알라룸푸르-2")) {
			url="http://www.tourtips.com/dest/list/1041_kualalumpur?type=place&page=2";
		}else if(title.equals("페낭")) {
			url="http://www.tourtips.com/dest/list/1040_penang?type=place";
		}
		else if(title.equals("페낭-1")) {
			url="http://www.tourtips.com/dest/list/1040_penang?type=place";
		}else if(title.equals("페낭-2")) {
			url="http://www.tourtips.com/dest/list/1040_penang?type=place=2";
		}else if(title.equals("페낭-3")) {
			url="http://www.tourtips.com/dest/list/1040_penang?type=place=3";
		}else if(title.equals("코타 키나발루")) {
			url="http://www.tourtips.com/dest/list/1032_kotakinabalu?type=place";
		}
		else if(title.equals("코타 키나발루-1")) {
			url="http://www.tourtips.com/dest/list/1032_kotakinabalu?type=place";
		}else if(title.equals("코타 키나발루-2")) {
			url="http://www.tourtips.com/dest/list/1032_kotakinabalu?type=place&page=2";
		}else if(title.equals("마닐라")) {
			url="http://www.tourtips.com/dest/list/1043_manila?type=place";
		}
		else if(title.equals("마닐라-1")) {
			url="http://www.tourtips.com/dest/list/1043_manila?type=place";
		}else if(title.equals("마닐라-2")) {
			url="http://www.tourtips.com/dest/list/1043_manila?type=place&page=2";
		}else if(title.equals("마닐라-3")) {
			url="http://www.tourtips.com/dest/list/1043_manila?type=place&page=3";
		}else if(title.equals("보라카이")) {
			url="http://www.tourtips.com/dest/list/1011_boracay?type=place";
		}
		else if(title.equals("보라카이-1")) {
			url="http://www.tourtips.com/dest/list/1011_boracay?type=place";
		}else if(title.equals("보라카이-2")) {
			url="http://www.tourtips.com/dest/list/1011_boracay?type=place&page=2";
		}else if(title.equals("보라카이-3")) {
			url="http://www.tourtips.com/dest/list/1011_boracay?type=place&page=3";
		}else if(title.equals("세부")) {
			url="http://www.tourtips.com/dest/list/1012_cebu?type=place";
		}
		else if(title.equals("세부-1")) {
			url="http://www.tourtips.com/dest/list/1012_cebu?type=place";
		}else if(title.equals("세부-2")) {
			url="http://www.tourtips.com/dest/list/1012_cebu?type=place&page=2";
		}else if(title.equals("세부-3")) {
			url="http://www.tourtips.com/dest/list/1012_cebu?type=place&page=3";
		}else if(title.equals("푸켓")) {
			url="http://www.tourtips.com/dest/list/1013_phuket?type=place";
		}
		else if(title.equals("푸켓-1")) {
			url="http://www.tourtips.com/dest/list/1013_phuket?type=place";
		}else if(title.equals("푸켓-2")) {
			url="http://www.tourtips.com/dest/list/1013_phuket?type=place&page=2";
		}else if(title.equals("푸켓-3")) {
			url="http://www.tourtips.com/dest/list/1013_phuket?type=place&page=3";
		}else if(title.equals("푸켓-4")) {
			url="http://www.tourtips.com/dest/list/1013_phuket?type=place&page=4";
		}else if(title.equals("방콕")) {
			url="http://www.tourtips.com/dest/list/1010_bangkok?type=place";
		}
		else if(title.equals("방콕-1")) {
			url="http://www.tourtips.com/dest/list/1010_bangkok?type=place";
		}else if(title.equals("방콕-2")) {
			url="http://www.tourtips.com/dest/list/1010_bangkok?type=place&page=2";
		}else if(title.equals("방콕-3")) {
			url="http://www.tourtips.com/dest/list/1010_bangkok?type=place&page=3";
		}else if(title.equals("방콕-4")) {
			url="http://www.tourtips.com/dest/list/1010_bangkok?type=place&page=4";
		}else if(title.equals("방콕-5")) {
			url="http://www.tourtips.com/dest/list/1010_bangkok?type=place&page=5";
		}else if(title.equals("싱가포르")) {
			url="http://www.tourtips.com/dest/list/1009_singapore?type=place";
		}
		else if(title.equals("싱가포르-1")) {
			url="http://www.tourtips.com/dest/list/1009_singapore?type=place";
		}else if(title.equals("싱가포르-2")) {
			url="http://www.tourtips.com/dest/list/1009_singapore?type=place&page=2";
		}else if(title.equals("싱가포르-3")) {
			url="http://www.tourtips.com/dest/list/1009_singapore?type=place&page=3";
		}else if(title.equals("싱가포르-4")) {
			url="http://www.tourtips.com/dest/list/1009_singapore?type=place&page=4";
		}else if(title.equals("싱가포르-5")) {
			url="http://www.tourtips.com/dest/list/1009_singapore?type=place&page=5";
		}else if(title.equals("싱가포르-6")) {
			url="http://www.tourtips.com/dest/list/1009_singapore?type=place&page=6";
		}else if(title.equals("싱가포르-7")) {
			url="http://www.tourtips.com/dest/list/1009_singapore?type=place&page=7";
		}else if(title.equals("블라디보스토크")) {
			url="http://www.tourtips.com/dest/list/1052_vladivostok?type=place";
		}
		else if(title.equals("블라디보스토크-1")) {
			url="http://www.tourtips.com/dest/list/1052_vladivostok?type=place";
		}else if(title.equals("블라디보스토크-2")) {
			url="http://www.tourtips.com/dest/list/1052_vladivostok?type=place&page=2";
		}else if(title.equals("블라디보스토크-3")) {
			url="http://www.tourtips.com/dest/list/1052_vladivostok?type=place&page=3";
		}else if(title.equals("이스탄불")) {
			url="http://www.tourtips.com/dest/list/1019_istanbul?type=place";
		}
		else if(title.equals("이스탄불-1")) {
			url="http://www.tourtips.com/dest/list/1019_istanbul?type=place";
		}else if(title.equals("이스탄불-2")) {
			url="http://www.tourtips.com/dest/list/1019_istanbul?type=place&page=2";
		}else if(title.equals("이스탄불-3")) {
			url="http://www.tourtips.com/dest/list/1019_istanbul?type=place&page=3";
		}else if(title.equals("이스탄불-4")) {
			url="http://www.tourtips.com/dest/list/1019_istanbul?type=place&page=4";
		}else if(title.equals("이스탄불-5")) {
			url="http://www.tourtips.com/dest/list/1019_istanbul?type=place&page=5";
		}else if(title.equals("이스탄불-6")) {
			url="http://www.tourtips.com/dest/list/1019_istanbul?type=place&page=6";
		}else if(title.equals("크로아티아")) {
			url="http://www.tourtips.com/dest/list/1018_croatia?type=place";
		}
		else if(title.equals("크로아티아-1")) {
			url="http://www.tourtips.com/dest/list/1018_croatia?type=place";
		}else if(title.equals("크로아티아-2")) {
			url="http://www.tourtips.com/dest/list/1018_croatia?type=place&page=2";
		}else if(title.equals("크로아티아-3")) {
			url="http://www.tourtips.com/dest/list/1018_croatia?type=place&page=3";
		}else if(title.equals("크로아티아-4")) {
			url="http://www.tourtips.com/dest/list/1018_croatia?type=place&page=4";
		}else if(title.equals("크로아티아-5")) {
			url="http://www.tourtips.com/dest/list/1018_croatia?type=place&page=5";
		}else if(title.equals("크로아티아-6")) {
			url="http://www.tourtips.com/dest/list/1018_croatia?type=place&page=6";
		}else if(title.equals("바르셀로나")) {
			url="http://www.tourtips.com/dest/list/1017_barcelona?type=place";
		}
		else if(title.equals("바르셀로나-1")) {
			url="http://www.tourtips.com/dest/list/1017_barcelona?type=place";
		}else if(title.equals("바로셀로나-2")) {
			url="http://www.tourtips.com/dest/list/1017_barcelona?type=place&page=2";
		}else if(title.equals("바르셀로나-3")) {
			url="http://www.tourtips.com/dest/list/1017_barcelona?type=place&page=3";
		}else if(title.equals("바르셀로나-4")) {
			url="http://www.tourtips.com/dest/list/1017_barcelona?type=place&page=4";
		}else if(title.equals("바르셀로나-5")) {
			url="http://www.tourtips.com/dest/list/1017_barcelona?type=place&page=5";
		}else if(title.equals("런던")) {
			url="http://www.tourtips.com/dest/list/1016_london?type=place";
		}
		else if(title.equals("런던-1")) {
			url="http://www.tourtips.com/dest/list/1016_london?type=place";
		}else if(title.equals("런던-2")) {
			url="http://www.tourtips.com/dest/list/1016_london?type=place&page=2";
		}else if(title.equals("런던-3")) {
			url="http://www.tourtips.com/dest/list/1016_london?type=place&page=3";
		}else if(title.equals("런던-4")) {
			url="http://www.tourtips.com/dest/list/1016_london?type=place&page=4";
		}else if(title.equals("런던-5")) {
			url="http://www.tourtips.com/dest/list/1016_london?type=place&page=5";
		}else if(title.equals("런던-6")) {
			url="http://www.tourtips.com/dest/list/1016_london?type=place&page=6";
		}else if(title.equals("런던-7")) {
			url="http://www.tourtips.com/dest/list/1016_london?type=place&page=7";
		}else if(title.equals("로마")) {
			url="http://www.tourtips.com/dest/list/1015_rome?type=place";
		}
		else if(title.equals("로마-1")) {
			url="http://www.tourtips.com/dest/list/1015_rome?type=place";
		}else if(title.equals("로마-2")) {
			url="http://www.tourtips.com/dest/list/1015_rome?type=place&page=2";
		}else if(title.equals("로마-3")) {
			url="http://www.tourtips.com/dest/list/1015_rome?type=place&page=3";
		}else if(title.equals("로마-4")) {
			url="http://www.tourtips.com/dest/list/1015_rome?type=place&page=4";
		}else if(title.equals("로마-5")) {
			url="http://www.tourtips.com/dest/list/1015_rome?type=place&page=5";
		}else if(title.equals("로마-6")) {
			url="http://www.tourtips.com/dest/list/1015_rome?type=place&page=6";
		}else if(title.equals("파리")) {
			url="http://www.tourtips.com/dest/list/1014_paris?type=place";
		}
		else if(title.equals("파리-1")) {
			url="http://www.tourtips.com/dest/list/1014_paris?type=place";
		}else if(title.equals("파리-2")) {
			url="http://www.tourtips.com/dest/list/1014_paris?type=place&page=2";
		}else if(title.equals("파리-3")) {
			url="http://www.tourtips.com/dest/list/1014_paris?type=place&page=3";
		}else if(title.equals("파리-4")) {
			url="http://www.tourtips.com/dest/list/1014_paris?type=place&page=4";
		}else if(title.equals("파리-5")) {
			url="http://www.tourtips.com/dest/list/1014_paris?type=place&page=5";
		}else if(title.equals("파리-6")) {
			url="http://www.tourtips.com/dest/list/1014_paris?type=place&page=6";
		}else if(title.equals("미서부")) {
			url="http://www.tourtips.com/dest/list/1022_westernamerica?type=place";
		}
		else if(title.equals("미서부-1")) {
			url="http://www.tourtips.com/dest/list/1022_westernamerica?type=place";
		}else if(title.equals("미서부-2")) {
			url="http://www.tourtips.com/dest/list/1022_westernamerica?type=place&page=2";
		}else if(title.equals("미서부-3")) {
			url="http://www.tourtips.com/dest/list/1022_westernamerica?type=place&page=3";
		}else if(title.equals("미서부-4")) {
			url="http://www.tourtips.com/dest/list/1022_westernamerica?type=place&page=4";
		}else if(title.equals("미서부-5")) {
			url="http://www.tourtips.com/dest/list/1022_westernamerica?type=place&page=5";
		}else if(title.equals("미서부-6")) {
			url="http://www.tourtips.com/dest/list/1022_westernamerica?type=place&page=6";
		}else if(title.equals("하와이")) {
			url="http://www.tourtips.com/dest/list/1020_hawaii?type=place";
		}
		else if(title.equals("하와이-1")) {
			url="http://www.tourtips.com/dest/list/1020_hawaii?type=place";
		}else if(title.equals("하와이-2")) {
			url="http://www.tourtips.com/dest/list/1020_hawaii?type=place&page=2";
		}else if(title.equals("하와이-3")) {
			url="http://www.tourtips.com/dest/list/1020_hawaii?type=place&page=3";
		}else if(title.equals("하와이-4")) {
			url="http://www.tourtips.com/dest/list/1020_hawaii?type=place&page=4";
		}else if(title.equals("하와이-5")) {
			url="http://www.tourtips.com/dest/list/1020_hawaii?type=place&page=5";
		}else if(title.equals("하와이-6")) {
			url="http://www.tourtips.com/dest/list/1020_hawaii?type=place&page=6";
		}else if(title.equals("하와이-7")) {
			url="http://www.tourtips.com/dest/list/1020_hawaii?type=place&page=7";
		}else if(title.equals("하와이-8")) {
			url="http://www.tourtips.com/dest/list/1020_hawaii?type=place&page=8";
		}else if(title.equals("하와이-9")) {
			url="http://www.tourtips.com/dest/list/1020_hawaii?type=place&page=9";
		}else if(title.equals("뉴욕")) {
			url="http://www.tourtips.com/dest/list/1021_newyork?type=place";
		}
		else if(title.equals("뉴욕-1")) {
			url="http://www.tourtips.com/dest/list/1021_newyork?type=place";
		}else if(title.equals("뉴욕-2")) {
			url="http://www.tourtips.com/dest/list/1021_newyork?type=place&page=2";
		}else if(title.equals("뉴욕-3")) {
			url="http://www.tourtips.com/dest/list/1021_newyork?type=place&page=3";
		}else if(title.equals("뉴욕-4")) {
			url="http://www.tourtips.com/dest/list/1021_newyork?type=place&page=4";
		}else if(title.equals("뉴욕-5")) {
			url="http://www.tourtips.com/dest/list/1021_newyork?type=place&page=5";
		}else if(title.equals("뉴욕-6")) {
			url="http://www.tourtips.com/dest/list/1021_newyork?type=place&page=6";
		}
		else if(title.equals("괌")) {
			url="http://www.tourtips.com/dest/list/1024_guam?type=place";
		}
		else if(title.equals("괌-1")) {
			url="http://www.tourtips.com/dest/list/1024_guam?type=place";
		}
		else if(title.equals("괌-2")) {
			url="http://www.tourtips.com/dest/list/1024_guam?type=place&page=2";
		}
		else if(title.equals("괌-3")) {
			url="http://www.tourtips.com/dest/list/1024_guam?type=place&page=3";
		}
		else if(title.equals("괌-4")) {
			url="http://www.tourtips.com/dest/list/1024_guam?type=place&page=4";
		}else if(title.equals("시드니")) {
			url="http://www.tourtips.com/dest/list/1023_sydney?type=place";
		}
		else if(title.equals("시드니-1")) {
			url="http://www.tourtips.com/dest/list/1023_sydney?type=place";
		}else if(title.equals("시드니-2")) {
			url="http://www.tourtips.com/dest/list/1023_sydney?type=place&page=2";
		}else if(title.equals("시드니-3")) {
			url="http://www.tourtips.com/dest/list/1023_sydney?type=place&page=3";
		}else if(title.equals("시드니-4")) {
			url="http://www.tourtips.com/dest/list/1023_sydney?type=place&page=4";
		}else if(title.equals("시드니-5")) {
			url="http://www.tourtips.com/dest/list/1023_sydney?type=place&page=5";
		}else if(title.equals("시드니-6")) {
			url="http://www.tourtips.com/dest/list/1023_sydney?type=place&page=6";
		}
		
		
		List<Map> list = new ArrayList<Map>();
		try {
			
			
			Document rawData =Jsoup.connect(url)
					.timeout(5000)
					.get();
			Elements articles = rawData.select("[class=spot_list] li img");
			Elements articles2= rawData.select("[class=spot_list] li [class=title]");
			Elements articles3= rawData.select("[class=spot_list] li [class=info] p");
			
			String str="";
			String str2="";
			String str3[];
			String str4[];
			String str5="";
			String str6[];
			for(int i=0;i<articles3.size();i++) {
				if(i%2!=0) {
					str2+=articles3.get(i).toString();
				}else
				{
					str+=articles3.get(i).toString();
				}
				
			}
			str3=str2.split("</p>");
			str4=str.split("</p>");
		
			for(int i=0;i<str3.length;i++) {
				str3[i]+="</p>";
				str4[i]+="</p>";
				System.out.println(str4[i]);
			}

//			for(int i=0;i<articles2.size();i++) {
//				str5+=articles2.get(i).toString();
//			}
//			
//			str6=str5.split("</strong>");
//			
//			for(int i=0;i<str6.length;i++) {
//				str3[i]+=str6[i];
//				System.out.println(str3[i]);
//			}
			for (int i = 0; i < articles.size(); i++) {
				
				Map<String, String> map = new HashMap<String,String>();

				map.put("img", articles.get(i).attr("src"));
				map.put("title", articles2.get(i).toString());
				map.put("detail1",str3[i]);
				map.put("detail2",str4[i]);
				list.add(map);
			
		}
		}
		
//			href=articles.toString();
//			href2=articles2.toString();
//			href=href.replace("<", "<p><");
//			href=href.replace(">", " width=700px height=500px></p>");
//			
//			
//			 arrhref=href.split("\n");
//			 arrhref2=href2.split("\n");
//			
//			for(int i=0;i<arrhref.length;i++) {
//			
//			arrhref[i]="<div>"+arrhref[i]+arrhref2[i];
//			
//			System.out.println(arrhref[i]);
//			}
//			go=arrhref[0];
//			for(int i=1;i<arrhref.length;i++) {
//				go+=arrhref[i];
//			
//			}
			
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		model.addAttribute("list", list);
		
//		model.addAttribute("href",go);
//		model.addAttribute("href2",href2);
		model.addAttribute(service.read(bno));
		

	}
	
	@RequestMapping(value="/removePage",method=RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno,
			SearchCriteria cri,
			RedirectAttributes rttr) throws Exception{
		
		service.remove(bno);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("msg","SUCCESS");
		return "redirect:/information/";
	}
	
	@RequestMapping(value="/modifyPage",method=RequestMethod.GET)
	public void modifyPagingGET(int bno,
			@ModelAttribute("cri") SearchCriteria cri,
			Model model) throws Exception
	{
		model.addAttribute(service.read(bno));
	}
	
	@RequestMapping(value="/modifyPage",method=RequestMethod.POST)
	public String modifyPagingPOST(BoardVO board,
			SearchCriteria cri,
			RedirectAttributes rttr) throws Exception{
		
		logger.info(cri.toString());
		service.modify(board);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("msg","SUCCESS");
		
		logger.info(rttr.toString());
		
		return "redirect:/information/";
	}
	
	@RequestMapping("/getAttach/{bno}")
		@ResponseBody
		public List<String> getAttach(@PathVariable("bno") Integer bno)throws Exception{
		return service.getAttach(bno);
	}
}
