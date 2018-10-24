
package com.graduate.util;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.ArrayList;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.catalina.SessionListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.graduate.domain.ChatBoardVO;
import com.graduate.domain.SearchCriteria3;
import com.graduate.persistence.ChatBoardDAO;
import com.graduate.service.ChatBoardService;
import com.graduate.controller.ChatBoardController;


public class ChatWebSocketHandler extends TextWebSocketHandler{

	@Inject 
	private ChatBoardService service;
 
	@Autowired
	ChatBoardController chatBoardController;
	
	private String roomnumber;

	
 static final Logger logger = LoggerFactory.getLogger(ChatWebSocketHandler.class);
	
	
	private List<WebSocketSession> sessionList = new ArrayList<>();
	
	private Map<WebSocketSession,String> mapList = new HashMap<>();
	private Map <WebSocketSession,String> roomList = new HashMap<>();

	private List<String> userlist = new ArrayList<>();
	
	
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	
	
	 @Override
	 public void afterConnectionEstablished(
	   WebSocketSession session) throws Exception {		
		 System.out.println(chatBoardController.room+"핸들러");
		 roomList.put(session, chatBoardController.room);
		 mapList.put(session, session.getId());
		 sessionList.add(session);
		 System.out.println(session.getLocalAddress().getHostName());
		 log(session.getId()+"연결 됨");

	 for(int i=0; i<sessionList.size();i++) {
		 roomnumber= roomList.get(sessionList.get(i));
		 System.out.println(roomnumber+"룸넘버야"+i);
		
	 }

	 }

	@Override
	 public void afterConnectionClosed(
	   WebSocketSession session, CloseStatus status) throws Exception {
	  log(session.getId() + " 연결 종료됨");
	  Object id=session.getId();
	  int indexing=0;
	  for(int i=0;i<sessionList.size();i++) {
		  if(sessionList.get(i)==id) {
			  indexing=i;
		  }
	  }
	  sessionList.remove(indexing);

	 }

	
	
	@Override
	 protected void handleTextMessage(
	   WebSocketSession session, TextMessage message) throws Exception {
	
	 
	 
	
		
		System.out.println(message.getPayload());
		String msgArr[]= new String[4];
		msgArr=message.getPayload().split(":");
		
	  log(session.getId() + "로부터 메시지 수신: " + message.getPayload());
		
	
	
for(WebSocketSession websocketsession:sessionList) {
	
	
	if(session.getId().equals(websocketsession.getId())) {
		websocketsession.sendMessage(message);
	}
}
		for(WebSocketSession s : sessionList) {
			
			if(msgArr[3].equals(roomList.get(s))) {
				
				
			
				if(!session.getId().equals(s.getId())) {
				 s.sendMessage(message);
				 
				 }
				}
			
		}	
	
	 }
	
	 @Override
	 public void handleTransportError(
	   WebSocketSession session, Throwable exception) throws Exception {
	  log(session.getId() + " 익셉션 발생: " + exception.getMessage());
	 }

	 private void log(String logmsg) {
	  System.out.println(new Date() + " : " + logmsg);
	 }

	}
