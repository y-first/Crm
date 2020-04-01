package com.crm.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class project {
	private Integer id;

	private String name;

	private String registration;

	private String ework;
	private String unitname;
	private String expenditure;
	private String linkman;
	private String phone;
	private String color;
	private Integer index;
	public String getUnitname() {
		return unitname;
	}

	public void setUnitname(String unitname) {
		this.unitname = unitname;
	}

	public Integer getIndex() {
		return index;
	}

	public void setIndex(Integer index) {
		this.index = index;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	private Integer totalUsers;
	
	

	public Integer getTotalUsers() {
		return totalUsers;
	}

	public void setTotalUsers(Integer totalUsers) {
		this.totalUsers = totalUsers;
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

	private String progress;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date applicationtime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date acceptancetime;

	private String eway;

	private String eunit;

	private String achievement;

	public String getEway() {
		return eway;
	}

	public void setEway(String eway) {
		this.eway = eway;
	}

	public String getEunit() {
		return eunit;
	}

	public void setEunit(String eunit) {
		this.eunit = eunit;
	}

	private String note;
	private String app;
	private String acc;
	private String uid;
	private long time;
	private String dt;
	private String eworkname;
	public String getEworkname() {
		return eworkname;
	}

	public void setEworkname(String eworkname) {
		this.eworkname = eworkname;
	}

	public String getEunitname() {
		return eunitname;
	}

	public void setEunitname(String eunitname) {
		this.eunitname = eunitname;
	}

	private String eunitname;
	public String getDt() {
		return dt;
	}

	public void setDt(String dt) {
		this.dt = dt;
	}

	public long getTime() {
		return time;
	}

	public void setTime(long time) {
		this.time = time;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getApp() {
		return app;
	}

	public void setApp(String app) {
		this.app = app;
	}

	public String getAcc() {
		return acc;
	}

	public void setAcc(String acc) {
		this.acc = acc;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getExpenditure() {
		return expenditure;
	}

	public void setExpenditure(String expenditure) {
		this.expenditure = expenditure;
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
		this.name = name == null ? null : name.trim();
	}

	public String getRegistration() {
		return registration;
	}

	public void setRegistration(String registration) {
		this.registration = registration == null ? null : registration.trim();
	}

	public String getEwork() {
		return ework;
	}

	public void setEwork(String ework) {
		this.ework = ework == null ? null : ework.trim();
	}

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress == null ? null : progress.trim();
	}

	public Date getApplicationtime() {
		return applicationtime;
	}

	public void setApplicationtime(Date applicationtime) {
		this.applicationtime = applicationtime;
	}

	public Date getAcceptancetime() {
		return acceptancetime;
	}

	public void setAcceptancetime(Date acceptancetime) {
		this.acceptancetime = acceptancetime;
	}


	public String getAchievement() {
		return achievement;
	}

	public void setAchievement(String achievement) {
		this.achievement = achievement == null ? null : achievement.trim();
	}

}
