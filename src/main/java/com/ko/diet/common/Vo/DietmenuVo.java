package com.ko.diet.common.Vo;

import java.sql.Timestamp;

public class DietmenuVo {
	
	
	private String dmseq;
	private String tipkind;
	private String tip;
	private String title;
	private String contents1;
	private String imp_contents;
	private String contents2;
	private String state;
	private String img;
	private String detail_img;
	private Timestamp indate;

	public String getDmseq() {
		return dmseq;
	}
	public void setDmseq(String dmseq) {
		this.dmseq = dmseq;
	}
	public String getTipkind() {
		return tipkind;
	}
	public void setTipkind(String tipkind) {
		this.tipkind = tipkind;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents1() {
		return contents1;
	}
	public void setContents1(String contents1) {
		this.contents1 = contents1;
	}
	public String getImp_contents() {
		return imp_contents;
	}
	public void setImp_contents(String imp_contents) {
		this.imp_contents = imp_contents;
	}
	public String getContents2() {
		return contents2;
	}
	public void setContents2(String contents2) {
		this.contents2 = contents2;
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
	public String getDetail_img() {
		return detail_img;
	}
	public void setDetail_img(String detail_img) {
		this.detail_img = detail_img;
	}
	public Timestamp getIndate() {
		return indate;
	}
	public void setIndate(Timestamp indate) {
		this.indate = indate;
	}

	
}
