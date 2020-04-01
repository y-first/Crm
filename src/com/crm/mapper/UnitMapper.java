package com.crm.mapper;

import java.util.List;

import com.crm.pojo.employee;
import com.crm.pojo.unit;
/**
 * 单位表
 * @author Administrator
 *
 */
public interface UnitMapper {
	
   //查询所有
	public List<unit>  findall();
	//添加单位
	public void  addUnit(unit u);
	public void removeUnit(Integer id);
	public List<employee> selectAll(employee e);
	public unit selectyunitByid(Integer id);
	public unit selectunitByName(String name);
	public void	updateunitname(unit u);
}