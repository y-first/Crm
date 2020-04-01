package com.crm.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.crm.mapper.TrainingMapper;
import com.crm.pojo.Training;
import com.crm.pojo.Trainingvo;
import com.crm.pojo.course;
import com.crm.service.trainingservice;
import com.crm.utils.ExcelUtil;

/**
 * 教育培训表实现
 * 
 * @author Administrator
 *
 */
@Service
public class trainingserviceimpl implements trainingservice {

	@Autowired
	private TrainingMapper trainingmapper;

	// 插入数据
	public void Trainingadd(Training t) {
		trainingmapper.Trainingadd(t);
	}

	// 查询所有
	public List<Training> Trainingfindall() {
		return trainingmapper.Trainingfindall();
	}

	public List<Training> Page(Training vo) {
		return trainingmapper.Page(vo);
	}

	public void Trainingdelete(Integer id) {
		trainingmapper.Trainingdelete(id);
	}

	public Training trainingByid(Integer id) {
		return trainingmapper.trainingByid(id);
	}

	public void trainingupdate(Training t) {
		trainingmapper.trainingupdate(t);
	}

	public List<Training> transelect(String id) {
		return trainingmapper.transelect(id);
	}

	public void tranupdate(Training t) {
		trainingmapper.tranupdate(t);
	}

	public List<String> ajaxUploadExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<String> list=new ArrayList<String>();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile file = multipartRequest.getFile("upfile");
		if (file.isEmpty()) {
			try {
				throw new Exception("文件不存在！");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		InputStream in = null;
		try {
			in = file.getInputStream();
		} catch (IOException e) {
			e.printStackTrace();
		}
		List<List<Object>> listob = null;
		try {
			listob = new ExcelUtil().getBankListByExcel(in, file.getOriginalFilename());
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 该处可调用service相应方法进行数据保存到数据库中，现只对数据输出
		for (int i = 0; i < listob.size(); i++) {
			List<Object> lo = listob.get(i);
			Training vo = new Training();
			List<Training> selectbytname = trainingmapper.selectbytname(String.valueOf(lo.get(0)));
			if (String.valueOf(lo.get(0))!=""&&selectbytname.size()==0) {
				vo.setName(String.valueOf(lo.get(0)));
				vo.setSposnor(String.valueOf(lo.get(1)));
				vo.setHeld(String.valueOf(lo.get(2)));
				if (lo.get(3) != null && lo.get(3) != "") {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					vo.setPtime(sdf.parse(String.valueOf(lo.get(3))));
				} else {
					vo.setPtime(new Date());
				}
				if (lo.get(4) != null && lo.get(4) != "") {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					vo.setAtime(sdf.parse(String.valueOf(lo.get(4))));
				} else {
					vo.setAtime(new Date());
				}
				vo.setParticipation(String.valueOf(lo.get(5)));
				vo.setPfunds(String.valueOf(lo.get(6)));
				vo.setAfunds(String.valueOf(lo.get(7)));
				vo.setNote(String.valueOf(lo.get(8)));
				/*
				 * 这里是主键验证，根据实际需要添加，可要可不要，加上之后，可以对现有数据进行批量修改和导入 User j = null; try { j =
				 * userMapper.selectByPrimaryKey(Integer.valueOf(String.valueOf(lo.get(0)))); }
				 * catch (NumberFormatException e) { System.out.println("没有新增"); }
				 */
				// vo.setUserId(Integer.valueOf(String.valueOf(lo.get(0)))); //
				// 刚开始写了主键，由于主键是自增的，又去掉了，现在只有批量插入的功能，不能对现有数据进行修改了

				trainingmapper.Trainingadd(vo);
			}
			else {
				list.add("("+String.valueOf(lo.get(0))+"),项目名重复");
				break;
			}
		}
		return list;
	}

	@Override
	public List<Training> selectbytname(String vo) {
		return trainingmapper.selectbytname(vo);
	}

	@Override
	public void tdelete(List<String> arr) {
		// TODO Auto-generated method stub
		trainingmapper.tdelete(arr);
	}
	
	//根据单位id查询培训信息
	public List<Training> queryTraningInfoByUnitid(String unitid) {
		return trainingmapper.queryTraningInfoByUnitid(unitid);
	}
	
	//创建添加培训课程
	public Integer CreateCourse(course c) {
		return trainingmapper.CreateCourse(c);
	}
	//根据id编辑课程
	public Integer EditCourseById(course c)
	{
		return trainingmapper.EditCourseById(c);
	}
	//根据id删除课程
	public Integer DeleteCourseById(course c){
		return trainingmapper.DeleteCourseById(c);
	}
	//通过培训id查询课程信息
	public List<course> queryCourseByTrainingid(String trainingid){
		return trainingmapper.queryCourseByTrainingid(trainingid);
	}
	//批量删除课程
	public Integer DeleteCourseByIds(List<Integer> ids) {
		return trainingmapper.DeleteCourseByIds(ids);
	}
	
}
