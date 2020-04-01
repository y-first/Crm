package com.crm.pojo;

public class ProjectPersonnel {
    private Integer id;

    private Integer pid;

    private String pname;

    private String name;

    private String sex;

    private String birthday;

    public ProjectPersonnel() {
		super();
	}

	private Double unit;

    private String position;
    private String ppnote;

    public String getPpnote() {
		return ppnote;
	}

	public void setPpnote(String ppnote) {
		this.ppnote = ppnote;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	private String note;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname == null ? null : pname.trim();
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

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday == null ? null : birthday.trim();
    }


    public Double getUnit() {
		return unit;
	}

	public void setUnit(Double unit) {
		this.unit = unit;
	}

	public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position == null ? null : position.trim();
    }
}