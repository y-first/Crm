package com.crm.pojo;

import java.util.Date;


public class Organization {
    private Integer id;
	public Organization() {
		super();
	}

    public Organization( String name, String director, String sgeneral, String sunit, String office,
			String linkman, String phone, Date eontime, String information, String note) {
		super();
		this.name = name;
		this.director = director;
		this.sgeneral = sgeneral;
		this.sunit = sunit;
		this.office = office;
		this.linkman = linkman;
		this.phone = phone;
		this.eontime = eontime;
		this.information = information;
		this.note = note;
	}




	private String name;

    private String director;

    private String sgeneral;

    private String sunit;

    private String office;

    private String linkman;

    private String phone;

    private Date eontime;

    private String information;

    private String note;

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

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director == null ? null : director.trim();
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
        this.linkman = linkman == null ? null : linkman.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }


    public Date getEontime() {
		return eontime;
	}

	public void setEontime(Date eontime) {
		this.eontime = eontime;
	}

	public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information == null ? null : information.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }
}