package com.cafeJo.heeJ.qna;

import java.sql.Date;

public class QnaVo {
	private String qrefid;// varchar(20) not null REFERENCES member (userid),
	private String userid;// varchar(20) primary key,
	private String username;// varchar2(10) not null,
	private String hp;// varchar2(13) not null,
	private String mail;// varchar2(20),
	private int qnum;
	private String qtitle;
	private String qcontent;
	private Date qnadate;
	private int qref;// number not null,
	private int qlevel;// number not null
	private String qreply;// varchar(5) DEFAULT no
	
	public String getQrefid() {
		return qrefid;
	}
	public void setQrefid(String qrefid) {
		this.qrefid = qrefid;
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
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public Date getQnadate() {
		return qnadate;
	}
	public void setQnadate(Date qnadate) {
		this.qnadate = qnadate;
	}
	public int getQref() {
		return qref;
	}
	public void setQref(int qref) {
		this.qref = qref;
	}
	public int getQlevel() {
		return qlevel;
	}
	public void setQlevel(int qlevel) {
		this.qlevel = qlevel;
	}
	public String getQreply() {
		return qreply;
	}
	public void setQreply(String qreply) {
		this.qreply = qreply;
	}
	@Override
	public String toString() {
		return "QnaVo [qrefid=" + qrefid + ", userid=" + userid + ", username=" + username + ", hp=" + hp + ", mail="
				+ mail + ", qnum=" + qnum + ", qtitle=" + qtitle + ", qcontent=" + qcontent + ", qnadate=" + qnadate
				+ ", qref=" + qref + ", qlevel=" + qlevel + ", qreply=" + qreply + "]";
	}

}
