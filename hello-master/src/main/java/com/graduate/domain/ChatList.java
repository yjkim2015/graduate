package com.graduate.domain;

import java.util.Date;

public class ChatList {

	private Integer bno;
	private String chatname;

	private Date regdate;
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	
	
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getChatname() {
		return chatname;
	}
	public void setChatname(String chatname) {
		this.chatname = chatname;
	}

	
}
