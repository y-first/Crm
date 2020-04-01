package com.crm.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class club {

	private Integer id;// 标识码

	private String name;// 团体组织

	private String director;// 理事长

	private String sgeneral;// 秘书长

	private String sunit;// 支持单位

	private String office;// 办公地点

	private String linkman;// 联系人

	private String phone;// 联系电话
	private String unitname;
	public String getUnitname() {
		return unitname;
	}

	public void setUnitname(String unitname) {
		this.unitname = unitname;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date eontime;// 任职时间

	private String informattion;// 历年信息

	private String note;// 备注

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	@Override
	public String toString() {
		return "Club [id=" + id + ", name=" + name + ", director=" + director + ", sgeneral=" + sgeneral + ", sunit="
				+ sunit + ", office=" + office + ", linkman=" + linkman + ", phone=" + phone + ", eontime=" + eontime
				+ ", informattion=" + informattion + ", note=" + note + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getSgeneral() {
		return sgeneral;
	}

	public void setSgeneral(String sgeneral) {
		this.sgeneral = sgeneral;
	}

	public String getSunit() {
		return sunit;
	}

	public void setSunit(String sunit) {
		this.sunit = sunit;
	}

	public String getOffice() {
		return office;
	}

	public void setOffice(String office) {
		this.office = office;
	}

	public String getLinkman() {
		return linkman;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getEontime() {
		return eontime;
	}

	public void setEontime(Date eontime) {
		this.eontime = eontime;
	}

	public String getInformattion() {
		return informattion;
	}

	public void setInformattion(String informattion) {
		this.informattion = informattion;
	}

	private String formatting; //格式化的日期

	public String getFormatting() {
		return formatting;
	}

	public void setFormatting(String formatting) {
		this.formatting = formatting;
	}
	

}
