package com.graduate.naver;
import java.io.IOException;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.graduate.domain.BoardVO;
import com.graduate.service.BoardService;

@Controller
@RequestMapping(value="/")
public class LoginController {
	/* NaverLoginBO */
	
	
//	private NaverLoginBO naverLoginBO;
//	private String apiResult = null;
//	
//	@Autowired
//	private GoogleConnectionFactory googleConnectionFactory;
//	
//	@Autowired
//	private OAuth2Parameters googleOAuth2Parameters;
//	
//	@Autowired
//	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
//		this.naverLoginBO = naverLoginBO;
//	}
	
	@RequestMapping(value = "/with", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
	
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
//		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
//		
//		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
//		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE,googleOAuth2Parameters);
//		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
//		System.out.println("네이버:" + naverAuthUrl);
//		System.out.println("구글:"+url);
//		model.addAttribute("google_url",url);
//		//네이버 
//		model.addAttribute("url", naverAuthUrl);

		return "with";
	}
	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		
//		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
//		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
//		
//		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
//		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE,googleOAuth2Parameters);
//		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
//		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
//		System.out.println("네이버:" + naverAuthUrl);
//		System.out.println("구글:"+url);
//		model.addAttribute("google_url",url);
//		//네이버 
//		model.addAttribute("url", naverAuthUrl);

		/* 생성한 인증 URL을 View로 전달 */
		return "with";
	}
	/*@RequestMapping(value = "/oauth2callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(Model model, @RequestParam String code) throws IOException {
		System.out.println("여기는 googleCallback");

		return "googleSuccess";
	}
	*/
	@RequestMapping(value="/oauth2callback",method= {RequestMethod.GET,RequestMethod.POST})
	public String googleCallback(Model model,HttpSession session,HttpServletRequest request) {
		
		//Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi(); 
		//System.out.println(google+"구글");
		
		//PlusOperations plusOperations = google.plusOperations(); 
		//Person person = plusOperations.getGoogleProfile();
		
		//System.out.println(person.getDisplayName());


		
		return "googleSuccess";
	}
	
	

	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
//		System.out.println("여기는 callback");
//		OAuth2AccessToken oauthToken;
//        oauthToken = naverLoginBO.getAccessToken(session, code, state);
//        //로그인 사용자 정보를 읽어온다.
//	    apiResult = naverLoginBO.getUserProfile(oauthToken);
//		model.addAttribute("result", apiResult);

        /* 네이버 로그인 성공 페이지 View 호출 */
		return "naverSuccess";
	}
	
	@RequestMapping(value = "/with2", method = { RequestMethod.GET})
	public void with2(Model model, HttpSession session) throws IOException {

		
	}
	
	@RequestMapping(value="/Logout",method= {RequestMethod.GET})
	public String naverLogout(Model model,HttpSession session)throws IOException{
		return "Logout";
	}
	

	@RequestMapping(value="/follow_route",method= {RequestMethod.GET})
	public String follow_route(Model model,HttpSession session)throws IOException{
		return "follow_route";
	}
	
}

