package com.crm.mapper;

import com.crm.pojo.project;
import com.crm.pojo.unit;

import java.util.List;

/**
 * 科技项目表
 * 
 * @author Administrator
 *
 */
public interface ProjectMapper {
	// 科技项目表插入数据
	public void Projectadd(project p);
	//项目名查重
	public List<project>	selectbyname(String s);
	
	public List<project> pselect(String uid);// 查询本单位科技项目

	public List<project> pselectall();// 查询所有单位科技项目
	public List<project> pselect2(project p);// 查询本单位科技项目

	public List<project> pselectall2(project p);// 查询所有单位科技项目
	public project pj(String id);// 点击修改返回数据

	public void pupdate(project p);// 更新科技项目数据

	public List<project> pfile(project p);// 条件查询

	public void pdelete(String id); // 删除

	public List<project> pfileall(project p);// 条件查询
	public void remind(project p);// 修改提醒状态

	public List<project> nselect(project p);
	
	public void up(project p);
	
	public List<project> ps(String uid);
	
	public void deletall(List<String> id);
	public void updateunitpro(unit un);
	public void updateunitpr(unit un);
}