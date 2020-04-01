package com.crm.pojo;

import java.util.Date;

public class Training {
    private Integer id;

    private String name;

    private String sposnor;

    private String held;

    private Date ptime;
    private String unitid;
    private String unitname;
    private String examine;
    private String proposal;
    private String target;
    private String realhold;
    private String realnum;
    public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getRealhold() {
		return realhold;
	}

	public void setRealhold(String realhold) {
		this.realhold = realhold;
	}

	public String getRealnum() {
		return realnum;
	}

	public void setRealnum(String realnum) {
		this.realnum = realnum;
	}

	public String getExamine() {
		return examine;
	}

	public void setExamine(String examine) {
		this.examine = examine;
	}

	public String getProposal() {
		return proposal;
	}

	public void setProposal(String proposal) {
		this.proposal = proposal;
	}

	public String getUnitid() {
		return unitid;
	}

	public void setUnitid(String unitid) {
		this.unitid = unitid;
	}

	public String getUnitname() {
		return unitname;
	}

	public void setUnitname(String unitname) {
		this.unitname = unitname;
	}

	@Override
	public String toString() {
		return "Training [id=" + id + ", name=" + name + ", sposnor=" + sposnor + ", held=" + held + ", ptime=" + ptime
				+ ", atime=" + atime + ", participation=" + participation + ", pfunds=" + pfunds + ", afunds=" + afunds
				+ ", note=" + note + "]";
	}

	private Date atime;

    private String participation;

    private String pfunds;

    private String afunds;
    private String p;
    private String a;
    
    public String getP() {
		return p;
	}

	public void setP(String p) {
		this.p = p;
	}

	public String getA() {
		return a;
	}

	public void setA(String a) {
		this.a = a;
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

    public String getSposnor() {
        return sposnor;
    }

    public void setSposnor(String sposnor) {
        this.sposnor = sposnor == null ? null : sposnor.trim();
    }

    public String getHeld() {
        return held;
    }

    public void setHeld(String held) {
        this.held = held;
    }

    public Date getPtime() {
        return ptime;
    }

    public void setPtime(Date ptime) {
        this.ptime = ptime;
    }

    public Date getAtime() {
        return atime;
    }

    public void setAtime(Date atime) {
        this.atime = atime;
    }

    public String getParticipation() {
        return participation;
    }

    public void setParticipation(String participation) {
        this.participation = participation == null ? null : participation.trim();
    }

    public String getPfunds() {
        return pfunds;
    }

    public void setPfunds(String pfunds) {
        this.pfunds = pfunds == null ? null : pfunds.trim();
    }

    public String getAfunds() {
        return afunds;
    }

    public void setAfunds(String afunds) {
        this.afunds = afunds == null ? null : afunds.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }
}