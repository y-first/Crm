package com.crm.pojo;

import java.util.Date;

public class Personnel {
	private Integer id;

	private String name;

	private String sex;

	private String place;
	private String uid;
	private String aim;
	private String infoabroad;
	public String getAim() {
		return aim;
	}

	public void setAim(String aim) {
		this.aim = aim;
	}

	public String getInfoabroad() {
		return infoabroad;
	}

	public void setInfoabroad(String infoabroad) {
		this.infoabroad = infoabroad;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getDuty() {
		return duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	private String idcare;
	private String zzmm;
	private String	identity;
	public String getIdentity() {
		return identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

	private String zw;

	private String zc;

	private String fidentity;


	private String pwork;

	private String note;
	private String head;
	private String preal;
	private String duty;
	private String unit;
	private String unitname;
	public String getUnitname() {
		return unitname;
	}

	public void setUnitname(String unitname) {
		this.unitname = unitname;
	}

	private  String username;
	public String password;
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getProfessional() {
		return professional;
	}

	public void setProfessional(String professional) {
		this.professional = professional;
	}

	public String getGtime() {
		return gtime;
	}

	public void setGtime(String gtime) {
		this.gtime = gtime;
	}

	private String school;
	private String professional;
	private String gtime;
	public String getHead() {
		return head;
	}

	public String getPreal() {
		return preal;
	}

	public void setPreal(String preal) {
		this.preal = preal;
	}

	public void setHead(String head) {
		this.head = head;
	}

	public String getReal() {
		return preal;
	}

	public void setReal(String real) {
		this.preal = real;
	}

	public String getZzmm() {
		return zzmm;
	}

	public void setZzmm(String zzmm) {
		this.zzmm = zzmm;
	}

	public String getZw() {
		return zw;
	}

	public void setZw(String zw) {
		this.zw = zw;
	}

	public String getZc() {
		return zc;
	}

	public void setZc(String zc) {
		this.zc = zc;
	}

	public String getFidentity() {
		return fidentity;
	}

	public void setFidentity(String fidentity) {
		this.fidentity = fidentity;
	}



	public String getPwork() {
		return pwork;
	}

	public void setPwork(String pwork) {
		this.pwork = pwork;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
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

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex == null ? null : sex.trim();
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getIdcare() {
		return idcare;
	}

	public void setIdcare(String idcare) {
		this.idcare = idcare == null ? null : idcare.trim();
	}
}