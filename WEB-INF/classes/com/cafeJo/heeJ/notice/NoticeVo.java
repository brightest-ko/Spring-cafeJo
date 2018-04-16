package com.cafeJo.heeJ.notice;

import java.sql.Date;

public class NoticeVo {
	private int nnum;
	private String ntitle;
	private String ncontent;
	private int nhit;
	private Date noticedate;
	public int getNnum() {
		return nnum;
	}
	public void setNnum(int nnum) {
		this.nnum = nnum;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public int getNhit() {
		return nhit;
	}
	public void setNhit(int nhit) {
		this.nhit = nhit;
	}
	public Date getNoticedate() {
		return noticedate;
	}
	public void setNoticedate(Date noticedate) {
		this.noticedate = noticedate;
	}
	@Override
	public String toString() {
		return "NoticeVo [nnum=" + nnum + ", ntitle=" + ntitle + ", ncontent=" + ncontent + ", nhit=" + nhit
				+ ", noticedate=" + noticedate + "]";
	}

}
