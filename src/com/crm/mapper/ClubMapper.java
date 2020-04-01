package com.crm.mapper;

import java.util.List;

import com.crm.pojo.club;
import com.crm.pojo.clubvc;
import com.crm.pojo.employee;

public interface ClubMapper {
	public List<club> clubselect(String uid);
	public void clubdelete(String id);
	public club us(String id); 
	public void clubupdate(club c);
	public List<clubvc> filtrate(clubvc c); 
	public employee login(employee e);  
	public List<club> clubselectall();
	public List<clubvc> tfiltrate(clubvc c);
	public void addUser(employee e);
	public List<employee>  selectUser(employee e);
	
	public void chdelete(List<String> arr);
	public List<club> clubselectall1(Integer page);
	
	public List<club> clubselect1(clubvc c);
}
