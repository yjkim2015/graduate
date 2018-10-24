package com.graduate.util;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.graduate.controller.CommonExceptionAdvice;


@Component
public class EchoHandler extends TextWebSocketHandler {

	private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

		
		@Override
		public void afterConnectionEstablished(WebSocketSession session)throws Exception{
			
			sessionList.add(session);
			
			logger.info("{} �����",session.getId());
			
			System.out.println("ä�ù� ������ : " + session.getPrincipal().getName());
		}
		
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
			
			logger.info("{}�� ���� {} ���� ", session.getId(),message.getPayload());
			
			for(WebSocketSession sess: sessionList) {
				sess.sendMessage(new TextMessage(session.getPrincipal().getName()+"|"+message.getPayload()));


			}
		}
		
		@Override
		public void afterConnectionClosed(WebSocketSession session,CloseStatus status) throws Exception{
			
			sessionList.remove(session);
			
			logger.info("{} ���� ����.",session.getId());
			
			System.out.println("ä�ù� ������ : " +session.getPrincipal().getName());
		}
}
