package com.crm.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crm.pojo.Training;
import com.crm.pojo.Trainingvo;
import com.crm.pojo.course;

/**
 * 教育培训表业务层
 * 
 * @author Administrator
 *
 */
public interface trainingservice {
	public void Trainingadd(Training t);

	// 查询name
	public List<Training> selectbytname(String vo);

	public List<Training> Trainingfindall();

	public List<Training> Page(Training vo);

	public void Trainingdelete(Integer id);

	public Training trainingByid(Integer id);

	public void trainingupdate(Training t);

	public List<Training> transelect(String id);// 查询本单位教育培训

	public void tranupdate(Training t);// 根据id修改
	// 导入表格

	List<String> ajaxUploadExcel(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public void tdelete(List<String> arr);
	//根据单位id查询培训信息
	public List<Training> queryTraningInfoByUnitid(String unitid);
	//创建添加培训课程
	public Integer CreateCourse(course c);
	//通过培训id查询课程信息
	public List<course> queryCourseByTrainingid(String trainingid);
	//根据id编辑课程
	public Integer EditCourseById(course c);
	//根据id删除课程
	public Integer DeleteCourseById(course c);
	//批量删除课程
	public Integer DeleteCourseByIds(List<Integer> ids);
}
