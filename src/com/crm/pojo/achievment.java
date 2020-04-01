package com.crm.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class achievment {
    private Integer id;

    private String name;
    private Date time;

    private String type;
    private String registration;
    private String unitname;
    public String getUnitname() {
		return unitname;
	}

	public void setUnitname(String unitname) {
		this.unitname = unitname;
	}

	private String unit;
    private Date  entrytime;
    private String  ent;
    public String getEnt() {
		return ent;
	}

	public void setEnt(String ent) {
		this.ent = ent;
	}

	public Date getEntrytime() {
		return entrytime;
	}

	public void setEntrytime(Date entrytime) {
		this.entrytime = entrytime;
	}

	public String getZtime() {
		return ztime;
	}

	public void setZtime(String ztime) {
		this.ztime = ztime;
	}

	private String person;

    private String note;
   private String ztime;
    public String getRegistration() {
		return registration;
	}

	public void setRegistration(String registration) {
		this.registration = registration;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
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

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }
}