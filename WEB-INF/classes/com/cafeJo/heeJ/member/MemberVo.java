package com.cafeJo.heeJ.member;

import java.sql.Date;
import java.sql.Timestamp;

public class MemberVo {
	
	private String userid;// varchar(20) primary key,
	private String passwd;// varchar2(20) not null,
	private String username;// varchar2(10) not null,
	private String gender;// varchar(2) not null,
	private String birth;// varchar2(20) not null,
	private String hp;// varchar2(13) not null,
	private String hpget;// varchar2(10) not null,
	private Date joindate;// date not null,
	private String mail;// varchar2(20),
	private String mailget;// varchar2(10) not null,
	private String grade;// varchar2(10) DEFAULT USER
	private String cancelmember;// varchar2(10)
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getHpget() {
		return hpget;
	}
	public void setHpget(String hpget) {
		this.hpget = hpget;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getMailget() {
		return mailget;
	}
	public void setMailget(String mailget) {
		this.mailget = mailget;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getCancelmember() {
		return cancelmember;
	}
	public void setCancelmember(String cancelmember) {
		this.cancelmember = cancelmember;
	}
	@Override
	public String toString() {
		return "MemberVo [userid=" + userid + ", passwd=" + passwd + ", username=" + username + ", gender=" + gender
				+ ", birth=" + birth + ", hp=" + hp + ", hpget=" + hpget + ", joindate=" + joindate + ", mail=" + mail
				+ ", mailget=" + mailget + ", grade=" + grade + ", cancelmember=" + cancelmember + "]";
	}

}
