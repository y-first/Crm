package com.crm.service;

import java.util.List;

import com.crm.pojo.employee;
import com.crm.pojo.unit;

public interface unitservice {
	public List<unit>  findall();
	//添加单位
	public void  addUnit(unit u);
	//删除单位
	public void removeUnit(Integer id);
	public unit selectyunitByid(Integer id);
	//根据名称查询单位
	public unit selectunitByName(String name);
	public void updateunit(unit un);
	
}
