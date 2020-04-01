package com.crm.service;

import java.util.List;
import com.crm.pojo.club;
import com.crm.pojo.clubvc;
import com.crm.pojo.employee;

public interface ClubService {
	public List<club> clubselect(String uid); // 查询自己所在社团的信息

	public void clubdelete(String id); // 删除社团数据

	public club us(String id); // 查看单个社团数据

	public void clubupdate(club c); // 更改社团数据

	public List<clubvc> filtrate(clubvc c); // 查询符合条件的社团

	public employee login(employee e); // 登陆判断

	public List<club> clubselectall(); // 查询所有社团的信息

	public List<clubvc> tfiltrate(clubvc c); // 三级权限查询符合条件的社团

	public void addUser(employee e);

	public List<employee> selectUser(employee e);

	public void chdelete(List<String> arr);

	public List<club> clubselectall1(Integer page);

	public List<club> clubselect1(clubvc c);
}
