package com.crm.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crm.pojo.project;

/**
 * 科技项目表业务层
 * 
 * @author Administrator
 *
 */
public interface projectservice {
	public void Projectadd(project p);

	public List<project> pselect(String uid);// 查询本单位科技项目

	public List<project> pselectall();// 查询所有单位科技项目

	public List<project> pselect2(project p);// 查询本单位科技项目

	public List<project> pselectall2(project p);// 查询所有单位科技项目

	public project pj(String id);// 点击修改返回数据

	public void pupdate(project p);// 更新科技项目数据

	public List<project> pfile(project p);// 条件查询

	public void pdelete(String id); // 删除

	public List<project> start();

	public List<project> starta(String id);

	public List<project> pfileall(project p);// 条件查询
	// 导入表格

	List<String> ajaxUploadExcel(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public void remind(project p);// 修改提醒状态

	public List<project> nselect(project p);

	public void up(project p);
	//项目名查重
	public List<project> selectbyname(String s);
	public List<project> ps(String uid);
	
	public void deletall(List<String> arr);
}
