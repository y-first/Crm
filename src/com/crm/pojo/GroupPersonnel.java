package com.crm.pojo;

import java.util.Date;

public class GroupPersonnel {
    private Integer id;

    private String name;

    private Integer groupid;

    private Integer pid;
    private String role;
    private String unitname;
    private Date accesstime;
    public Date getAccesstime() {
		return accesstime;
	}

	public void setAccesstime(Date accesstime) {
		this.accesstime = accesstime;
	}

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	private String groupname;
    public String getUnitname() {
		return unitname;
	}

	public void setUnitname(String unitname) {
		this.unitname = unitname;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	private String accesscountry;
    private String  head;
    public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

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

    public Integer getGroupid() {
        return groupid;
    }

    public void setGroupid(Integer groupid) {
        this.groupid = groupid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getAccesscountry() {
        return accesscountry;
    }

    public void setAccesscountry(String accesscountry) {
        this.accesscountry = accesscountry == null ? null : accesscountry.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }
}