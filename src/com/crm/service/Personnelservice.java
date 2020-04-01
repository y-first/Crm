package com.crm.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crm.pojo.Personnel;
import com.crm.pojo.employee;
import com.crm.pojo.unit;
/**
 * 外事人员表业务层
 * @author Administrator
 *
 */
public interface Personnelservice {
	//修改个人信息
	public void updatePersonnel(Personnel p);
	//根据id查询
	public Personnel selectByid(Integer id);
	//跟据单位和名称模糊查询
	public List<Personnel> selectmhpersonnel(Personnel m);
	// 录入人员
	public void personneladd(Personnel m);
	//删除账号
	public void	deleteUser(Integer id);
	public void ajaxUploadExcel(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//查询账号
	public employee	selectByuserid(Integer id);
	//修改账号
	public void updateUser(employee e);
	//根据权限查询账号
	public List<employee> selectAll(employee e);
	//根据人员查询账号
	public employee selectBypid(Integer id);
	public void updateduty(employee e);
	public void addEmployees(employee e);
	//批量删除
	public void pedelete(List<String> arr);
	//查询账号
	 public employee  selectByusername(String name);
	 
	 public unit selectunitByName(String name);
	//根据人员id更新出访记录
	 public void updateInfoabroadByPid(Personnel p);
}
