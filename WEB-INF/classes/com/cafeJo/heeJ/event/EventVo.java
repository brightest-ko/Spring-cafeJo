package com.cafeJo.heeJ.event;

import java.sql.Date;

public class EventVo {
	private int eventnum;// number primary key,
	private String etitle;// varchar2(100) not null,
	private String econtent;// varchar2(4000) not null,
	private String filename;// varchar2(50) not null,
	private int ehit;// number not null,
	private Date eventdate;// date not null,
	private int eventcount;// number not null
	private int eventnowcount;// number not null,
	private String eventfinish;// varchar2(20) not null
	
	public int getEventnowcount() {
		return eventnowcount;
	}
	public void setEventnowcount(int eventnowcount) {
		this.eventnowcount = eventnowcount;
	}
	public String getEventfinish() {
		return eventfinish;
	}
	public void setEventfinish(String eventfinish) {
		this.eventfinish = eventfinish;
	}
	public int getEventnum() {
		return eventnum;
	}
	public void setEventnum(int eventnum) {
		this.eventnum = eventnum;
	}
	public String getEtitle() {
		return etitle;
	}
	public void setEtitle(String etitle) {
		this.etitle = etitle;
	}
	public String getEcontent() {
		return econtent;
	}
	public void setEcontent(String econtent) {
		this.econtent = econtent;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getEhit() {
		return ehit;
	}
	public void setEhit(int ehit) {
		this.ehit = ehit;
	}
	public Date getEventdate() {
		return eventdate;
	}
	public void setEventdate(Date eventdate) {
		this.eventdate = eventdate;
	}
	public int getEventcount() {
		return eventcount;
	}
	public void setEventcount(int eventcount) {
		this.eventcount = eventcount;
	}
	@Override
	public String toString() {
		return "EventVo [eventnum=" + eventnum + ", etitle=" + etitle + ", econtent=" + econtent + ", filename="
				+ filename + ", ehit=" + ehit + ", eventdate=" + eventdate + ", eventcount=" + eventcount
				+ ", eventnowcount=" + eventnowcount + ", eventfinish=" + eventfinish + "]";
	}
	
	
}
