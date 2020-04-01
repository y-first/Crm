package com.crm.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.pojo.achievment;
import com.crm.service.achievmentservice;

/**
 * 科技成果表控制层
 * 
 * @author Administrator
 *
 */
@Controller
public class achievmentcontroller {
	@Autowired
	private achievmentservice achievmentservice;

	// 插入数据
	@RequestMapping("Achievmentadd.action")
	public void Achievmentadd(achievment a, Model m, HttpServletRequest req,HttpServletResponse rep) throws IOException {
		achievmentservice.Achievmentadd(a);
		Date date = new Date();// 获取当前时间
		a.setEntrytime(date);
		Achievmentfindall(m, req);
		rep.sendRedirect("achievement.jsp");
	}

	// 查询所有
//	@RequestMapping("Achievmentfindall.action")
//	public String Achievmentfindall(Model m, HttpServletRequest req) {
//		int duty = (int) req.getSession().getAttribute("duty");
//		String uid = (String) req.getSession().getAttribute("uid");
//		List<achievment> achievmentfindall = null;
//		if (duty == 2) {
//			achievmentfindall = achievmentservice.achfind(uid);
//
//		} else if (duty == 3) {
//			achievmentfindall = achievmentservice.Achievmentfindall();
//		}
//		// 转换时间格式
//		for (achievment achievment : achievmentfindall) {
//			if (achievment.getTime() != null) {
//				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
//				String ap = sf.format(achievment.getTime());
//				Calendar c = Calendar.getInstance();
//				c.setTime(achievment.getEntrytime());
//				int year = c.get(Calendar.YEAR);
//				String ent = String.valueOf(year);
//				achievment.setZtime(ap);
//				achievment.setEnt(ent);
//			}
//		}
//		List<Integer> list = new ArrayList<Integer>();
//		for (achievment achievment : achievmentfindall) {
//			Integer in = Integer.parseInt(achievment.getEnt());
//			list.add(in);
//		}
//		List<Integer> list2 = new ArrayList<Integer>();
//		for (Integer cd : list) {
//			if (!list2.contains(cd)) {
//				list2.add(cd);
//			}
//		}
//
//		Integer totalPages = achievmentfindall.size() % 8 == 0 ? achievmentfindall.size() / 8
//				: achievmentfindall.size() / 8 + 1;
//		m.addAttribute("totalPages", totalPages);
//
//	
//		req.getSession().setAttribute("listyear", list2);
//		m.addAttribute("achievmentfindall", achievmentfindall);
//		return "achievement";
//	}

	// 根据id查询
	@RequestMapping("AchievmentByid.action")
	public String AchievmentByid(Model m, HttpServletRequest req) {
		Integer id = Integer.parseInt(req.getParameter("aid"));
		achievment achievmentByid = achievmentservice.AchievmentByid(id);
		if (achievmentByid.getTime() != null) {
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			String ap = sf.format(achievmentByid.getTime());
			achievmentByid.setZtime(ap);
		}
		m.addAttribute("achievmentu", achievmentByid);
		return "achievementupdate";
	}

	// 修改数据
	@RequestMapping("Achievmentudate.action")
	public String Achievmentudate(achievment achi, Model m,HttpServletRequest req) {
		achievmentservice.Achievmentudate(achi);
		int duty = (int) req.getSession().getAttribute("duty");
		String uid = (String) req.getSession().getAttribute("uid");
		List<achievment> achievmentfindall = achievmentservice.Achievmentfindall();
		if (duty == 2) {
			achievmentfindall = achievmentservice.achfind(uid);
			//ach = achievmentservice.achfind1(p);

		} else if (duty == 3) {
			achievmentfindall = achievmentservice.Achievmentfindall();
			//ach = achievmentservice.Achievmentfindall1(pg*8);
		}
		// 转换时间格式
		for (achievment achievment : achievmentfindall) {
			if (achievment.getTime() != null) {
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				String ap = sf.format(achievment.getTime());
				achievment.setZtime(ap);
			}
		}
		m.addAttribute("achievmentfindall", achievmentfindall);
		return "achievement";
	}

	// 删除数据
	@RequestMapping("Achievmentdelete.action")
	public String Achievmentudelete(Integer id, Model m,HttpServletRequest req) {
		achievmentservice.Achievmentdelete(id);
		Achievmentfindall(m, req);
		return "achievement";
	}

	// 条件查询
	@RequestMapping("achiBynt.action")
	public String achiBynt(achievment a, Model m) {
		List<achievment> achievmentfindall = achievmentservice.achiBynt(a);
		// 转换时间格式
		for (achievment achievment : achievmentfindall) {
			if (achievment.getTime() != null) {
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				String ap = sf.format(achievment.getTime());
				achievment.setZtime(ap);
			}
		}
		m.addAttribute("achievmentfindall", achievmentfindall);
		return "achievement";
	}

	// 导入表格
	@RequestMapping(value = "fileUpload.action", produces = "application/text; charset=utf-8")
	public String UploadExcel(HttpServletRequest request, HttpServletResponse response, Model m) throws Exception {
		List<String> ajaxUploadExcel = achievmentservice.ajaxUploadExcel(request, response);
		m.addAttribute("error", ajaxUploadExcel);
		return "achievementadds";
	}

	// 条件查询
	@RequestMapping("selectbyname.action")
	public @ResponseBody achievment selectbyname(String name, Model m) {
		achievment a = new achievment();
		List<achievment> achiBynt = achievmentservice.selectbyname(name);
		if (achiBynt.size() != 0 && name != "") {
			a.setName("成果名称已被使用");
		}
		return a;
	}

	@RequestMapping("achdelete.action")
	public @ResponseBody String achdelete(@RequestBody List<String> arr) {

		if (arr.size() == 0) {
			return null;
		}
		achievmentservice.achdelete(arr);
		return "1";
	}
   
	@RequestMapping("Achievmentfindall.action")
	public String Achievmentfindall(Model m, HttpServletRequest req) {
		int duty = (int) req.getSession().getAttribute("duty");
		String uid = (String) req.getSession().getAttribute("uid");
		/*
		 * String page = req.getParameter("page"); if (page == "" || page == null) {
		 * page = "0"; } Integer pg = Integer.parseInt(page) - 1; if (pg - 1 < 0) { pg =
		 * 0; }
		 */
		List<achievment> achievmentfindall = null;
		List<achievment> ach = null;
		com.crm.pojo.page p = new com.crm.pojo.page();
	
		p.setUid(uid);
		//p.setPg(pg*8);
		if (duty == 2) {
			achievmentfindall = achievmentservice.achfind(uid);
			//ach = achievmentservice.achfind1(p);

		} else if (duty == 3) {
			achievmentfindall = achievmentservice.Achievmentfindall();
			//ach = achievmentservice.Achievmentfindall1(pg*8);
		}
		// 转换时间格式
		for (achievment achievment : achievmentfindall) {
			if (achievment.getTime() != null) {
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				String ap = sf.format(achievment.getTime());
				Date time = achievment.getTime();;
				Calendar c = Calendar.getInstance();
				c.setTime(time);
				int year = c.get(Calendar.YEAR);
				String ent = String.valueOf(year);
				achievment.setZtime(ap);
				achievment.setEnt(ent);
			}
		}
		List<Integer> list = new ArrayList<Integer>();
		for (achievment achievment : achievmentfindall) {
			Integer in = Integer.parseInt(achievment.getEnt());
			list.add(in);
		}
		List<Integer> list2 = new ArrayList<Integer>();
		for (Integer cd : list) {
			if (!list2.contains(cd)) {
				list2.add(cd);
			}
		}
  
		Integer totalPages = achievmentfindall.size() % 8 == 0 ? achievmentfindall.size() /8
				: achievmentfindall.size() / 8 + 1;
		req.getSession().setAttribute("totalPages", totalPages);
		req.getSession().setAttribute("listyear", list2);
		req.getSession().setAttribute("achievmentfindall", achievmentfindall);
		return "achievement";
	}
}
