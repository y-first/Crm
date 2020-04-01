package com.crm.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.pojo.GroupPersonnel;
import com.crm.pojo.Training;
import com.crm.pojo.Trainingvo;
import com.crm.pojo.achievment;
import com.crm.pojo.unit;
import com.crm.pojo.course;
import com.crm.service.trainingservice;
import com.crm.service.unitservice;

/**
 * 教育培训表
 * 
 * @author Administrator
 *
 */
@Controller
public class trainingcontroller {
	@Autowired
	private unitservice unitservice;
	@Autowired
	private trainingservice trainingservice;

	// 插入数据
	@RequestMapping("Trainingadd.action")
	public void Trainingadd(Training t, Model m, HttpServletRequest req, HttpServletResponse rep) throws IOException {
		trainingservice.Trainingadd(t);
		Trainingfindall(m, req);
		rep.sendRedirect("trainingadd.jsp");
	}

	// 查询所有
	@RequestMapping("Trainingfindall.action")
	public String Trainingfindall(Model m, HttpServletRequest req) {
		String uid = req.getSession().getAttribute("uid").toString();
		System.out.println(uid);
		String duty = req.getSession().getAttribute("duty").toString();
		List<Training> trainingfindall = null;
		if (duty.equals("2")) {
			trainingfindall = trainingservice.transelect(uid);
		} else if (duty.equals("3")) {
			trainingfindall = trainingservice.Trainingfindall();
		}
		for (Training Training : trainingfindall) {
			if (Training.getPtime() != null) {
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				String ap = sf.format(Training.getPtime());
				Training.setP(ap);
			}
			if (Training.getAtime() != null) {
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				String ap = sf.format(Training.getAtime());
				Training.setA(ap);
			}
		}
		req.getSession().removeAttribute("traininglist");
		req.getSession().setAttribute("traininglist", trainingfindall);
		return "training";
	}

	// 培训上报
	@RequestMapping("Trainingfindall2.action")
	public String Trainingfindall2(Model m, HttpServletRequest req) {
		String uid = req.getParameter("uid");
		String duty = req.getParameter("duty");
		List<Training> trainingfindall = null;
		trainingfindall = trainingservice.transelect(uid);
		System.out.println(trainingfindall.size());
		m.addAttribute("training", trainingfindall);
		return "annual";
	}

	// 条件查询
	@RequestMapping("page.action")
	public String Page(Training vo, Model m, HttpServletRequest req) {

		List<Training> page = trainingservice.Page(vo);
		for (Training Training : page) {
			if (Training.getPtime() != null) {
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				String ap = sf.format(Training.getPtime());
				Training.setP(ap);
			}
			if (Training.getAtime() != null) {
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				String ap = sf.format(Training.getAtime());
				Training.setA(ap);
			}
		}
		req.setAttribute("name", vo.getUnitname());
		m.addAttribute("traininglist", page);
		return "training";
	}

	// 删除数据
	@RequestMapping("Trainingdelete.action")
	public String Trainingdelete(Integer id) {
		trainingservice.Trainingdelete(id);
		return "training";
	}

	// 查询单个数据
	@RequestMapping("trainingByid.action")
	public String trainingByid(HttpServletRequest req, Model m) {
		Integer id = Integer.parseInt(req.getParameter("id"));
		Training trainingByid = trainingservice.trainingByid(id);
		if (trainingByid.getPtime() != null) {
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			String ap = sf.format(trainingByid.getPtime());
			trainingByid.setP(ap);
		}
		if (trainingByid.getAtime() != null) {
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			String ap = sf.format(trainingByid.getAtime());
			trainingByid.setA(ap);
		}
		m.addAttribute("trainingu", trainingByid);
		return "trainingupdate";
	}

	// 更新数据
	@RequestMapping("trainingupdate.action")
	public String trainingupdate(Training t, Model m, HttpServletRequest req) {
		String uid = req.getParameter("uid");
		String duty = req.getParameter("duty");
		if (duty.equals("2")) {
			System.out.println(t.getAtime());
			trainingservice.tranupdate(t);
			List<Training> trainingfindall = trainingservice.transelect(uid);
			for (Training Training : trainingfindall) {
				if (Training.getPtime() != null) {
					SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
					String ap = sf.format(Training.getPtime());
					Training.setP(ap);
				}
				if (Training.getAtime() != null) {
					SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
					String ap = sf.format(Training.getAtime());
					Training.setA(ap);
				}
			}
			m.addAttribute("training", trainingfindall);
		} else if (duty.equals("3")) {
			trainingservice.trainingupdate(t);
			List<Training> trainingfindall = trainingservice.Trainingfindall();
			for (Training Training : trainingfindall) {
				if (Training.getPtime() != null) {
					SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
					String ap = sf.format(Training.getPtime());
					Training.setP(ap);
				}
				if (Training.getAtime() != null) {
					SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
					String ap = sf.format(Training.getAtime());
					Training.setA(ap);
				}
			}
			m.addAttribute("traininglist", trainingfindall);
			return "training";
		}

		return "annual";
	}

	@RequestMapping("edstart.action")
	public String edstart(HttpServletRequest req, Model m) {
		String uid = req.getParameter("uid");
		String duty = req.getParameter("duty");
		List<Training> trainingfindall = null;
		if (duty.equals("2")) {
			trainingfindall = trainingservice.transelect(uid);
		} else if (duty.equals("3")) {
			trainingfindall = trainingservice.Trainingfindall();
		}
		m.addAttribute("tl", trainingfindall);
		int money = 0;
		m.addAttribute("numb", trainingfindall.size());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		for (Training training : trainingfindall) {
			if (training.getAtime() != null) {
				training.setA(sdf.format(training.getAtime()));
				if (training.getAfunds() == null) {
					training.setAfunds("0");
				}
				money = money + Integer.parseInt(training.getAfunds());
			}
		}
		m.addAttribute("money", money);
		return "edstart";
	}

	@RequestMapping("edstarta.action")
	public @ResponseBody List<Training> edstarta(HttpServletRequest req, Model m) {
		String uid = req.getParameter("uid");
		String duty = req.getParameter("duty");
		List<Training> trainingfindall = null;
		if (duty.equals("2")) {
			trainingfindall = trainingservice.transelect(uid);
		} else if (duty.equals("3")) {
			trainingfindall = trainingservice.Trainingfindall();
		}

		return trainingfindall;
	}

	// 导入表格
	@RequestMapping(value = "fileUploadT.action", produces = "application/text; charset=utf-8")
	public String UploadExcel3(Model m, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<String> ajaxUploadExcel = trainingservice.ajaxUploadExcel(request, response);
		m.addAttribute("error", ajaxUploadExcel);
		return "trainingadds";
	}

	// 条件查询
	@RequestMapping("selectbytname.action")
	public @ResponseBody Training selectbytname(String name, Model m) {
		Training a = new Training();
		List<Training> selectbytname = trainingservice.selectbytname(name);
		if (selectbytname.size() != 0 && name != "") {
			a.setName("培训名称已被使用");
		}
		return a;
	}

	@RequestMapping("tdelete.action")
	public @ResponseBody String tdelete(@RequestBody List<String> arr) {
		if (arr.size() == 0) {
			return null;
		}
		trainingservice.tdelete(arr);
		return "1";
	}

	@ResponseBody
	@RequestMapping(value = "queryTraningInfoByUnitid.action", produces = "text/html;charset=UTF-8")
	public String queryTraningInfoByUnitid(@RequestBody Training t, HttpServletResponse response) {
		List<Training> tList = trainingservice.queryTraningInfoByUnitid(t.getUnitid());

		JSONArray json = new JSONArray();
		for (Training pLog : tList) {
			JSONObject jo = new JSONObject();
			jo.put("id", pLog.getId());
			jo.put("name", pLog.getName());

			json.put(jo);
		}
		return json.toString();
		/*
		 * PrintWriter out=response.getWriter();
		 * 
		 * User user=userService.Login2(email,password); if(user!=null){
		 * out.println("密码正确");
		 * 
		 * }else{ out.println("密码错误"); }
		 * 
		 * out.flush(); out.close();
		 */

	}
	
	//添加课程
	@ResponseBody
	@RequestMapping(value = "CreateCourse.action", produces = "text/html;charset=UTF-8")
	public String CreateCourse(@RequestBody course c, HttpServletResponse response) {

		Integer rows=trainingservice.CreateCourse(c);
		JSONObject jo = new JSONObject();

		
		  if(rows>0) { jo.put("message",true); }else { jo.put("message",false); }
		
		/*
		 * for(Training pLog : tList){ JSONObject jo = new JSONObject(); jo.put("id",
		 * pLog.getId()); jo.put("name", pLog.getName());
		 * 
		 * json.put(jo); }
		 */
		return jo.toString();
	}
	
	//编辑课程
	@ResponseBody
	@RequestMapping(value = "EditCourseById.action", produces = "text/html;charset=UTF-8")
	public String EditCourseById(@RequestBody course c, HttpServletResponse response) {

		Integer rows=trainingservice.EditCourseById(c);
		JSONObject jo = new JSONObject();

		
		  if(rows>0) { jo.put("message",true); }else { jo.put("message",false); }
		
		return jo.toString();
	}
	
	//删除课程
		@ResponseBody
		@RequestMapping(value = "DeleteCourseById.action", produces = "text/html;charset=UTF-8")
		public String DeleteCourseById(@RequestBody course c, HttpServletResponse response) {

			Integer rows=trainingservice.DeleteCourseById(c);
			JSONObject jo = new JSONObject();
			if(rows>0) { 
				jo.put("message",true); 
			}else { 
				jo.put("message",false); 
			}
			return jo.toString();
		}
	//批量删除课程
	@ResponseBody
	@RequestMapping("DeleteCourseByIds.action")
	public String DeleteCourseByIds(String userList) {
	   String[] strs = userList.split(",");
	   List<Integer> ids = new ArrayList<>();
	   for (int i = 0; i < strs.length; i++) {
	        ids.add(Integer.parseInt(strs[i]));
	   }
	   Integer rows=trainingservice.DeleteCourseByIds(ids);
	   if(rows>0) { 
			return "ok"; 
		}else { 
			 return "error"; 
		}
	  
	}
		
	//根据培训会议id查询课程
	@ResponseBody
	@RequestMapping(value = "queryCourseByTrainingid.action", produces = "text/html;charset=UTF-8")
	public String queryCourseByTrainingid(@RequestBody Training t, HttpServletResponse response) {
		List<course> courseList = trainingservice.queryCourseByTrainingid(t.getId().toString());
		JSONArray json = new JSONArray();
		Integer index=1;
		for (course pLog : courseList) {
			JSONObject jo = new JSONObject();
			jo.put("id", pLog.getId());
			jo.put("coursename", pLog.getCoursename());
			jo.put("teacher", pLog.getTeacher());
			pLog.setIndex(index);
			jo.put("index", pLog.getIndex());
			json.put(jo);
			index++;
		}
		return json.toString();
		/*
		 * PrintWriter out=response.getWriter();
		 * 
		 * User user=userService.Login2(email,password); if(user!=null){
		 * out.println("密码正确");
		 * 
		 * }else{ out.println("密码错误"); }
		 * 
		 * out.flush(); out.close();
		 */

	}
}
