package com.crm.pojo;

public class page {
      
	private String uid;
	
	private Integer pg;

	public String getUid() {
		return uid;
	}

	@Override
	public String toString() {
		return "page [uid=" + uid + ", pg=" + pg + "]";
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public Integer getPg() {
		return pg;
	}

	public void setPg(Integer pg) {
		this.pg = pg;
	}
}
