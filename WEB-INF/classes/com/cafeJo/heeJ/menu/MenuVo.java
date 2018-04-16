package com.cafeJo.heeJ.menu;

import java.sql.Date;
import java.sql.Timestamp;

public class MenuVo {
	private int num;// number primary key,
	private String kind;// varchar2(20) not null,
	private String menuname;// varchar2(20) not null,
	private String hotncold;// varchar2(10) not null, 추가함 추가하기!
	private String description;// varchar2(200) not null, 추가함 추가하기!
	private double calory;// number(10,2) not null,
	private double saccharide;// number(10,2) not null,
	private double protein;// number(10,2) not null,
	private double caffeine;// number(10,2) not null,
	private double fat;// number(10,2) not null,
	private double sodium;// number(10,2) not null,
	private Date menudate;// date not null,
	private String filename;// varchar2(50) not null
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getMenuname() {
		return menuname;
	}
	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}
	public String getHotncold() {
		return hotncold;
	}
	public void setHotncold(String hotncold) {
		this.hotncold = hotncold;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getCalory() {
		return calory;
	}
	public void setCalory(double calory) {
		this.calory = calory;
	}
	public double getSaccharide() {
		return saccharide;
	}
	public void setSaccharide(double saccharide) {
		this.saccharide = saccharide;
	}
	public double getProtein() {
		return protein;
	}
	public void setProtein(double protein) {
		this.protein = protein;
	}
	public double getCaffeine() {
		return caffeine;
	}
	public void setCaffeine(double caffeine) {
		this.caffeine = caffeine;
	}
	public double getFat() {
		return fat;
	}
	public void setFat(double fat) {
		this.fat = fat;
	}
	public double getSodium() {
		return sodium;
	}
	public void setSodium(double sodium) {
		this.sodium = sodium;
	}
	public Date getMenudate() {
		return menudate;
	}
	public void setMenudate(Date menudate) {
		this.menudate = menudate;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public MenuVo(int num, String kind, String menuname, String hotncold, String description, double calory,
			double saccharide, double protein, double caffeine, double fat, double sodium, Date menudate,
			String filename) {
		super();
		this.num = num;
		this.kind = kind;
		this.menuname = menuname;
		this.hotncold = hotncold;
		this.description = description;
		this.calory = calory;
		this.saccharide = saccharide;
		this.protein = protein;
		this.caffeine = caffeine;
		this.fat = fat;
		this.sodium = sodium;
		this.menudate = menudate;
		this.filename = filename;
	}
	public MenuVo() {
		super();
	}
	@Override
	public String toString() {
		return "MenuVo [num=" + num + ", kind=" + kind + ", menuname=" + menuname + ", hotncold=" + hotncold
				+ ", description=" + description + ", calory=" + calory + ", saccharide=" + saccharide + ", protein="
				+ protein + ", caffeine=" + caffeine + ", fat=" + fat + ", sodium=" + sodium + ", menudate=" + menudate
				+ ", filename=" + filename + "]";
	}
	
}
