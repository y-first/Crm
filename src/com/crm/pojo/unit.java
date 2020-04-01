package com.crm.pojo;

import java.io.Serializable;

public class unit implements Serializable {
    private Integer id;
    private String name;
    private Integer type;
    private String code;
    private Integer fcapital;
    private Integer ofunds;
    private Integer sum;
    private String uname;
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public Integer getFcapital() {
		return fcapital;
	}
	public void setFcapital(Integer fcapital) {
		this.fcapital = fcapital;
	}
	public Integer getOfunds() {
		return ofunds;
	}
	public void setOfunds(Integer ofunds) {
		this.ofunds = ofunds;
	}
	public Integer getSum() {
		return sum;
	}
	public void setSum(Integer sum) {
		this.sum = sum;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
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

    public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}