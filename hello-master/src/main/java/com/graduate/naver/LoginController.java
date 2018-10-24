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
	
		/* ���̹����̵�� ���� URL�� �����ϱ� ���Ͽ� naverLoginBOŬ������ getAuthorizationUrl�޼ҵ� ȣ�� */
//		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
//		
//		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
//		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE,googleOAuth2Parameters);
//		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
//		System.out.println("���̹�:" + naverAuthUrl);
//		System.out.println("����:"+url);
//		model.addAttribute("google_url",url);
//		//���̹� 
//		model.addAttribute("url", naverAuthUrl);

		return "with";
	}
	//�α��� ù ȭ�� ��û �޼ҵ�
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		
//		/* ���̹����̵�� ���� URL�� �����ϱ� ���Ͽ� naverLoginBOŬ������ getAuthorizationUrl�޼ҵ� ȣ�� */
//		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
//		
//		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
//		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE,googleOAuth2Parameters);
//		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
//		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
//		System.out.println("���̹�:" + naverAuthUrl);
//		System.out.println("����:"+url);
//		model.addAttribute("google_url",url);
//		//���̹� 
//		model.addAttribute("url", naverAuthUrl);

		/* ������ ���� URL�� View�� ���� */
		return "with";
	}
	/*@RequestMapping(value = "/oauth2callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(Model model, @RequestParam String code) throws IOException {
		System.out.println("����� googleCallback");

		return "googleSuccess";
	}
	*/
	@RequestMapping(value="/oauth2callback",method= {RequestMethod.GET,RequestMethod.POST})
	public String googleCallback(Model model,HttpSession session,HttpServletRequest request) {
		
		//Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi(); 
		//System.out.println(google+"����");
		
		//PlusOperations plusOperations = google.plusOperations(); 
		//Person person = plusOperations.getGoogleProfile();
		
		//System.out.println(person.getDisplayName());


		
		return "googleSuccess";
	}
	
	

	
	//���̹� �α��� ������ callbackȣ�� �޼ҵ�
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
//		System.out.println("����� callback");
//		OAuth2AccessToken oauthToken;
//        oauthToken = naverLoginBO.getAccessToken(session, code, state);
//        //�α��� ����� ������ �о�´�.
//	    apiResult = naverLoginBO.getUserProfile(oauthToken);
//		model.addAttribute("result", apiResult);

        /* ���̹� �α��� ���� ������ View ȣ�� */
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

