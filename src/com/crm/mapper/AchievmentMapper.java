package com.crm.mapper;

import com.crm.pojo.achievment;
import com.crm.pojo.page;
import com.crm.pojo.unit;

import java.util.List;
/**
 * 科技成果表
 * @author Administrator
 *
 */
public interface AchievmentMapper {
	//插入数据
	public void Achievmentadd(achievment a);
	//根据name查询
	public List<achievment> selectbyname(String s);
	//查询所有
	public List<achievment> Achievmentfindall();
	//根据id查询
	public achievment AchievmentByid(Integer id);
	//根据年份查询
	public List<achievment> AchievmentByyear(String id);
	//修改数据
	public void Achievmentudate(achievment achi);
	//删除数据
	public void Achievmentdelete(Integer id);
	//条件查询
	public List<achievment> achiBynt(achievment a);
    public void achdelete(List<String> arr);
    
	public List<achievment> achfind(String uid);
	
	public List<achievment> Achievmentfindall1(Integer lim);
	
	public List<achievment> achfind1(page p);
	public void updateunit(unit  p);
	
}