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
		if(title.equals("ȫ��")) {
			url="http://www.tourtips.com/dest/list/1001_hongkong?type=place&page=1";
		}else if(title.equals("ȫ��-1")) {
			url="http://www.tourtips.com/dest/list/1001_hongkong?type=place&page=2";
		}
		else if(title.equals("ȫ��-2")) {
			url="http://www.tourtips.com/dest/list/1001_hongkong?type=place&page=2";
		}
		else if(title.equals("ȫ��-3")) {
			url="http://www.tourtips.com/dest/list/1001_hongkong?type=place&page=3";
		}else if(title.equals("ȫ��-4")) {
			url="http://www.tourtips.com/dest/list/1001_hongkong?type=place&page=4";
		}else if(title.equals("ȫ��-5")) {
			url="http://www.tourtips.com/dest/list/1001_hongkong?type=place&page=5";
		}else if(title.equals("ȫ��-6")) {
			url="http://www.tourtips.com/dest/list/1001_hongkong?type=place&page=6";
		}else if(title.equals("��ī��")) {
			url="http://www.tourtips.com/dest/list/1008_macau?type=place";
		}else if(title.equals("��ī��-1")) {
			url="http://www.tourtips.com/dest/list/1008_macau?type=place";
		}else if(title.equals("��ī��-2")) {
			url="http://www.tourtips.com/dest/list/1008_macau?type=place&page=2";
		}else if(title.equals("��ī��-3")) {
			url="http://www.tourtips.com/dest/list/1008_macau?type=place&page=3";
		}else if(title.equals("����ī")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place";
		}
		else if(title.equals("����ī-1")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place";
		}else if(title.equals("����ī-2")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place&page=2";
		}else if(title.equals("����ī-3")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place&page=3";
		}else if(title.equals("����ī-4")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place&page=4";
		}else if(title.equals("����ī-5")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place&page=5";
		}else if(title.equals("����ī-6")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place&page=6";
		}else if(title.equals("����ī-7")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place&page=7";
		}else if(title.equals("����ī-8")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place&page=8";
		}else if(title.equals("����ī-9")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place&page=9";
		}else if(title.equals("����ī-10")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place&page=10";
		}else if(title.equals("����ī-11")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place&page=11";
		}else if(title.equals("����ī-12")) {
			url="http://www.tourtips.com/dest/list/1002_osaka?type=place&page=12";
		}else if(title.equals("�����ī")) {
			url="http://www.tourtips.com/dest/list/1003_fukuoka?type=place";
		}
		else if(title.equals("�����ī-1")) {
			url="http://www.tourtips.com/dest/list/1003_fukuoka?type=place";
		}else if(title.equals("�����ī-2")) {
			url="http://www.tourtips.com/dest/list/1003_fukuoka?type=place&page=2";
		}else if(title.equals("�����ī-3")) {
			url="http://www.tourtips.com/dest/list/1003_fukuoka?type=place&page=3";
		}else if(title.equals("�����ī-4")) {
			url="http://www.tourtips.com/dest/list/1003_fukuoka?type=place&page=4";
		}else if(title.equals("����")) {
			url="http://www.tourtips.com/dest/list/1005_tokyo?type=place";
		}
		else if(title.equals("����-1")) {
			url="http://www.tourtips.com/dest/list/1005_tokyo?type=place";
		}else if(title.equals("����-2")) {
			url="http://www.tourtips.com/dest/list/1005_tokyo?type=place&page=2";
		}else if(title.equals("����-3")) {
			url="http://www.tourtips.com/dest/list/1005_tokyo?type=place&page=3";
		}else if(title.equals("����-4")) {
			url="http://www.tourtips.com/dest/list/1005_tokyo?type=place&page=4";
		}else if(title.equals("����-5")) {
			url="http://www.tourtips.com/dest/list/1005_tokyo?type=place&page=5";
		}else if(title.equals("����-6")) {
			url="http://www.tourtips.com/dest/list/1005_tokyo?type=place&page=6";
		}else if(title.equals("��Ű����")) {
			url="http://www.tourtips.com/dest/list/1051_okinawa?type=place";
		}else if(title.equals("��Ű����-1")) {
			url="http://www.tourtips.com/dest/list/1051_okinawa?type=place&page=1";
		}else if(title.equals("��Ű����-2")) {
			url="http://www.tourtips.com/dest/list/1051_okinawa?type=place&page=2";
		}else if(title.equals("��Ű����-3")) {
			url="http://www.tourtips.com/dest/list/1051_okinawa?type=place&page=3";
		}else if(title.equals("��Ű����-4")) {
			url="http://www.tourtips.com/dest/list/1051_okinawa?type=place&page=4";
		}
		else if(title.equals("Ÿ�̺���")) {
			url="http://www.tourtips.com/dest/list/1004_taipei?type=place";
		}
		else if(title.equals("Ÿ�̺���-1")) {
			url="http://www.tourtips.com/dest/list/1004_taipei?type=place";
		}else if(title.equals("Ÿ�̺���-2")) {
			url="http://www.tourtips.com/dest/list/1004_taipei?type=place&page=2";
		}else if(title.equals("Ÿ�̺���-3")) {
			url="http://www.tourtips.com/dest/list/1004_taipei?type=place&page=3";
		}else if(title.equals("Ÿ�̺���-4")) {
			url="http://www.tourtips.com/dest/list/1004_taipei?type=place&page=4";
		}else if(title.equals("Ÿ�̺���-5")) {
			url="http://www.tourtips.com/dest/list/1004_taipei?type=place&page=5";
		}else if(title.equals("������")) {
			url="http://www.tourtips.com/dest/list/1034_kaohsiung?type=place";
		}
		else if(title.equals("������-1")) {
			url="http://www.tourtips.com/dest/list/1034_kaohsiung?type=place";
		}else if(title.equals("������-2")) {
			url="http://www.tourtips.com/dest/list/1034_kaohsiung?type=place&page=2";
		}else if(title.equals("Ÿ����")) {
			url="http://www.tourtips.com/dest/list/1035_taichung?type=place";
		}
		else if(title.equals("Ÿ����-1")) {
			url="http://www.tourtips.com/dest/list/1035_taichung?type=place";
		}else if(title.equals("Ÿ����-2")) {
			url="http://www.tourtips.com/dest/list/1035_taichung?type=place&page=2";
		}else if(title.equals("����¡(�ϰ�)")) {
			url="http://www.tourtips.com/dest/list/1006_beijing?type=place";
		}
		else if(title.equals("����¡(�ϰ�)-1")) {
			url="http://www.tourtips.com/dest/list/1006_beijing?type=place";
		}else if(title.equals("����¡(�ϰ�)-2")) {
			url="http://www.tourtips.com/dest/list/1006_beijing?type=place&page=2";
		}else if(title.equals("����¡(�ϰ�)-3")) {
			url="http://www.tourtips.com/dest/list/1006_beijing?type=place&page=3";
		}else if(title.equals("����¡(�ϰ�)-4")) {
			url="http://www.tourtips.com/dest/list/1006_beijing?type=place&page=4";
		}else if(title.equals("����¡(�ϰ�)-5")) {
			url="http://www.tourtips.com/dest/list/1006_beijing?type=place&page=5";
		}else if(title.equals("������(����)")) {
			url="http://www.tourtips.com/dest/list/1007_shanghai?type=place";
		}
		else if(title.equals("������(����)-1")) {
			url="http://www.tourtips.com/dest/list/1007_shanghai?type=place";
		}else if(title.equals("������(����)-2")) {
			url="http://www.tourtips.com/dest/list/1007_shanghai?type=place&page=2";
		}else if(title.equals("������(����)-3")) {
			url="http://www.tourtips.com/dest/list/1007_shanghai?type=place&page=3";
		}else if(title.equals("������(����)-4")) {
			url="http://www.tourtips.com/dest/list/1007_shanghai?type=place&page=4";
		}else if(title.equals("������(����)-5")) {
			url="http://www.tourtips.com/dest/list/1007_shanghai?type=place&page=5";
		}else if(title.equals("Ī�ٿ�(û��)")) {
			url="http://www.tourtips.com/dest/list/1033_qingdao?type=place";
		}
		else if(title.equals("Ī�ٿ�(û��)-1")) {
			url="http://www.tourtips.com/dest/list/1033_qingdao?type=place";
		}else if(title.equals("Ī�ٿ�(û��)-2")) {
			url="http://www.tourtips.com/dest/list/1033_qingdao?type=place&page=2";
		}else if(title.equals("Ī�ٿ�(û��)-3")) {
			url="http://www.tourtips.com/dest/list/1033_qingdao?type=place&page=3";
		}else if(title.equals("Ȳ��")) {
			url="http://www.tourtips.com/dest/list/1039_huangshan?type=place";
		}
		else if(title.equals("Ȳ��-1")) {
			url="http://www.tourtips.com/dest/list/1039_huangshan?type=place";
		}else if(title.equals("Ȳ��-2")) {
			url="http://www.tourtips.com/dest/list/1039_huangshan?type=place&page=2";
		}else if(title.equals("Ȳ��-3")) {
			url="http://www.tourtips.com/dest/list/1039_huangshan?type=place&page=3";
		}else if(title.equals("Ȳ��-4")) {
			url="http://www.tourtips.com/dest/list/1039_huangshan?type=place&page=4";
		}else if(title.equals("�尡��")) {
			url="http://www.tourtips.com/dest/list/1045_zhangjiajie?type=place";
		}
		else if(title.equals("�尡��-1")) {
			url="http://www.tourtips.com/dest/list/1045_zhangjiajie?type=place";
		}else if(title.equals("�尡��-2")) {
			url="http://www.tourtips.com/dest/list/1045_zhangjiajie?type=place&page=2";
		}else if(title.equals("�尡��-3")) {
			url="http://www.tourtips.com/dest/list/1045_zhangjiajie?type=place&page=3";
		}else if(title.equals("�尡��-4")) {
			url="http://www.tourtips.com/dest/list/1045_zhangjiajie?type=place&page=4";
		}else if(title.equals("����")) {
			url="http://www.tourtips.com/dest/list/1048_xian?type=place";
		}
		else if(title.equals("����-1")) {
			url="http://www.tourtips.com/dest/list/1048_xian?type=place";
		}else if(title.equals("����-2")) {
			url="http://www.tourtips.com/dest/list/1048_xian?type=place&page=2";
		}else if(title.equals("����-3")) {
			url="http://www.tourtips.com/dest/list/1048_xian?type=place&page=3";
		}else if(title.equals("����-4")) {
			url="http://www.tourtips.com/dest/list/1048_xian?type=place&page=4";
		}else if(title.equals("ȣġ��")) {
			url="http://www.tourtips.com/dest/list/1050_hochiminh?type=place";
		}
		else if(title.equals("ȣġ��-1")) {
			url="http://www.tourtips.com/dest/list/1050_hochiminh?type=place";
		}else if(title.equals("ȣġ��-2")) {
			url="http://www.tourtips.com/dest/list/1050_hochiminh?type=place&page=2";
		}else if(title.equals("ȣġ��-3")) {
			url="http://www.tourtips.com/dest/list/1050_hochiminh?type=place&page=3";
		}else if(title.equals("�ϳ���")) {
			url="http://www.tourtips.com/dest/list/1049_hanoi?type=place";
		}
		else if(title.equals("�ϳ���-1")) {
			url="http://www.tourtips.com/dest/list/1049_hanoi?type=place";
		}else if(title.equals("�ϳ���-2")) {
			url="http://www.tourtips.com/dest/list/1049_hanoi?type=place&page=2";
		}else if(title.equals("�ϳ���-3")) {
			url="http://www.tourtips.com/dest/list/1049_hanoi?type=place";
		}else if(title.equals("�ٳ�")) {
			url="http://www.tourtips.com/dest/list/1046_danang?type=place";
		}
		else if(title.equals("�ٳ�-1")) {
			url="http://www.tourtips.com/dest/list/1046_danang?type=place";
		}else if(title.equals("�ٳ�-2")) {
			url="http://www.tourtips.com/dest/list/1046_danang?type=place&page=2";
		}else if(title.equals("�����")) {
			url="http://www.tourtips.com/dest/list/1042_laos?type=place";
		}
		else if(title.equals("�����-1")) {
			url="http://www.tourtips.com/dest/list/1042_laos?type=place";
		}else if(title.equals("�����-2")) {
			url="http://www.tourtips.com/dest/list/1042_laos?type=place&page=2";
		}else if(title.equals("�����-3")) {
			url="http://www.tourtips.com/dest/list/1042_laos?type=place&page=3";
		}else if(title.equals("�����-4")) {
			url="http://www.tourtips.com/dest/list/1042_laos?type=place&page=4";
		}else if(title.equals("��˶��Ǫ��")) {
			url="http://www.tourtips.com/dest/list/1041_kualalumpur?type=place";
		}
		else if(title.equals("��˶��Ǫ��-1")) {
			url="http://www.tourtips.com/dest/list/1041_kualalumpur?type=place";
		}else if(title.equals("��˶��Ǫ��-2")) {
			url="http://www.tourtips.com/dest/list/1041_kualalumpur?type=place&page=2";
		}else if(title.equals("�䳶")) {
			url="http://www.tourtips.com/dest/list/1040_penang?type=place";
		}
		else if(title.equals("�䳶-1")) {
			url="http://www.tourtips.com/dest/list/1040_penang?type=place";
		}else if(title.equals("�䳶-2")) {
			url="http://www.tourtips.com/dest/list/1040_penang?type=place=2";
		}else if(title.equals("�䳶-3")) {
			url="http://www.tourtips.com/dest/list/1040_penang?type=place=3";
		}else if(title.equals("��Ÿ Ű���߷�")) {
			url="http://www.tourtips.com/dest/list/1032_kotakinabalu?type=place";
		}
		else if(title.equals("��Ÿ Ű���߷�-1")) {
			url="http://www.tourtips.com/dest/list/1032_kotakinabalu?type=place";
		}else if(title.equals("��Ÿ Ű���߷�-2")) {
			url="http://www.tourtips.com/dest/list/1032_kotakinabalu?type=place&page=2";
		}else if(title.equals("���Ҷ�")) {
			url="http://www.tourtips.com/dest/list/1043_manila?type=place";
		}
		else if(title.equals("���Ҷ�-1")) {
			url="http://www.tourtips.com/dest/list/1043_manila?type=place";
		}else if(title.equals("���Ҷ�-2")) {
			url="http://www.tourtips.com/dest/list/1043_manila?type=place&page=2";
		}else if(title.equals("���Ҷ�-3")) {
			url="http://www.tourtips.com/dest/list/1043_manila?type=place&page=3";
		}else if(title.equals("����ī��")) {
			url="http://www.tourtips.com/dest/list/1011_boracay?type=place";
		}
		else if(title.equals("����ī��-1")) {
			url="http://www.tourtips.com/dest/list/1011_boracay?type=place";
		}else if(title.equals("����ī��-2")) {
			url="http://www.tourtips.com/dest/list/1011_boracay?type=place&page=2";
		}else if(title.equals("����ī��-3")) {
			url="http://www.tourtips.com/dest/list/1011_boracay?type=place&page=3";
		}else if(title.equals("����")) {
			url="http://www.tourtips.com/dest/list/1012_cebu?type=place";
		}
		else if(title.equals("����-1")) {
			url="http://www.tourtips.com/dest/list/1012_cebu?type=place";
		}else if(title.equals("����-2")) {
			url="http://www.tourtips.com/dest/list/1012_cebu?type=place&page=2";
		}else if(title.equals("����-3")) {
			url="http://www.tourtips.com/dest/list/1012_cebu?type=place&page=3";
		}else if(title.equals("Ǫ��")) {
			url="http://www.tourtips.com/dest/list/1013_phuket?type=place";
		}
		else if(title.equals("Ǫ��-1")) {
			url="http://www.tourtips.com/dest/list/1013_phuket?type=place";
		}else if(title.equals("Ǫ��-2")) {
			url="http://www.tourtips.com/dest/list/1013_phuket?type=place&page=2";
		}else if(title.equals("Ǫ��-3")) {
			url="http://www.tourtips.com/dest/list/1013_phuket?type=place&page=3";
		}else if(title.equals("Ǫ��-4")) {
			url="http://www.tourtips.com/dest/list/1013_phuket?type=place&page=4";
		}else if(title.equals("����")) {
			url="http://www.tourtips.com/dest/list/1010_bangkok?type=place";
		}
		else if(title.equals("����-1")) {
			url="http://www.tourtips.com/dest/list/1010_bangkok?type=place";
		}else if(title.equals("����-2")) {
			url="http://www.tourtips.com/dest/list/1010_bangkok?type=place&page=2";
		}else if(title.equals("����-3")) {
			url="http://www.tourtips.com/dest/list/1010_bangkok?type=place&page=3";
		}else if(title.equals("����-4")) {
			url="http://www.tourtips.com/dest/list/1010_bangkok?type=place&page=4";
		}else if(title.equals("����-5")) {
			url="http://www.tourtips.com/dest/list/1010_bangkok?type=place&page=5";
		}else if(title.equals("�̰�����")) {
			url="http://www.tourtips.com/dest/list/1009_singapore?type=place";
		}
		else if(title.equals("�̰�����-1")) {
			url="http://www.tourtips.com/dest/list/1009_singapore?type=place";
		}else if(title.equals("�̰�����-2")) {
			url="http://www.tourtips.com/dest/list/1009_singapore?type=place&page=2";
		}else if(title.equals("�̰�����-3")) {
			url="http://www.tourtips.com/dest/list/1009_singapore?type=place&page=3";
		}else if(title.equals("�̰�����-4")) {
			url="http://www.tourtips.com/dest/list/1009_singapore?type=place&page=4";
		}else if(title.equals("�̰�����-5")) {
			url="http://www.tourtips.com/dest/list/1009_singapore?type=place&page=5";
		}else if(title.equals("�̰�����-6")) {
			url="http://www.tourtips.com/dest/list/1009_singapore?type=place&page=6";
		}else if(title.equals("�̰�����-7")) {
			url="http://www.tourtips.com/dest/list/1009_singapore?type=place&page=7";
		}else if(title.equals("���𺸽���ũ")) {
			url="http://www.tourtips.com/dest/list/1052_vladivostok?type=place";
		}
		else if(title.equals("���𺸽���ũ-1")) {
			url="http://www.tourtips.com/dest/list/1052_vladivostok?type=place";
		}else if(title.equals("���𺸽���ũ-2")) {
			url="http://www.tourtips.com/dest/list/1052_vladivostok?type=place&page=2";
		}else if(title.equals("���𺸽���ũ-3")) {
			url="http://www.tourtips.com/dest/list/1052_vladivostok?type=place&page=3";
		}else if(title.equals("�̽�ź��")) {
			url="http://www.tourtips.com/dest/list/1019_istanbul?type=place";
		}
		else if(title.equals("�̽�ź��-1")) {
			url="http://www.tourtips.com/dest/list/1019_istanbul?type=place";
		}else if(title.equals("�̽�ź��-2")) {
			url="http://www.tourtips.com/dest/list/1019_istanbul?type=place&page=2";
		}else if(title.equals("�̽�ź��-3")) {
			url="http://www.tourtips.com/dest/list/1019_istanbul?type=place&page=3";
		}else if(title.equals("�̽�ź��-4")) {
			url="http://www.tourtips.com/dest/list/1019_istanbul?type=place&page=4";
		}else if(title.equals("�̽�ź��-5")) {
			url="http://www.tourtips.com/dest/list/1019_istanbul?type=place&page=5";
		}else if(title.equals("�̽�ź��-6")) {
			url="http://www.tourtips.com/dest/list/1019_istanbul?type=place&page=6";
		}else if(title.equals("ũ�ξ�Ƽ��")) {
			url="http://www.tourtips.com/dest/list/1018_croatia?type=place";
		}
		else if(title.equals("ũ�ξ�Ƽ��-1")) {
			url="http://www.tourtips.com/dest/list/1018_croatia?type=place";
		}else if(title.equals("ũ�ξ�Ƽ��-2")) {
			url="http://www.tourtips.com/dest/list/1018_croatia?type=place&page=2";
		}else if(title.equals("ũ�ξ�Ƽ��-3")) {
			url="http://www.tourtips.com/dest/list/1018_croatia?type=place&page=3";
		}else if(title.equals("ũ�ξ�Ƽ��-4")) {
			url="http://www.tourtips.com/dest/list/1018_croatia?type=place&page=4";
		}else if(title.equals("ũ�ξ�Ƽ��-5")) {
			url="http://www.tourtips.com/dest/list/1018_croatia?type=place&page=5";
		}else if(title.equals("ũ�ξ�Ƽ��-6")) {
			url="http://www.tourtips.com/dest/list/1018_croatia?type=place&page=6";
		}else if(title.equals("�ٸ����γ�")) {
			url="http://www.tourtips.com/dest/list/1017_barcelona?type=place";
		}
		else if(title.equals("�ٸ����γ�-1")) {
			url="http://www.tourtips.com/dest/list/1017_barcelona?type=place";
		}else if(title.equals("�ٷμ��γ�-2")) {
			url="http://www.tourtips.com/dest/list/1017_barcelona?type=place&page=2";
		}else if(title.equals("�ٸ����γ�-3")) {
			url="http://www.tourtips.com/dest/list/1017_barcelona?type=place&page=3";
		}else if(title.equals("�ٸ����γ�-4")) {
			url="http://www.tourtips.com/dest/list/1017_barcelona?type=place&page=4";
		}else if(title.equals("�ٸ����γ�-5")) {
			url="http://www.tourtips.com/dest/list/1017_barcelona?type=place&page=5";
		}else if(title.equals("����")) {
			url="http://www.tourtips.com/dest/list/1016_london?type=place";
		}
		else if(title.equals("����-1")) {
			url="http://www.tourtips.com/dest/list/1016_london?type=place";
		}else if(title.equals("����-2")) {
			url="http://www.tourtips.com/dest/list/1016_london?type=place&page=2";
		}else if(title.equals("����-3")) {
			url="http://www.tourtips.com/dest/list/1016_london?type=place&page=3";
		}else if(title.equals("����-4")) {
			url="http://www.tourtips.com/dest/list/1016_london?type=place&page=4";
		}else if(title.equals("����-5")) {
			url="http://www.tourtips.com/dest/list/1016_london?type=place&page=5";
		}else if(title.equals("����-6")) {
			url="http://www.tourtips.com/dest/list/1016_london?type=place&page=6";
		}else if(title.equals("����-7")) {
			url="http://www.tourtips.com/dest/list/1016_london?type=place&page=7";
		}else if(title.equals("�θ�")) {
			url="http://www.tourtips.com/dest/list/1015_rome?type=place";
		}
		else if(title.equals("�θ�-1")) {
			url="http://www.tourtips.com/dest/list/1015_rome?type=place";
		}else if(title.equals("�θ�-2")) {
			url="http://www.tourtips.com/dest/list/1015_rome?type=place&page=2";
		}else if(title.equals("�θ�-3")) {
			url="http://www.tourtips.com/dest/list/1015_rome?type=place&page=3";
		}else if(title.equals("�θ�-4")) {
			url="http://www.tourtips.com/dest/list/1015_rome?type=place&page=4";
		}else if(title.equals("�θ�-5")) {
			url="http://www.tourtips.com/dest/list/1015_rome?type=place&page=5";
		}else if(title.equals("�θ�-6")) {
			url="http://www.tourtips.com/dest/list/1015_rome?type=place&page=6";
		}else if(title.equals("�ĸ�")) {
			url="http://www.tourtips.com/dest/list/1014_paris?type=place";
		}
		else if(title.equals("�ĸ�-1")) {
			url="http://www.tourtips.com/dest/list/1014_paris?type=place";
		}else if(title.equals("�ĸ�-2")) {
			url="http://www.tourtips.com/dest/list/1014_paris?type=place&page=2";
		}else if(title.equals("�ĸ�-3")) {
			url="http://www.tourtips.com/dest/list/1014_paris?type=place&page=3";
		}else if(title.equals("�ĸ�-4")) {
			url="http://www.tourtips.com/dest/list/1014_paris?type=place&page=4";
		}else if(title.equals("�ĸ�-5")) {
			url="http://www.tourtips.com/dest/list/1014_paris?type=place&page=5";
		}else if(title.equals("�ĸ�-6")) {
			url="http://www.tourtips.com/dest/list/1014_paris?type=place&page=6";
		}else if(title.equals("�̼���")) {
			url="http://www.tourtips.com/dest/list/1022_westernamerica?type=place";
		}
		else if(title.equals("�̼���-1")) {
			url="http://www.tourtips.com/dest/list/1022_westernamerica?type=place";
		}else if(title.equals("�̼���-2")) {
			url="http://www.tourtips.com/dest/list/1022_westernamerica?type=place&page=2";
		}else if(title.equals("�̼���-3")) {
			url="http://www.tourtips.com/dest/list/1022_westernamerica?type=place&page=3";
		}else if(title.equals("�̼���-4")) {
			url="http://www.tourtips.com/dest/list/1022_westernamerica?type=place&page=4";
		}else if(title.equals("�̼���-5")) {
			url="http://www.tourtips.com/dest/list/1022_westernamerica?type=place&page=5";
		}else if(title.equals("�̼���-6")) {
			url="http://www.tourtips.com/dest/list/1022_westernamerica?type=place&page=6";
		}else if(title.equals("�Ͽ���")) {
			url="http://www.tourtips.com/dest/list/1020_hawaii?type=place";
		}
		else if(title.equals("�Ͽ���-1")) {
			url="http://www.tourtips.com/dest/list/1020_hawaii?type=place";
		}else if(title.equals("�Ͽ���-2")) {
			url="http://www.tourtips.com/dest/list/1020_hawaii?type=place&page=2";
		}else if(title.equals("�Ͽ���-3")) {
			url="http://www.tourtips.com/dest/list/1020_hawaii?type=place&page=3";
		}else if(title.equals("�Ͽ���-4")) {
			url="http://www.tourtips.com/dest/list/1020_hawaii?type=place&page=4";
		}else if(title.equals("�Ͽ���-5")) {
			url="http://www.tourtips.com/dest/list/1020_hawaii?type=place&page=5";
		}else if(title.equals("�Ͽ���-6")) {
			url="http://www.tourtips.com/dest/list/1020_hawaii?type=place&page=6";
		}else if(title.equals("�Ͽ���-7")) {
			url="http://www.tourtips.com/dest/list/1020_hawaii?type=place&page=7";
		}else if(title.equals("�Ͽ���-8")) {
			url="http://www.tourtips.com/dest/list/1020_hawaii?type=place&page=8";
		}else if(title.equals("�Ͽ���-9")) {
			url="http://www.tourtips.com/dest/list/1020_hawaii?type=place&page=9";
		}else if(title.equals("����")) {
			url="http://www.tourtips.com/dest/list/1021_newyork?type=place";
		}
		else if(title.equals("����-1")) {
			url="http://www.tourtips.com/dest/list/1021_newyork?type=place";
		}else if(title.equals("����-2")) {
			url="http://www.tourtips.com/dest/list/1021_newyork?type=place&page=2";
		}else if(title.equals("����-3")) {
			url="http://www.tourtips.com/dest/list/1021_newyork?type=place&page=3";
		}else if(title.equals("����-4")) {
			url="http://www.tourtips.com/dest/list/1021_newyork?type=place&page=4";
		}else if(title.equals("����-5")) {
			url="http://www.tourtips.com/dest/list/1021_newyork?type=place&page=5";
		}else if(title.equals("����-6")) {
			url="http://www.tourtips.com/dest/list/1021_newyork?type=place&page=6";
		}
		else if(title.equals("��")) {
			url="http://www.tourtips.com/dest/list/1024_guam?type=place";
		}
		else if(title.equals("��-1")) {
			url="http://www.tourtips.com/dest/list/1024_guam?type=place";
		}
		else if(title.equals("��-2")) {
			url="http://www.tourtips.com/dest/list/1024_guam?type=place&page=2";
		}
		else if(title.equals("��-3")) {
			url="http://www.tourtips.com/dest/list/1024_guam?type=place&page=3";
		}
		else if(title.equals("��-4")) {
			url="http://www.tourtips.com/dest/list/1024_guam?type=place&page=4";
		}else if(title.equals("�õ��")) {
			url="http://www.tourtips.com/dest/list/1023_sydney?type=place";
		}
		else if(title.equals("�õ��-1")) {
			url="http://www.tourtips.com/dest/list/1023_sydney?type=place";
		}else if(title.equals("�õ��-2")) {
			url="http://www.tourtips.com/dest/list/1023_sydney?type=place&page=2";
		}else if(title.equals("�õ��-3")) {
			url="http://www.tourtips.com/dest/list/1023_sydney?type=place&page=3";
		}else if(title.equals("�õ��-4")) {
			url="http://www.tourtips.com/dest/list/1023_sydney?type=place&page=4";
		}else if(title.equals("�õ��-5")) {
			url="http://www.tourtips.com/dest/list/1023_sydney?type=place&page=5";
		}else if(title.equals("�õ��-6")) {
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
