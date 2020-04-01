package com.crm.mapper;

import com.crm.pojo.Training;
import com.crm.pojo.Trainingvo;
import com.crm.pojo.unit;
import com.crm.pojo.course;

import java.util.List;

/**
 * 教育培训
 * 
 * @author Administrator
 *
 */
public interface TrainingMapper {
	// 插入数据
	public void Trainingadd(Training t);

	// 查询所有
	public List<Training> Trainingfindall();

	// 条件查询
	public List<Training> Page(Training vo);
	// 查询name
	public List<Training> selectbytname(String vo);
	
	// 根据id删除
	public void Trainingdelete(Integer id);

	// 根据id查询
	public Training trainingByid(Integer t);

	// 更新数据
	public void trainingupdate(Training t);

	public List<Training> transelect(String id);// 查询本单位

	public void tranupdate(Training t);// 根据id修改
	public void tdelete(List<String> arr);
	public void updateunitt(unit un);
	
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