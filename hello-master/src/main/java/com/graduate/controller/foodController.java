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
@RequestMapping("/food/*")
public class foodController {
   
   private static final Logger logger= LoggerFactory.getLogger(SearchBoardController.class);

   @Inject
   private BoardService3 service3;
   
   @RequestMapping(value="/",method=RequestMethod.GET)
   public String food(@ModelAttribute("cri") SearchCriteria4 cri,
         Model model) throws Exception{
      logger.info(cri.toString());

      model.addAttribute("list4",service3.listSearchCriteria(cri));
      PageMaker4 pageMaker = new PageMaker4();
      pageMaker.setCri(cri);
      
      pageMaker.setTotalCount(service3.listSearchCount(cri));
      model.addAttribute("pageMaker",pageMaker);

      return "/food/food";
   }
   
   @RequestMapping(value="/register" , method=RequestMethod.GET)
   public void foodregistGET() throws Exception{
      logger.info("regist get ......");
   }
   
   @RequestMapping(value="/food/register" , method=RequestMethod.POST)
   public String foodregistPOST(BoardVO3 board, RedirectAttributes rttr)
         throws Exception{
      logger.info("regist post ......");
      logger.info(board.toString());
      
      service3.regist(board);
      rttr.addFlashAttribute("msg","SUCCESS");
      
      return "redirect:/food/";
   }
   
   @RequestMapping(value="/readPage",method=RequestMethod.GET)
   public void foodread(@RequestParam("bno") int bno,
         @ModelAttribute("cri") SearchCriteria4 cri, Model model,@RequestParam("title") String title)
      throws Exception{
      
      String url=null;
      if(title.equals("홍콩")) 
         url="http://www.tourtips.com/dest/list/1001_hongkong?type=food";
      else if(title.equals("홍콩-1")) {
         url="http://www.tourtips.com/dest/list/1001_hongkong?type=food&page=1";
      }else if(title.equals("홍콩-2")) {
         url="http://www.tourtips.com/dest/list/1001_hongkong?type=food&page=2";
      }else if(title.equals("홍콩-3")) {
         url="http://www.tourtips.com/dest/list/1001_hongkong?type=food&page=3";
      }else if(title.equals("홍콩-4")) {
         url="http://www.tourtips.com/dest/list/1001_hongkong?type=food&page=4";
      }else if(title.equals("홍콩-5")) {
         url="http://www.tourtips.com/dest/list/1001_hongkong?type=food&page=5";
      }else if(title.equals("홍콩-6")) {
         url="http://www.tourtips.com/dest/list/1001_hongkong?type=food&page=6";
      }else if(title.equals("홍콩-7")) {
         url="http://www.tourtips.com/dest/list/1001_hongkong?type=food&page=7";
      }else if(title.equals("마카오")) {
         url="http://www.tourtips.com/dest/list/1008_macau?type=food";
      }else if(title.equals("마카오-1")) {
         url="http://www.tourtips.com/dest/list/1008_macau?type=food&page=1";
      }else if(title.equals("마카오-2")) {
         url="http://www.tourtips.com/dest/list/1008_macau?type=food&page=2";
      }else if(title.equals("오사카")) {
         url="http://www.tourtips.com/dest/list/1002_osaka?type=food";
      }
      else if(title.equals("오사카-1")) {
         url="http://www.tourtips.com/dest/list/1002_osaka?type=food&page=1";
      }else if(title.equals("오사카-2")) {
         url="http://www.tourtips.com/dest/list/1002_osaka?type=food&page=2";
      }else if(title.equals("오사카-3")) {
         url="http://www.tourtips.com/dest/list/1002_osaka?type=food&page=3";
      }else if(title.equals("오사카-4")) {
         url="http://www.tourtips.com/dest/list/1002_osaka?type=food&page=4";
      }else if(title.equals("오사카-5")) {
         url="http://www.tourtips.com/dest/list/1002_osaka?type=food&page=5";
      }else if(title.equals("오사카-6")) {
         url="http://www.tourtips.com/dest/list/1002_osaka?type=food&page=6";
      }else if(title.equals("오사카-7")) {
         url="http://www.tourtips.com/dest/list/1002_osaka?type=food&page=7";
      }else if(title.equals("후쿠오카")) {
         url="http://www.tourtips.com/dest/list/1003_fukuoka?type=food";
      }
      else if(title.equals("후쿠오카-1")) {
         url="http://www.tourtips.com/dest/list/1003_fukuoka?type=food&page=1";
      }else if(title.equals("후쿠오카-2")) {
         url="http://www.tourtips.com/dest/list/1003_fukuoka?type=food&page=2";
      }else if(title.equals("후쿠오카-3")) {
         url="http://www.tourtips.com/dest/list/1003_fukuoka?type=food&page=3";
      }else if(title.equals("후쿠오카-4")) {
         url="http://www.tourtips.com/dest/list/1003_fukuoka?type=food&page=4";
      }else if(title.equals("후쿠오카-5")) {
         url="http://www.tourtips.com/dest/list/1003_fukuoka?type=food&page=5";
      }else if(title.equals("후쿠오카-6")) {
         url="http://www.tourtips.com/dest/list/1003_fukuoka?type=food&page=6";
      }else if(title.equals("도쿄")) {
         url="http://www.tourtips.com/dest/list/1005_tokyo?type=food";
      }
      else if(title.equals("도쿄-1")) {
         url="http://www.tourtips.com/dest/list/1005_tokyo?type=food&page=1";
      }else if(title.equals("도쿄-2")) {
         url="http://www.tourtips.com/dest/list/1005_tokyo?type=food&page=2";
      }else if(title.equals("도쿄-3")) {
         url="http://www.tourtips.com/dest/list/1005_tokyo?type=food&page=3";
      }else if(title.equals("도쿄-4")) {
         url="http://www.tourtips.com/dest/list/1005_tokyo?type=food&page=4";
      }else if(title.equals("도쿄-5")) {
         url="http://www.tourtips.com/dest/list/1005_tokyo?type=food&page=5";
      }else if(title.equals("오키나와")) {
         url="http://www.tourtips.com/dest/list/1051_okinawa?type=food";
      }else if(title.equals("오키나와-1")) {
         url="http://www.tourtips.com/dest/list/1051_okinawa?type=food&page=1";
      }else if(title.equals("오키나와-2")) {
         url="http://www.tourtips.com/dest/list/1051_okinawa?type=food&page=2";
      }else if(title.equals("오키나와-3")) {
         url="http://www.tourtips.com/dest/list/1051_okinawa?type=food&page=3";
      }
      else if(title.equals("타이베이")) {
         url="http://www.tourtips.com/dest/list/1004_taipei?type=food";
      }
      else if(title.equals("타이베이-1")) {
         url="http://www.tourtips.com/dest/list/1004_taipei?type=food&page=1";
      }else if(title.equals("타이베이-2")) {
         url="http://www.tourtips.com/dest/list/1004_taipei?type=food&page=2";
      }else if(title.equals("타이베이-3")) {
         url="http://www.tourtips.com/dest/list/1004_taipei?type=food&page=3";
      }else if(title.equals("가오슝")) {
         url="http://www.tourtips.com/dest/list/1034_kaohsiung?type=food";
      }
      else if(title.equals("타이중")) {
         url="http://www.tourtips.com/dest/list/1035_taichung?type=food";
      }
      else if(title.equals("베이징(북경)")) {
         url="http://www.tourtips.com/dest/list/1006_beijing?type=food";
      }
      else if(title.equals("베이징(북경)-1")) {
         url="http://www.tourtips.com/dest/list/1006_beijing?type=food";
      }else if(title.equals("베이징(북경)-2")) {
         url="http://www.tourtips.com/dest/list/1006_beijing?type=food&page=2";
      }else if(title.equals("상하이(상해)")) {
         url="http://www.tourtips.com/dest/list/1007_shanghai?type=food";
      }
      else if(title.equals("상하이(상해)-1")) {
         url="http://www.tourtips.com/dest/list/1007_shanghai?type=food";
      }else if(title.equals("상하이(상해)-2")) {
         url="http://www.tourtips.com/dest/list/1007_shanghai?type=food&page=2";
      }else if(title.equals("칭다오(청도)")) {
         url="http://www.tourtips.com/dest/list/1033_qingdao?type=food";
      }
      else if(title.equals("황산")) {
         url="http://www.tourtips.com/dest/list/1039_huangshan?type=food";
      }
      else if(title.equals("장가계")) {
         url="http://www.tourtips.com/dest/list/1045_zhangjiajie?type=food";
      }
      else if(title.equals("서안")) {
         url="http://www.tourtips.com/dest/list/1048_xian?type=food";
      }
      else if(title.equals("서안-1")) {
         url="http://www.tourtips.com/dest/list/1048_xian?type=food";
      }else if(title.equals("서안-2")) {
         url="http://www.tourtips.com/dest/list/1048_xian?type=food&page=2";
      }else if(title.equals("호치민")) {
         url="http://www.tourtips.com/dest/list/1050_hochiminh?type=food";
      }
      else if(title.equals("호치민-1")) {
         url="http://www.tourtips.com/dest/list/1050_hochiminh?type=food&page=1";
      }else if(title.equals("호치민-2")) {
         url="http://www.tourtips.com/dest/list/1050_hochiminh?type=food&page=2";
      }else if(title.equals("하노이")) {
         url="http://www.tourtips.com/dest/list/1049_hanoi?type=food";
      }
      else if(title.equals("하노이-1")) {
         url="http://www.tourtips.com/dest/list/1049_hanoi?type=food";
      }else if(title.equals("하노이-2")) {
         url="http://www.tourtips.com/dest/list/1049_hanoi?type=food&page=2";
      }else if(title.equals("다낭")) {
         url="http://www.tourtips.com/dest/list/1046_danang?type=food";
      }
      else if(title.equals("다낭-1")) {
         url="http://www.tourtips.com/dest/list/1046_danang?type=food&page=1";
      }else if(title.equals("다낭-2")) {
         url="http://www.tourtips.com/dest/list/1046_danang?type=food&page=2";
      }else if(title.equals("라오스")) {
         url="http://www.tourtips.com/dest/list/1042_laos?type=food&page=1";
      }
      else if(title.equals("라오스-1")) {
         url="http://www.tourtips.com/dest/list/1042_laos?type=food&page=1";
      }else if(title.equals("라오스-2")) {
         url="http://www.tourtips.com/dest/list/1042_laos?type=food&page=2";
      }else if(title.equals("라오스-3")) {
         url="http://www.tourtips.com/dest/list/1042_laos?type=food&page=3";
      }else if(title.equals("쿠알라룸푸르")) {
         url="http://www.tourtips.com/dest/list/1041_kualalumpur?type=food";
      }
      else if(title.equals("쿠알라룸푸르-1")) {
         url="http://www.tourtips.com/dest/list/1041_kualalumpur?type=food&page=1";
      }else if(title.equals("쿠알라룸푸르-2")) {
         url="http://www.tourtips.com/dest/list/1041_kualalumpur?type=food&page=2";
      }else if(title.equals("페낭")) {
         url="http://www.tourtips.com/dest/list/1040_penang?type=food";
      }
      else if(title.equals("페낭-1")) {
         url="http://www.tourtips.com/dest/list/1040_penang?type=food&page=1";
      }else if(title.equals("페낭-2")) {
         url="http://www.tourtips.com/dest/list/1040_penang?type=food&page=2";
      }else if(title.equals("코타 키나발루")) {
         url="http://www.tourtips.com/dest/list/1032_kotakinabalu?type=food";
      }
      else if(title.equals("코타 키나발루-1")) {
         url="http://www.tourtips.com/dest/list/1032_kotakinabalu?type=food&page=1";
      }else if(title.equals("코타 키나발루-2")) {
         url="http://www.tourtips.com/dest/list/1032_kotakinabalu?type=food&page=2";
      }else if(title.equals("마닐라")) {
         url="http://www.tourtips.com/dest/list/1043_manila?type=food";
      }
      else if(title.equals("마닐라-1")) {
         url="http://www.tourtips.com/dest/list/1043_manila?type=food&page=1";
      }else if(title.equals("마닐라-2")) {
         url="http://www.tourtips.com/dest/list/1043_manila?type=food&page=2";
      }else if(title.equals("마닐라-3")) {
         url="http://www.tourtips.com/dest/list/1043_manila?type=food&page=3";
      }else if(title.equals("보라카이")) {
         url="http://www.tourtips.com/dest/list/1011_boracay?type=food";
      }
      else if(title.equals("보라카이-1")) {
         url="http://www.tourtips.com/dest/list/1011_boracay?type=food&page=1";
      }else if(title.equals("보라카이-2")) {
         url="http://www.tourtips.com/dest/list/1011_boracay?type=food&page=2";
      }else if(title.equals("보라카이-3")) {
         url="http://www.tourtips.com/dest/list/1011_boracay?type=food&page=3";
      }else if(title.equals("보라카이-4")) {
         url="http://www.tourtips.com/dest/list/1011_boracay?type=food&page=4";
      }else if(title.equals("세부")) {
         url="http://www.tourtips.com/dest/list/1012_cebu?type=food&page=1";
      }
      else if(title.equals("세부-1")) {
         url="http://www.tourtips.com/dest/list/1012_cebu?type=food&page=1";
      }else if(title.equals("세부-2")) {
         url="http://www.tourtips.com/dest/list/1012_cebu?type=food&page=2";
      }else if(title.equals("세부-3")) {
         url="http://www.tourtips.com/dest/list/1012_cebu?type=food&page=3";
      }else if(title.equals("푸켓")) {
         url="http://www.tourtips.com/dest/list/1013_phuket?type=food&page=1";
      }
      else if(title.equals("푸켓-1")) {
         url="http://www.tourtips.com/dest/list/1013_phuket?type=food&page=1";
      }else if(title.equals("푸켓-2")) {
         url="http://www.tourtips.com/dest/list/1013_phuket?type=food&page=2";
      }else if(title.equals("푸켓-3")) {
         url="http://www.tourtips.com/dest/list/1013_phuket?type=food&page=3";
      }else if(title.equals("푸켓-4")) {
         url="http://www.tourtips.com/dest/list/1013_phuket?type=food&page=4";
      }else if(title.equals("방콕")) {
         url="http://www.tourtips.com/dest/list/1010_bangkok?type=food&page=1";
      }
      else if(title.equals("방콕-1")) {
         url="http://www.tourtips.com/dest/list/1010_bangkok?type=food&page=1";
      }else if(title.equals("방콕-2")) {
         url="http://www.tourtips.com/dest/list/1010_bangkok?type=food&page=2";
      }else if(title.equals("방콕-3")) {
         url="http://www.tourtips.com/dest/list/1010_bangkok?type=food&page=3";
      }else if(title.equals("방콕-4")) {
         url="http://www.tourtips.com/dest/list/1010_bangkok?type=food&page=4";
      }else if(title.equals("방콕-5")) {
         url="http://www.tourtips.com/dest/list/1010_bangkok?type=food&page=5";
      }else if(title.equals("방콕-5")) {
         url="http://www.tourtips.com/dest/list/1010_bangkok?type=food&page=6";
      }else if(title.equals("싱가포르")) {
         url="http://www.tourtips.com/dest/list/1009_singapore?type=food&page=1";
      }
      else if(title.equals("싱가포르-1")) {
         url="http://www.tourtips.com/dest/list/1009_singapore?type=food&page=1";
      }else if(title.equals("싱가포르-2")) {
         url="http://www.tourtips.com/dest/list/1009_singapore?type=food&page=2";
      }else if(title.equals("싱가포르-3")) {
         url="http://www.tourtips.com/dest/list/1009_singapore?type=food&page=3";
      }else if(title.equals("싱가포르-4")) {
         url="http://www.tourtips.com/dest/list/1009_singapore?type=food&page=4";
      }else if(title.equals("싱가포르-5")) {
         url="http://www.tourtips.com/dest/list/1009_singapore?type=food&page=5";
      }else if(title.equals("싱가포르-6")) {
         url="http://www.tourtips.com/dest/list/1009_singapore?type=food&page=6";
      }else if(title.equals("블라디보스토크")) {
         url="http://www.tourtips.com/dest/list/1052_vladivostok?type=food";
      }
      else if(title.equals("블라디보스토크-1")) {
         url="http://www.tourtips.com/dest/list/1052_vladivostok?type=food&page=1";
      }else if(title.equals("블라디보스토크-2")) {
         url="http://www.tourtips.com/dest/list/1052_vladivostok?type=food&page=2";
      }else if(title.equals("이스탄불")) {
         url="http://www.tourtips.com/dest/list/1019_istanbul?type=food";
      }
      else if(title.equals("이스탄불-1")) {
         url="http://www.tourtips.com/dest/list/1019_istanbul?type=food&page=1";
      }else if(title.equals("이스탄불-2")) {
         url="http://www.tourtips.com/dest/list/1019_istanbul?type=food&page=2";
      }else if(title.equals("크로아티아")) {
         url="http://www.tourtips.com/dest/list/1018_croatia?type=food&page=1";
      }
      else if(title.equals("크로아티아-1")) {
         url="http://www.tourtips.com/dest/list/1018_croatia?type=food&page=1";
      }else if(title.equals("크로아티아-2")) {
         url="http://www.tourtips.com/dest/list/1018_croatia?type=food&page=2";
      }else if(title.equals("바르셀로나")) {
         url="http://www.tourtips.com/dest/list/1017_barcelona?type=food&page=1";
      }
      else if(title.equals("바르셀로나-1")) {
         url="http://www.tourtips.com/dest/list/1017_barcelona?type=food&page=1";
      }else if(title.equals("바로셀로나-2")) {
         url="http://www.tourtips.com/dest/list/1017_barcelona?type=food&page=2";
      }else if(title.equals("바르셀로나-3")) {
         url="http://www.tourtips.com/dest/list/1017_barcelona?type=food&page=3";
      }else if(title.equals("런던")) {
         url="http://www.tourtips.com/dest/list/1016_london?type=food";
      }
      else if(title.equals("런던-1")) {
         url="http://www.tourtips.com/dest/list/1016_london?type=food&page=1";
      }else if(title.equals("런던-2")) {
         url="http://www.tourtips.com/dest/list/1016_london?type=food&page=2";
      }else if(title.equals("런던-3")) {
         url="http://www.tourtips.com/dest/list/1016_london?type=food&page=3";
      }else if(title.equals("로마")) {
         url="http://www.tourtips.com/dest/list/1015_rome?type=food&page=1";
      }
      else if(title.equals("로마-1")) {
         url="http://www.tourtips.com/dest/list/1015_rome?type=food&page=1";
      }else if(title.equals("로마-2")) {
         url="http://www.tourtips.com/dest/list/1015_rome?type=food&page=2";
      }else if(title.equals("로마-3")) {
         url="http://www.tourtips.com/dest/list/1015_rome?type=food&page=3";
      }else if(title.equals("로마-4")) {
         url="http://www.tourtips.com/dest/list/1015_rome?type=food&page=4";
      }else if(title.equals("파리")) {
         url="http://www.tourtips.com/dest/list/1014_paris?type=food&page=1";
      }
      else if(title.equals("파리-1")) {
         url="http://www.tourtips.com/dest/list/1014_paris?type=food&page=1";
      }else if(title.equals("파리-2")) {
         url="http://www.tourtips.com/dest/list/1014_paris?type=food&page=2";
      }else if(title.equals("파리-3")) {
         url="http://www.tourtips.com/dest/list/1014_paris?type=food&page=3";
      }else if(title.equals("파리-4")) {
         url="http://www.tourtips.com/dest/list/1014_paris?type=food&page=4";
      }else if(title.equals("파리-5")) {
         url="http://www.tourtips.com/dest/list/1014_paris?type=food&page=5";
      }else if(title.equals("파리-6")) {
         url="http://www.tourtips.com/dest/list/1014_paris?type=food&page=6";
      }else if(title.equals("미서부")) {
         url="http://www.tourtips.com/dest/list/1022_westernamerica?type=food";
      }
      else if(title.equals("미서부-1")) {
         url="http://www.tourtips.com/dest/list/1022_westernamerica?type=food&page=1";
      }else if(title.equals("미서부-2")) {
         url="http://www.tourtips.com/dest/list/1022_westernamerica?type=food&page=2";
      }else if(title.equals("미서부-3")) {
         url="http://www.tourtips.com/dest/list/1022_westernamerica?type=food&page=3";
      }else if(title.equals("미서부-4")) {
         url="http://www.tourtips.com/dest/list/1022_westernamerica?type=food&page=4";
      }else if(title.equals("미서부-5")) {
         url="http://www.tourtips.com/dest/list/1022_westernamerica?type=food&page=5";
      }else if(title.equals("미서부-6")) {
         url="http://www.tourtips.com/dest/list/1022_westernamerica?type=food&page=6";
      }else if(title.equals("하와이")) {
         url="http://www.tourtips.com/dest/list/1020_hawaii?type=food";
      }
      else if(title.equals("하와이-1")) {
         url="http://www.tourtips.com/dest/list/1020_hawaii?type=food&page=1";
      }else if(title.equals("하와이-2")) {
         url="http://www.tourtips.com/dest/list/1020_hawaii?type=food&page=2";
      }else if(title.equals("하와이-3")) {
         url="http://www.tourtips.com/dest/list/1020_hawaii?type=food&page=3";
      }else if(title.equals("하와이-4")) {
         url="http://www.tourtips.com/dest/list/1020_hawaii?type=food&page=4";
      }else if(title.equals("하와이-5")) {
         url="http://www.tourtips.com/dest/list/1020_hawaii?type=food&page=5";
      }else if(title.equals("하와이-6")) {
         url="http://www.tourtips.com/dest/list/1020_hawaii?type=food&page=6";
      }else if(title.equals("하와이-7")) {
         url="http://www.tourtips.com/dest/list/1020_hawaii?type=food&page=7";
      }else if(title.equals("뉴욕")) {
         url="http://www.tourtips.com/dest/list/1021_newyork?type=food&page=1";
      }
      else if(title.equals("뉴욕-1")) {
         url="http://www.tourtips.com/dest/list/1021_newyork?type=food&page=1";
      }else if(title.equals("뉴욕-2")) {
         url="http://www.tourtips.com/dest/list/1021_newyork?type=food&page=2";
      }else if(title.equals("뉴욕-3")) {
         url="http://www.tourtips.com/dest/list/1021_newyork?type=food&page=3";
      }else if(title.equals("뉴욕-4")) {
         url="http://www.tourtips.com/dest/list/1021_newyork?type=food&page=4";
      }else if(title.equals("뉴욕-5")) {
         url="http://www.tourtips.com/dest/list/1021_newyork?type=food&page=5";
      }else if(title.equals("뉴욕-6")) {
         url="http://www.tourtips.com/dest/list/1021_newyork?type=food&page=6";
      }else if(title.equals("뉴욕-7")) {
         url="http://www.tourtips.com/dest/list/1021_newyork?type=food&page=7";
      }
      else if(title.equals("괌")) {
         url="http://www.tourtips.com/dest/list/1024_guam?type=food";
      }
      else if(title.equals("괌-1")) {
         url="http://www.tourtips.com/dest/list/1024_guam?type=food&page=1";
      }
      else if(title.equals("괌-2")) {
         url="http://www.tourtips.com/dest/list/1024_guam?type=food&page=2";
      }
      else if(title.equals("괌-3")) {
         url="http://www.tourtips.com/dest/list/1024_guam?type=food&page=3";
      }
      else if(title.equals("시드니")) {
         url="http://www.tourtips.com/dest/list/1023_sydney?type=food&page=1";
      }
      else if(title.equals("시드니-1")) {
         url="http://www.tourtips.com/dest/list/1023_sydney?type=food&page=1";
      }else if(title.equals("시드니-2")) {
         url="http://www.tourtips.com/dest/list/1023_sydney?type=food&page=2";
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

         for (int i = 0; i < articles.size(); i++) {
            
            Map<String, String> map = new HashMap<String,String>();
            System.out.println(articles.get(i).attr("src"));
            map.put("img", articles.get(i).attr("src"));
            map.put("title", articles2.get(i).toString());
            map.put("detail1",str3[i]);
            map.put("detail2",str4[i]);
            list.add(map);
         
      }
      }
      
//         href=articles.toString();
//         href2=articles2.toString();
//         href=href.replace("<", "<p><");
//         href=href.replace(">", " width=700px height=500px></p>");
//         
//         
//          arrhref=href.split("\n");
//          arrhref2=href2.split("\n");
//         
//         for(int i=0;i<arrhref.length;i++) {
//         
//         arrhref[i]="<div>"+arrhref[i]+arrhref2[i];
//         
//         System.out.println(arrhref[i]);
//         }
//         go=arrhref[0];
//         for(int i=1;i<arrhref.length;i++) {
//            go+=arrhref[i];
//         
//         }
         
      catch(Exception e) {
         e.printStackTrace();
      }
      
      
      
      model.addAttribute("list5", list);
      
//      model.addAttribute("href",go);
//      model.addAttribute("href2",href2);
      model.addAttribute(service3.read(bno));
   
   }
   
   @RequestMapping(value="/removePage",method=RequestMethod.POST)
   public String foodremove(@RequestParam("bno") int bno,
         SearchCriteria4 cri,
         RedirectAttributes rttr) throws Exception{
      
      service3.remove(bno);
      
      rttr.addAttribute("page",cri.getPage());
      rttr.addAttribute("perPageNum",cri.getPerPageNum());
      rttr.addAttribute("searchType",cri.getSearchType());
      rttr.addAttribute("keyword",cri.getKeyword());
      
      rttr.addFlashAttribute("msg","SUCCESS");
      return "redirect:/food/";
   }
   @RequestMapping(value="/modifyPage",method=RequestMethod.GET)
   public void foodmodifyPagingGET(int bno,
         @ModelAttribute("cri") SearchCriteria4 cri,
         Model model) throws Exception
   {
      model.addAttribute(service3.read(bno));
   }
   
   @RequestMapping(value="/modifyPage",method=RequestMethod.POST)
   public String foodmodifyPagingPOST(BoardVO3 board,
         SearchCriteria4 cri,
         RedirectAttributes rttr) throws Exception{
      
      logger.info(cri.toString());
      service3.modify(board);
      
      rttr.addAttribute("page",cri.getPage());
      rttr.addAttribute("perPageNum",cri.getPerPageNum());
      rttr.addAttribute("searchType",cri.getSearchType());
      rttr.addAttribute("keyword",cri.getKeyword());
      
      rttr.addFlashAttribute("msg","SUCCESS");
      
      logger.info(rttr.toString());
      
      return "redirect:/food/";
   }
   


   @RequestMapping("/food/getAttach/{bno}")
      @ResponseBody
      public List<String> foodgetAttach(@PathVariable("bno") Integer bno)throws Exception{
      return service3.getAttach(bno);
   }


   
}