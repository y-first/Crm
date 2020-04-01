package com.crm.pojo;

public class employee {
	private Integer id;   //标识码
	
	private String name; 
	
	private String username; //账号
	
	private String password; //密码
	
	private Integer duty; //权限
	private String unitname;
	public String getUnitname() {
		return unitname;
	}

	public void setUnitname(String unitname) {
		this.unitname = unitname;
	}

	private String  uid;  //单位ID
	private String  pid; 
	public String getUid() {
		return uid;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public void setUid(String uid) {
		this.uid = uid;
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
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getDuty() {
		return duty;
	}

	public void setDuty(Integer duty) {
		this.duty = duty;
	}

	@Override
	public String toString() {
		return "employee [id=" + id + ", name=" + name + ", username=" + username + ", password=" + password + ", duty="
				+ duty + ", uid=" + uid + "]";
	}

	
}
