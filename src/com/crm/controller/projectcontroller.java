package com.crm.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.pojo.Training;
import com.crm.pojo.course;
import com.crm.pojo.employee;
import com.crm.pojo.group2;
import com.crm.pojo.project;
import com.crm.pojo.unit;
import com.crm.service.projectservice;
import com.crm.service.unitservice;

/**
 * 科技项目表控制层
 * 
 * @author Administrator
 *
 */
@Controller
public class projectcontroller {
	@Autowired
	private projectservice projectservice;
	@Autowired
	private unitservice unitservice;
	// 插入数据
	@RequestMapping("Projectadd.action")
	public void Projectadd(project p2,HttpServletRequest req,HttpServletResponse rep, Model m) throws IOException {
		/*
		 * String ework=p2.getEwork(); Integer wid=Integer.parseInt(ework)-1;
		 * p2.setEwork(Integer.toString(wid)); String eunit=p2.getEwork(); Integer
		 * uid=Integer.parseInt(eunit)-1; p2.setEunit(Integer.toString(uid));;
		 */
		projectservice.Projectadd(p2);
		project p=new project();
		peditor(req,m,p);
	rep.sendRedirect("Projecteditor.jsp");
	}
	// 页面跳转
	@ResponseBody
	@RequestMapping(value = "peditor.action", produces = "text/html;charset=UTF-8")
	public String peditor(HttpServletRequest req, Model m,@RequestBody project p) {
//		String page2 = (String) req.getParameter("page");
//		if (page2 == "" || page2 == null) {
//			page2 = "0";
//		}
//		Integer page = Integer.parseInt(page2) - 1;
//		if (page - 1 < 0) {
//			page = 0;
//		}
//		
//		if (p == null) {
//			p = new project();
//		}
//		p.setTotalUsers(page * 8);
//		String uid = (String) req.getSession().getAttribute("uid");
//		if (p.getEwork() == "" || p.getEwork() == null) {
//			p.setEwork(uid);
//		}
		String attribute = (String)req.getSession().getAttribute("uid");
		String duty = String.valueOf((Integer) req.getSession().getAttribute("duty"));
		List<project> ls = null;
		if (p.getId()!=null) {
			p.setEwork(p.getId().toString());
		}else {
			
			p.setEwork(attribute);
		}
		if (duty.equals("2")) {
			ls = projectservice.pselect2(p);
		} else if (duty.equals("3")) {
			ls = projectservice.pselectall2(p);
		}
		// 转换时间格式和单位
		for (project project : ls) {
			if (project.getApplicationtime() != null && project.getAcceptancetime() != null) {
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				String ap = sf.format(project.getApplicationtime());
				String ac = sf.format(project.getAcceptancetime());
				project.setApp(ap);
				project.setAcc(ac);
			}
			
		}
		JSONArray json = new JSONArray();
		Integer index=1;
		for (project pLog : ls) {
			JSONObject jo = new JSONObject();
			jo.put("id", pLog.getId());
			jo.put("name", pLog.getName());
			jo.put("registration", pLog.getRegistration());
			jo.put("ework", pLog.getEwork());
			jo.put("linkman", pLog.getLinkman());
			jo.put("phone", pLog.getPhone());
			pLog.setIndex(index);
			jo.put("index", pLog.getIndex());
			json.put(jo);
			index++;
		}

		return json.toString();
	
	}

	@RequestMapping("pj.action")
	public String pj(HttpServletRequest req, Model m) {
		project pj = projectservice.pj(req.getParameter("id"));
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String ap = sf.format(pj.getApplicationtime());
		String ac = sf.format(pj.getAcceptancetime());
		pj.setApp(ap);
		pj.setAcc(ac);
		//List<unit> findall = unitservice.findall();
		
		m.addAttribute("pj", pj);
		return "projectupdate";

	}

	// 修改科技项目数据
	@RequestMapping("pupdate.action")
	public String pupdate(HttpServletRequest req, project p, Model m) {
		/*
		 * String ework=p.getEwork(); Integer wid=Integer.parseInt(ework)-1;
		 * p.setEwork(Integer.toString(wid)); String eunit=p.getEwork(); Integer
		 * uid=Integer.parseInt(eunit)-1; p.setEunit(Integer.toString(uid));;
		 */
		projectservice.pupdate(p);
		project  p2=new project();
		peditor(req,m,p2);
		return "Projecteditor";
	}

	// 条件查询
	@RequestMapping("pfil.action")
	public String pfil(HttpServletRequest req, project p, Model m) {
		String uid = req.getParameter("uid");
		String duty = req.getParameter("duty");
		List<project> pfile = null;
		if (duty.equals("2")) {
			p.setUid(uid);
			pfile = projectservice.pfile(p);
		} else if (duty.equals("3")) {
			pfile = projectservice.pfileall(p);
		}
		for (project project : pfile) {
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			String ap = sf.format(project.getApplicationtime());
			String ac = sf.format(project.getAcceptancetime());
			project.setApp(ap);
			project.setAcc(ac);
		}
		m.addAttribute("project", pfile);
		return "Projecteditor";
	}

	@RequestMapping("pdelete.action")
	public String pdelete(HttpServletRequest req,Model m) {
		String id = req.getParameter("id");
		projectservice.pdelete(id);
		project p=new project();
		peditor(req, m, p);
		return "Projecteditor";
	}

	// 跳转统计页面
	@RequestMapping("start.action")
	public String start(Model m, HttpServletRequest req) {
		int numb;
		int money = 0;
		String duty = req.getParameter("duty");
		String uid = req.getParameter("uid");
		List<project> start = null;
		if (duty.equals("2")) {
			// 权限为二查询本单位的所有项目
			start = projectservice.starta(uid);
		} else if (duty.equals("3")) {
			start = projectservice.start();
		}
		for (project project : start) {
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			String ap = sf.format(project.getApplicationtime());
			String ac = sf.format(project.getAcceptancetime());
			project.setAcc(ac);
			project.setApp(ap);
			if (project.getExpenditure() != null && project.getExpenditure() != "") {
				money = money + Integer.parseInt(project.getExpenditure());
			}
		}
		numb = start.size();
		m.addAttribute("inform", start);
		m.addAttribute("numb", numb);
		m.addAttribute("money", money);
		return "start";
	}

	@RequestMapping("apply.action")
	public @ResponseBody List<project> sl(HttpServletRequest req) {
		String duty = req.getParameter("duty");
		String uid = req.getParameter("uid");
		if (duty.equals("2")) {
			return projectservice.starta(uid);
		}
		return projectservice.start();

	}

	// 导入表格
	@RequestMapping(value = "fileUploadP.action", produces = "application/text; charset=utf-8")
	public String UploadExcel2(HttpServletRequest request, HttpServletResponse response,Model m) throws Exception {
		List<String> ajaxUploadExcel = projectservice.ajaxUploadExcel(request, response);
     	m.addAttribute("error", ajaxUploadExcel);
		return "projectadds";
	}

	// 跳转到推送页面
	@RequestMapping("push.action")
	public String push(Model m) {
		List<project> pselectall = projectservice.pselectall();
		for (project project : pselectall) {
			Date applicationtime = project.getApplicationtime();// 申报
			Date acceptancetime = project.getAcceptancetime();// 验收
			long time1 = applicationtime.getTime();
			long time2 = acceptancetime.getTime();
			long time = time2 - time1;
			long days = time / (1000 * 60 * 60 * 24);
			project.setTime(days);
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			String ap = sf.format(project.getApplicationtime());
			String ac = sf.format(project.getAcceptancetime());
			project.setApp(ap);
			project.setAcc(ac);
		}
		m.addAttribute("pro", pselectall);
		return "push";
	}

	@RequestMapping("remind.action")
	public @ResponseBody String remind(HttpServletRequest req) {
		String ework = req.getParameter("ework");
		String linkman = req.getParameter("linkman");
		String id = req.getParameter("id");
		project p = new project();
		p.setEwork(ework);
		p.setLinkman(linkman);
		p.setId(Integer.parseInt(id));
		projectservice.remind(p);
		return "success";
	}

	@RequestMapping("get.action")
	public @ResponseBody int get(HttpServletRequest req) {
		String duty = req.getParameter("duty");
		String uid = req.getParameter("uid");
		project p = new project();
		List<project> nselect = null;
		if (duty.equals("2")) {
			p.setEwork(uid);
			nselect = projectservice.nselect(p);
			for (project project : nselect) {
				projectservice.up(project);
			}

			return nselect.size();
		}
		return 0;
	}
	@RequestMapping("selectname.action")
	public @ResponseBody project selectname(String name) {
		project g=new project();
		System.out.println(name);
		List<project> groupfindall = projectservice.selectbyname(name);
		if (groupfindall.size()!=0&&name!="") {
         g.setName("此项目名已被使用,请重新输入");
		
		}
		return g;
	}
	@RequestMapping("updatedt.action")
	public String  updatedt(Integer id,HttpServletRequest req) {
		project p=new project();
		p.setId(id);
		projectservice.remind(p);
	 List<project>	pselectall = projectservice.pselectall();
	 List<String> s = new ArrayList<String>();
		s.add("#5873fe");
		s.add("#e6a1f2");
		s.add("#e7b63a");
		s.add("#545454");
		for (int i = 0; i < pselectall.size(); i++) {
			pselectall.get(i).setColor(s.get(i % 4));
			Date applicationtime = pselectall.get(i).getApplicationtime();// 申报
			Date acceptancetime = pselectall.get(i).getAcceptancetime();// 验收
			long time1 = applicationtime.getTime();
			long time2 = acceptancetime.getTime();
			long time = time2 - time1;
			long days = time / (1000 * 60 * 60 * 24);
			pselectall.get(i).setTime(days);
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			String ap = sf.format(pselectall.get(i).getApplicationtime());
			String ac = sf.format(pselectall.get(i).getAcceptancetime());
			pselectall.get(i).setApp(ap);
			pselectall.get(i).setAcc(ac);
		}
		req.getSession().removeAttribute("pselectall");
		req.getSession().setAttribute("pselectall",pselectall);
		return "homepage";
	}
	@ResponseBody
	@RequestMapping("deleteall.action")
	public  String deleteall(String userList) {
		String[] strs = userList.split(",");
		   List<String> ids = new ArrayList<>();
		   for (int i = 0; i < strs.length; i++) {
		        ids.add(strs[i]);
		   }
		 projectservice.deletall(ids);
		   
		return "ok";

	}
}
