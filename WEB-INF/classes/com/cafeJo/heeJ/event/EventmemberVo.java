package com.cafeJo.heeJ.event;

import java.sql.Date;

public class EventmemberVo {
	private int emnum;
	private String etitle;//
	private String userid;// varchar(20) primary key,
	private String username;// varchar2(10) not null,
	private String hp;// varchar2(13) not null,
	private String mail;// varchar2(20),
	private int eventnum;// number primary key,
	private Date eventmemberdate;// date not null,
	
	public String getEtitle() {
		return etitle;
	}
	public void setEtitle(String etitle) {
		this.etitle = etitle;
	}
	public EventmemberVo() {
		super();
	}
	public EventmemberVo(String userid, String username, String hp, String mail, int eventnum) {
		super();
		this.userid = userid;
		this.username = username;
		this.hp = hp;
		this.mail = mail;
		this.eventnum = eventnum;
	}
	
	public EventmemberVo(String userid, int eventnum) {
		super();
		this.userid = userid;
		this.eventnum = eventnum;
	}
	public int getEmnum() {
		return emnum;
	}
	public void setEmnum(int emnum) {
		this.emnum = emnum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public int getEventnum() {
		return eventnum;
	}
	public void setEventnum(int eventnum) {
		this.eventnum = eventnum;
	}
	public Date getEventmemberdate() {
		return eventmemberdate;
	}
	public void setEventmemberdate(Date eventmemberdate) {
		this.eventmemberdate = eventmemberdate;
	}
	@Override
	public String toString() {
		return "EventmemberVo [emnum=" + emnum + ", userid=" + userid + ", username=" + username + ", hp=" + hp
				+ ", mail=" + mail + ", eventnum=" + eventnum + ", eventmemberdate=" + eventmemberdate + "]";
	}
	
}
