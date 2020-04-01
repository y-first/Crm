package com.crm.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.json.JSONObject;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
//import com.alibaba.fastjson.JSONObject;
import com.crm.pojo.AbroadBudget;
import com.crm.pojo.BudgetSummary;
import com.crm.pojo.GroupPersonnel;
import com.crm.pojo.Personnel;
import com.crm.pojo.group2;
import com.crm.pojo.unit;
import com.crm.service.Personnelservice;
import com.crm.service.budgetsummaryservice;
import com.crm.service.grouppersonnelservice;
import com.crm.service.groupservice;
import com.crm.service.unitservice;

/**
 * 团体表表控制层 出国资格验证
 * 
 * @author Administrator
 *
 */
@Controller
public class groupcontroller {
	@Autowired
	private Personnelservice personnelservice;
	@Autowired
	private unitservice unitservice;
	@Autowired
	private grouppersonnelservice grouppersonnelservice;
	@Autowired
	private groupservice groupservice;
	@Autowired
	private budgetsummaryservice budgetsummaryservice;

	// 插入数据
	@RequestMapping("groupadd.action")
	private void groupadd(group2 g, Model m, HttpServletRequest req, HttpServletResponse rep) throws IOException {
		groupservice.Groupadd(g);
		groupfindall(m, req);
		rep.sendRedirect("group.jsp");
	}

	// 查询所有团组
	@RequestMapping("groupfindall.action")
	private String groupfindall(Model m, HttpServletRequest req) {
		List<group2> groupfindall = groupservice.groupfindall();
		req.getSession().setAttribute("groupfindall", groupfindall);
		return "group";
	}

	// 跳转至团组人员修改
	@RequestMapping("gp.action")
	private String gp(Model m, HttpServletRequest req) {
		Integer id = Integer.parseInt(req.getParameter("gid"));
		req.getSession().setAttribute("gid", id);
		List<GroupPersonnel> selectByid = grouppersonnelservice.selectByid(id);
		m.addAttribute("grouppersonnel", selectByid);
		return "group_personnel";
	}
	
	//根据团组id获取团组人员
	@ResponseBody
	@RequestMapping(value="getGroupBygid.action",produces="text/html;charset=UTF-8")
	private String getGroupBygid(@RequestBody GroupPersonnel group) {
		
		Integer id = group.getGroupid();
		
		List<GroupPersonnel> GPNum = grouppersonnelservice.selectByid(id);
		JSONArray json = new JSONArray();
        for(GroupPersonnel pLog : GPNum){
            JSONObject jo = new JSONObject();
            jo.put("groupid", pLog.getGroupid());
            jo.put("name", pLog.getName());
            jo.put("unitname", pLog.getUnitname());
            jo.put("accesscountry", pLog.getAccesscountry());
            jo.put("role", pLog.getRole());
            json.put(jo);
        }
        return json.toString();
       
		
	}

	// 跳转至出国人员打印
	@RequestMapping("print.action")
	private String dy(Model m, HttpServletRequest req, String uid) {
		if (String.valueOf(req.getSession().getAttribute("duty")).equals("2")) {
			List<group2> groupfindall = groupservice.selectByunit(uid);
			m.addAttribute("groupfindall", groupfindall);
			return "print";
		}
		List<group2> groupfindall = groupservice.groupfindall();
		m.addAttribute("groupfindall", groupfindall);
		return "print";
	}

	// 查询团组人员
	@RequestMapping("dy2.action")
	private String dy2(Model m, HttpServletRequest req) {
		List<group2> groupfindall=null;
		if (String.valueOf(req.getSession().getAttribute("duty")).equals("2")) {
			groupfindall= groupservice.selectByunit(String.valueOf(req.getSession().getAttribute("uid")));
		}
		else {
			groupfindall= groupservice.groupfindall();
			
		}
		m.addAttribute("groupfindall", groupfindall);
		Integer id = Integer.parseInt(req.getParameter("gid"));
		req.getSession().setAttribute("gid", id);
		List<GroupPersonnel> selectByid = grouppersonnelservice.selectByid(id);
		m.addAttribute("grouppersonnel", selectByid);
		return "print";
	}

	// 删除团组
	@RequestMapping("deletegroup.action")
	private String remove(Integer id) {
		groupservice.deletegroup(id);
		return "group";
	}

	// 删除团组人员
	@RequestMapping("deletegroupperson.action")
	private String removeperson(Integer id, Integer gid,Integer pid, Model m) {
		group2 group2 = groupservice.selectByid(gid);
		Integer shu = Integer.parseInt(group2.getAccess());
		String s = String.valueOf(shu - 1);
		group2.setAccess(s);
		groupservice.addperson(group2);
		grouppersonnelservice.deletegroupperson(id);
		List<GroupPersonnel> selectByid = grouppersonnelservice.selectByid(gid);
		m.addAttribute("grouppersonnel", selectByid);
		//添加出访记录
		String infoabroad="";
		List<group2> gpList= grouppersonnelservice.queryByPid(pid);
		for (group2 gp : gpList) {
			
			String d=gp.getAccesstime();
			String country=gp.getAccesscountry();
			String aim=gp.getAim();
			String name=gp.getName();
			infoabroad+="团组名："+name+"，出团时间："+d+"，地区："+country+"，出团性质："+aim+"\r\n";
		}
		Personnel p=new Personnel();
		p.setId(pid);
		p.setInfoabroad(infoabroad);
		personnelservice.updateInfoabroadByPid(p);
		return "group_personnel";
	}

	// 根据单位和名称查询人员
	@RequestMapping("selectmhpersonnel.action")
	public String selectmhpersonnel(Personnel p, Model m, HttpServletRequest req) {
		Integer id = Integer.parseInt(req.getParameter("id"));
		List<Personnel> selectmhpersonnel = personnelservice.selectmhpersonnel(p);
		m.addAttribute("personnelByun", selectmhpersonnel);
		List<GroupPersonnel> selectByid = grouppersonnelservice.selectByid(id);
		m.addAttribute("grouppersonnel", selectByid);
		m.addAttribute("projectunit",p.getUnit());
		return "group_personnel";
	}

	// 增加团组人员
	@RequestMapping("addgroupperson.action")
	private @ResponseBody boolean addperson(Integer id, Integer gid,String role,Model m) {
		group2 group2 = groupservice.selectByid(gid);
		Personnel personnel = personnelservice.selectByid(id);
		GroupPersonnel g = new GroupPersonnel();
		g.setPid(id);
		g.setRole(role);
		g.setAccesscountry(group2.getAccesscountry());
		g.setName(personnel.getName());
		g.setGroupid(gid);
		g.setHead(personnel.getHead());
		g.setNote(personnel.getNote());
		/*
		 * GroupPersonnel selectBypid = grouppersonnelservice.selectBypid(id); if
		 * (selectBypid == null || selectBypid.getGroupid() != g.getGroupid()) {
		 * List<GroupPersonnel> selectByid = grouppersonnelservice.selectByid(gid);
		 * m.addAttribute("grouppersonnel", selectByid);
		 * grouppersonnelservice.addgroupperson(g); group2.setName("增加成功"); return
		 * group2; }
		 */
		Integer queryResult =grouppersonnelservice.queryByidAndPid(id, gid);
		if(queryResult==null || queryResult<1) {
			grouppersonnelservice.addgroupperson(g); 
			//group2.setName("增加成功"); 
			//添加出访记录
			String infoabroad="";
			List<group2> gpList= grouppersonnelservice.queryByPid(id);
			for (group2 gp : gpList) {
				
				String d=gp.getAccesstime();
				String country=gp.getAccesscountry();
				String aim=gp.getAim();
				String name=gp.getName();
				infoabroad+="团组名："+name+"，出团时间："+d+"，地区："+country+"，出团性质："+aim+"\r\n";
			}
			Personnel p=new Personnel();
			p.setId(id);
			p.setInfoabroad(infoabroad);
			personnelservice.updateInfoabroadByPid(p);
			return true;
		}
		//group2.setName("已存在此人");
		return false;
	}

	// 出国资格验证
	@RequestMapping("validationpersonnel.action")
	public @ResponseBody Personnel validationpersonnel(Integer id, Integer gid) throws ParseException {
		Personnel s = new Personnel();
		Personnel p = personnelservice.selectByid(id);
		group2 group1 = groupservice.selectByid(gid);
		if (!p.getReal().equals(new String("是"))) {
			s.setNote("您不是在编在职人员无法出国");
			return s;
		}
		Map<String, String> birAgeSex = getBirAgeSex(p.getIdcare());
		if (birAgeSex.get("sexCode").equals(new String("F"))) {
			if (differentDays(birAgeSex.get("birthday")) > 19895) {
				s.setNote("出访启程日期在退休年龄前不足6 个月的原则上不安排出访。");
				return s;
			}
		} else {
			if (differentDays(birAgeSex.get("birthday")) > 21720) {
				s.setNote("出访启程日期在退休年龄前不足6 个月的原则上不安排出访。");
				return s;
			}

		}

		GroupPersonnel selectBypid = grouppersonnelservice.selectBypid(id);
		if (selectBypid != null) {
			group2 group = groupservice.selectByid(selectBypid.getGroupid());
			int differentDays = differentDays(group.getAccesstime()) / 365;
			switch (p.getZw()) {
			case "正厅实职干部":
				if (differentDays < 2) {
					s.setNote("正厅实职干部1 个任期内出国不超过2 次或最高2 年不超过1 次");
					return s;
				}
				break;
			case "其他省管干部":
				if (differentDays < 3) {
					s.setNote("其他省管干部出国最高 3 年不超过l 次");
					return s;
				}
				break;
			case "处级及以下干部":
				if (differentDays < 4) {
					s.setNote("处级及以下干部出国最高 4 年不超过1 次");
					return s;
				}
				break;

			default:
				s.setNote("职务不符规则");
				return s;
			}

			if (p.getHead().equals(new String("是"))) {
				List<group2> selectByunit2 = groupservice.selectByunit(p.getUnit());
				for (group2 group2 : selectByunit2) {
					List<GroupPersonnel> selectByid = grouppersonnelservice.selectByid(group2.getId());
					for (GroupPersonnel groupPersonnel : selectByid) {
						if (groupPersonnel.getHead().equals(new String("是"))
								&& group2.getAccesstime().equals(group1.getAccesstime())) {
							s.setNote("同一部门、同一单位负责人不得同期出访；");
							return s;
						}

					}
					if (differentDays2(group1.getAccesstime(), group2.getAccesstime()) < 180) {
						List<GroupPersonnel> selectByid2 = grouppersonnelservice.selectByid(group2.getId());
						for (GroupPersonnel GroupPersonnel : selectByid2) {
							if (GroupPersonnel.getHead().equals(new String("是"))
									&& group2.getAccesscountry().equals(group1.getAccesscountry())) {
								s.setNote("6个月内同一单位负责人不能当前出访目的地相同");
								return s;
							}
						}
					}

				}
			}
		} else {
			s.setNote("通过审核");
			return s;
		}

		s.setNote("通过审核");
		return s;
	}

	// 工具类 求时间差
	public static int differentDays(String date) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = sdf.parse(date);
		Date date2 = new Date();
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(date1);
		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(date2);
		int day1 = cal1.get(Calendar.DAY_OF_YEAR);
		int day2 = cal2.get(Calendar.DAY_OF_YEAR);
		int year1 = cal1.get(Calendar.YEAR);
		int year2 = cal2.get(Calendar.YEAR);
		if (year1 != year2) // 同一年
		{
			int timeDistance = 0;
			for (int i = year1; i < year2; i++) {
				if (i % 4 == 0 && i % 100 != 0 || i % 400 == 0) // 闰年
				{
					timeDistance += 366;
				} else // 不是闰年
				{
					timeDistance += 365;
				}
			}

			return timeDistance + Math.abs(day2 - day1);
		} else // 不同年
		{
			return Math.abs(day2 - day1);
		}
	}

	// 工具类 求时间差
	public static int differentDays2(String date, String date3) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = sdf.parse(date);
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		Date date2 = sdf2.parse(date3);
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(date1);
		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(date2);
		int day1 = cal1.get(Calendar.DAY_OF_YEAR);
		int day2 = cal2.get(Calendar.DAY_OF_YEAR);
		int year1 = cal1.get(Calendar.YEAR);
		int year2 = cal2.get(Calendar.YEAR);
		if (year1 != year2) // 同一年
		{
			int timeDistance = 0;
			for (int i = year1; i < year2; i++) {
				if (i % 4 == 0 && i % 100 != 0 || i % 400 == 0) // 闰年
				{
					timeDistance += 366;
				} else // 不是闰年
				{
					timeDistance += 365;
				}
			}

			return timeDistance + Math.abs(day2 - day1);
		} else // 不同年
		{
			return Math.abs(day2 - day1);
		}
	}

	/**
	 * 通过身份证号码获取出生日期.年龄
	 * 
	 * @param certificateNo
	 * @return 返回的出生日期格式：1990-01-01 性别格式：F-女，M-男
	 */
	public static Map<String, String> getBirAgeSex(String certificateNo) {
		String birthday = "";
		String sexCode = "";

		char[] number = certificateNo.toCharArray();
		boolean flag = true;
		if (number.length == 15) {
			for (int x = 0; x < number.length; x++) {
				if (!flag)
					return new HashMap<String, String>();
				flag = Character.isDigit(number[x]);
			}
		} else if (number.length == 18) {
			for (int x = 0; x < number.length - 1; x++) {
				if (!flag)
					return new HashMap<String, String>();
				flag = Character.isDigit(number[x]);
			}
		}
		if (flag && certificateNo.length() == 15) {
			birthday = "19" + certificateNo.substring(6, 8) + "-" + certificateNo.substring(8, 10) + "-"
					+ certificateNo.substring(10, 12);
			sexCode = Integer.parseInt(certificateNo.substring(certificateNo.length() - 3, certificateNo.length()))
					% 2 == 0 ? "F" : "M";
		} else if (flag && certificateNo.length() == 18) {
			birthday = certificateNo.substring(6, 10) + "-" + certificateNo.substring(10, 12) + "-"
					+ certificateNo.substring(12, 14);
			sexCode = Integer.parseInt(certificateNo.substring(certificateNo.length() - 4, certificateNo.length() - 1))
					% 2 == 0 ? "F" : "M";
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("birthday", birthday);
		map.put("sexCode", sexCode);
		return map;
	}

	// 导入表格
	@RequestMapping(value = "filegUploada.action", produces = "application/text; charset=utf-8")
	public String UploadExcel(HttpServletRequest request, HttpServletResponse response, Model m) throws Exception {
		groupservice.UploadExcel(request, response);
		groupfindall(m, request);
		return "groupadd";
	}

	// 导出出国预算预估
	@RequestMapping(value = "abyg.action")
	public String yg(String uid, HttpServletRequest request,String unit) {
		List<group2> groupfindall = null;
		if (uid != null) {
			groupfindall = groupservice.selectByunit(uid);
		} else {
			if (unit!=null) {
				groupfindall = groupservice.selectByunit(unit);
			}
			else {
				groupfindall = groupservice.groupfindall();
			}
		}
		/*
		 * List<AbroadBudget> abroadBudgets = new ArrayList<AbroadBudget>(); for (group2
		 * group2 : groupfindall) { AbroadBudget ab = new AbroadBudget();
		 * ab.setUnitcode(group2.getAccessunit()); ab.setTotalbudget(
		 * String.valueOf(Integer.parseInt(group2.getFcapital()) +
		 * Integer.parseInt(group2.getOfunds()))); ab.setFcapital(group2.getFcapital());
		 * ab.setOfunds(group2.getOfunds()); ab.setPerson(group2.getAccess());
		 * ab.setGroup(group2.getName()); ab.setCost(ab.getTotalbudget());
		 * abroadBudgets.add(ab); } request.setAttribute("name", unit);
		 
		request.getSession().setAttribute("abroadBudgets", abroadBudgets);*/
		request.getSession().setAttribute("abroadBudgets", groupfindall);
		return "abroad_budget";
	}

	@RequestMapping("budgetsummaryfindall.action")
	public String budgetsummaryfindall(Model m, HttpServletRequest req, String uid) {
		List<unit> summary=null;
		if (String.valueOf(req.getSession().getAttribute("duty")).equals("2")) {
			//summary = groupservice.querySummaryByunit(uid);
		} else {
			summary = groupservice.querySummaryAll();
		}
		req.getSession().setAttribute("budgetsummarylist", summary);
		return "budgetsummarylist";
		/*List<group2> groupfindall = null;
		if (String.valueOf(req.getSession().getAttribute("duty")).equals("2")) {
			groupfindall = groupservice.selectByunit(uid);
		} else {
			groupfindall = groupservice.groupfindall();
		}
		
		 * List<unit> attribute = unitservice.findall(); List<unit> attribute2 = new
		 * ArrayList<unit>(); for (group2 group2 : groupfindall) { for (unit unit :
		 * attribute) { if (group2.getAccessunit().equals(unit.getName())) { if
		 * (unit.getFcapital() == null) { unit.setFcapital(0); } if (unit.getOfunds() ==
		 * null) { unit.setOfunds(0); } if (unit.getSum() == null) { unit.setOfunds(0);
		 * } unit.setFcapital(unit.getFcapital() +
		 * Integer.parseInt(group2.getFcapital())); unit.setOfunds(unit.getOfunds() +
		 * Integer.parseInt(group2.getOfunds())); unit.setSum(unit.getFcapital() +
		 * unit.getOfunds()); }
		 * 
		 * } } for (unit unit : attribute) { if (unit.getFcapital() != null ||
		 * unit.getOfunds() != null) { attribute2.add(unit); } }
		 
		m.addAttribute("budgetsummarylist", attribute2);
		req.getSession().setAttribute("budgetsummarylist", attribute2);
		return "budgetsummarylist";*/

	}

	// 跳转到团组修改
	@RequestMapping("grouput.action")
	public String grouput(Integer id, Model m, HttpServletRequest req) {
		group2 group = groupservice.selectByid(id);
		m.addAttribute("group", group);
		return "groupupdate";

	}

	// 修改团组
	@RequestMapping("groupupdate.action")
	public String groupupdate(group2 g, Model m, HttpServletRequest req) {
		groupservice.groupupdate(g);
		groupfindall(m, req);
		return "group";

	}

	@RequestMapping("gdelete.action")
	public @ResponseBody String gdelete(@RequestBody List<String> arr) {
		if (arr.size() == 0) {
			return null;
		}
		groupservice.gdelete(arr);
		return "1";
	}

}
