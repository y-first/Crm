package com.crm.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.pojo.Personnel;
import com.crm.pojo.club;
import com.crm.pojo.clubvc;
import com.crm.pojo.employee;
import com.crm.pojo.project;
import com.crm.pojo.unit;
import com.crm.service.ClubService;
import com.crm.service.Personnelservice;
import com.crm.service.projectservice;
import com.crm.service.unitservice;

@Controller
public class ClubController {
	@Autowired
	private projectservice projectservice;
	@Autowired
	private Personnelservice Personnelservice;
	@Autowired
	private unitservice unitservice;
	@Resource(name = "ClubService")
	private ClubService clubservice;

	
	// 社团信息删除
	@RequestMapping("clubdelete.action")
	public String clubdelete(HttpServletRequest req) {
		clubservice.clubdelete(req.getParameter("id"));
		return "RegEditor";
	}
	
	// 完成数据渲染
	@RequestMapping("us.action")
	public String us(HttpServletRequest req, Model m) {
		com.crm.pojo.club us = clubservice.us(req.getParameter("id"));
		// 格式化日期
		Date eontime = us.getEontime();
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		String format = sm.format(eontime);
		us.setFormatting(format);
		m.addAttribute("us", us);
		return "orgupdate";
	}

	// 更新社团数据
	@RequestMapping("clubupdate.action")
	public String clubupdate(club c, Model m, HttpServletRequest req) throws ParseException {
		clubservice.clubupdate(c);
		String uid = req.getParameter("uid");
		String duty = req.getParameter("duty");
		List<club> clubselect = null;
		if (duty.equals("2")) {
			clubselect = clubservice.clubselect(uid);
		} else if (duty.equals("3")) {
			clubselect = clubservice.clubselectall();
		}
		// 格式化日期
		for (club club : clubselect) {
			Date eontime = club.getEontime();
			SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
			String format = sm.format(eontime);
			club.setFormatting(format);
		}
		m.addAttribute("club", clubselect);
		return "RegEditor";
	}

	// 条件查询
	@RequestMapping("filtrate.action")
	public String filtrate(clubvc c, Model m, HttpServletRequest req) {
		String uid =String.valueOf(req.getSession().getAttribute("uid"));
		
		String duty = req.getParameter("duty");
		c.setUid(uid);
		List<clubvc> filtrate = null;
		if (duty.equals("2")) {
			System.out.println(uid);
			c.setSunit(uid);
			filtrate = clubservice.filtrate(c);
		} else if (duty.equals("3")) {
			filtrate = clubservice.tfiltrate(c);
		}
		for (clubvc clubvc : filtrate) {
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			String format = sf.format(clubvc.getEontime());
			clubvc.setFormatting(format);
		}
		m.addAttribute("club", filtrate);
		return "RegEditor";
	}

	// 登陆判断
	@RequestMapping("login.action")
	public String login(employee e, HttpServletRequest req, Model m, HttpServletResponse rep) {
		req.getSession().removeAttribute("unitalert");
		employee login = clubservice.login(e);
		List<unit> findall = unitservice.findall();
		req.getSession().setAttribute("unitlist", findall);
		if (login == null) {
			return "login";
		}
		req.getSession().setAttribute("emp", login);
		req.getSession().setAttribute("duty", login.getDuty());
		req.getSession().setAttribute("uid", login.getUid());
		req.getSession().setAttribute("unitname", login.getUnitname());
		homepage(login,req,m,rep);
		return "homepage";
	}

	// 密码修改
	@RequestMapping("upassword.action")
	public String upassword() {
		return null;
	}
	@RequestMapping("homepage.action")
	public String homepage(employee login,HttpServletRequest req, Model m, HttpServletResponse rep) {
		if (login.getDuty()==null) {
		login=(employee)req.getSession().getAttribute("emp");
	}
		List<String> s = new ArrayList<String>();
		s.add("#5873fe");
		s.add("#e6a1f2");
		s.add("#e7b63a");
		s.add("#545454");
		List<project> pselectall = null;
		if (login.getDuty() == 3) {
			login.setUid("");
			req.getSession().setAttribute("emp", login);
			pselectall = projectservice.pselectall();

		} else if (login.getDuty() == 2) {
			req.getSession().setAttribute("emp", login);
			pselectall = projectservice.ps(login.getUid());
		} else {
			return "homepage";
		}
		req.getSession().setAttribute("duty", login.getDuty());
		req.getSession().setAttribute("uid", login.getUid());
		for (int i = 0; i < pselectall.size(); i++) {
				String r,g,b;  
			  Random random = new Random();  
			  r = Integer.toHexString(random.nextInt(256)).toUpperCase();  
			  g = Integer.toHexString(random.nextInt(256)).toUpperCase();  
			  b = Integer.toHexString(random.nextInt(256)).toUpperCase();  
			    
			  r = r.length()==1 ? "0" + r : r ;  
			  g = g.length()==1 ? "0" + g : g ;  
			  b = b.length()==1 ? "0" + b : b ;  
			  pselectall.get(i).setColor("#"+r+g+b);
			   
			//pselectall.get(i).setColor(s.get(i % 4));
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
		if (login.getDuty() == 2) {
			if (pselectall.size()!=0) {
				req.getSession().setAttribute("unitalert", pselectall);
				req.getSession().setAttribute("flag", 1);
			}else {
				req.getSession().setAttribute("flag", 0);
			}
		}
		if (login.getDuty() == 3) {
			req.getSession().setAttribute("pselectall", pselectall);
		}
		return "homepage";
	}
	// 添加权限
	@RequestMapping("addEmployee.action")
	public String addEmployee(employee e) {
		if (e.getUid() != "" && e.getUid() != null) {
			if (e.getPid() != null && e.getPid() != "") {
				e.setDuty(1);
			} else {
				e.setDuty(2);

			}
		} else {
			e.setDuty(3);
		}
		clubservice.addUser(e);
		return "homepage";
	}

	// 查询人员
	@RequestMapping("selectmh.action")
	public String selectmh(Personnel p, Model m) {
		List<Personnel> selectmhpersonnel = Personnelservice.selectmhpersonnel(p);
		m.addAttribute("mh", selectmhpersonnel);
		return "addUser";
	}
	// 查询人员
		@RequestMapping("selectmh2.action")
		public String selectmh2(employee employee, Model m) {
			List<com.crm.pojo.employee> selectAll = Personnelservice.selectAll(employee);
			m.addAttribute("mh", selectAll);
			return "removeUser";
		}

	// 查询账号
	@RequestMapping("selectUser.action")
	public String selectUser(employee e, Model m) {
		if (e==null) {
			e=new employee();
		}
		List<employee> selectUser = clubservice.selectUser(e);
		m.addAttribute("selectUser", selectUser);
		return "removeUser";
	}
	@RequestMapping("chdelete.action")
	public @ResponseBody String chdelete(@RequestBody List<String> arr){
		if (arr.size() == 0) {
			return null;
		}
		clubservice.chdelete(arr);
		return "1";
	}
}
