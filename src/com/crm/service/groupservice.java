package com.crm.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crm.pojo.group2;
import com.crm.pojo.unit;

/**
 * 团体表
 * @author Administrator
 *
 */
public interface groupservice {
	//插入数据
	public void Groupadd(group2 g);
      //查询全部
	public List<group2> groupfindall();
	//所有单位预算汇总
	public List<unit> querySummaryAll();
	//根据单位查询单位预算汇总query
	public List<unit> querySummaryByunit();
	//删除数据
	public void deletegroup(Integer id);
	//根据id查询
	public group2 selectByid(Integer id);
	//根据单位查询团组
	public List<group2> selectByunit(String unit);
	//增加人数
    public void  addperson(group2 g);
    //修改团组
	public void groupupdate(group2 g);

	public void gdelete(List<String> arr);
	//批量导入团组
	public void UploadExcel(HttpServletRequest request, HttpServletResponse response);
}
