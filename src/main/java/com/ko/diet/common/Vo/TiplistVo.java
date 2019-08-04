package com.ko.diet.common.Vo;

import java.sql.Timestamp;

public class TiplistVo {

	private String idx;
	private String tipkind;
	private String title;
	private String summary;
	private String state;
	private String img;
	private Timestamp indate;
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getTipkind() {
		return tipkind;
	}
	public void setTipkind(String tipkind) {
		this.tipkind = tipkind;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Timestamp getIndate() {
		return indate;
	}
	public void setIndate(Timestamp indate) {
		this.indate = indate;
	}
	
	
}
