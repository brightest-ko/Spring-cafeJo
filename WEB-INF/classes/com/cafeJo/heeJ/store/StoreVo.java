package com.cafeJo.heeJ.store;

import java.sql.Date;

public class StoreVo {
	private int storenum;// number primary key,
	private String storename;// varchar2(20) not null,
	private String storecall;// varchar2(13) not null,
	private String oldadress;// varchar2(200) not null,
	private String newadress;// varchar2(200) not null,
	private String storetime;// varchar2(200) not null,
	private String carok;// varchar2(20) not null,
	private String storemore;// varchar2(200) not null
	public int getStorenum() {
		return storenum;
	}
	public void setStorenum(int storenum) {
		this.storenum = storenum;
	}
	public String getStorename() {
		return storename;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
	public String getStorecall() {
		return storecall;
	}
	public void setStorecall(String storecall) {
		this.storecall = storecall;
	}
	public String getOldadress() {
		return oldadress;
	}
	public void setOldadress(String oldadress) {
		this.oldadress = oldadress;
	}
	public String getNewadress() {
		return newadress;
	}
	public void setNewadress(String newadress) {
		this.newadress = newadress;
	}
	public String getStoretime() {
		return storetime;
	}
	public void setStoretime(String storetime) {
		this.storetime = storetime;
	}
	public String getCarok() {
		return carok;
	}
	public void setCarok(String carok) {
		this.carok = carok;
	}
	public String getStoremore() {
		return storemore;
	}
	public void setStoremore(String storemore) {
		this.storemore = storemore;
	}

	
}
