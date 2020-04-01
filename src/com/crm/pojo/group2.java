package com.crm.pojo;

public class group2 {
    private Integer id;

    private String name;

    private String access;

    private String accesstime;

    private String accesscountry;

    private String accessunit;
    private String unitname;
    private String aim;
    public String getAim() {
		return aim;
	}

	public void setAim(String aim) {
		this.aim = aim;
	}

	public String getUnitname() {
		return unitname;
	}

	public void setUnitname(String unitname) {
		this.unitname = unitname;
	}

	private String expenditure;

    private String pexpenditure;
    private String days;
    private String Fcapital;
    private String Ofunds;
    public String getDays() {
		return days;
	}

	public String getFcapital() {
		return Fcapital;
	}

	public void setFcapital(String fcapital) {
		Fcapital = fcapital;
	}

	public String getOfunds() {
		return Ofunds;
	}

	public void setOfunds(String ofunds) {
		Ofunds = ofunds;
	}

	public void setDays(String days) {
		this.days = days;
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

    public String getAccess() {
        return access;
    }

    public void setAccess(String access) {
        this.access = access == null ? null : access.trim();
    }

    public String getAccesstime() {
        return accesstime;
    }

    public void setAccesstime(String accesstime) {
        this.accesstime = accesstime == null ? null : accesstime.trim();
    }

    public String getAccesscountry() {
        return accesscountry;
    }

    public void setAccesscountry(String accesscountry) {
        this.accesscountry = accesscountry == null ? null : accesscountry.trim();
    }

    public String getAccessunit() {
        return accessunit;
    }

    public void setAccessunit(String accessunit) {
        this.accessunit = accessunit == null ? null : accessunit.trim();
    }

    public String getExpenditure() {
        return expenditure;
    }

    public void setExpenditure(String expenditure) {
        this.expenditure = expenditure == null ? null : expenditure.trim();
    }

    public String getPexpenditure() {
        return pexpenditure;
    }

    public void setPexpenditure(String pexpenditure) {
        this.pexpenditure = pexpenditure == null ? null : pexpenditure.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }
}