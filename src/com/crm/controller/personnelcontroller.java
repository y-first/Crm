package com.crm.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
/**
 * 外事人员控制层
 * @author Administrator
 *
 */
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.pojo.GroupPersonnel;
import com.crm.pojo.Personnel;
import com.crm.pojo.Training;
import com.crm.pojo.employee;
import com.crm.pojo.project;
import com.crm.service.Personnelservice;
import com.crm.service.grouppersonnelservice;

/**
 * 外事人员表控制层
 * 
 * @author Administrator
 *
 */
@Controller
public class personnelcontroller {
	@Autowired
	private Personnelservice personnelservice;

	// 外事人员个人信息
	@RequestMapping("PselectByid.action")
	public String selectByid(Model m, HttpServletRequest req) {
		String id = req.getParameter("id");
		Personnel selectByid = personnelservice.selectByid(Integer.parseInt(id));
		m.addAttribute("personnel", selectByid);
		return "ic";
	}

	// 修改个人信息
	@RequestMapping("updatePersonnel.action")
	public String updatePersonnel(Personnel m, HttpServletRequest req, Model model) {
		String duty = String.valueOf(req.getSession().getAttribute("duty"));
		personnelservice.updatePersonnel(m);
		if (duty.equals("1")) {
			return "homepage";
		}
		Personnel p = new Personnel();
		personnellist(req, model, p);
		return "personnellist";
	}

	// 录入人员
	@RequestMapping("personneladd.action")
	public String personneladd(Personnel m, HttpServletRequest req, Model model) {
		Personnel p = new Personnel();
		personnelservice.personneladd(m);
		personnellist(req, model, p);
		return "personnellist";
	}

	// 根据id查询详细信息
	@RequestMapping("selecByid.action")
	public String pselecByid(Model m, HttpServletRequest req) {
		
		Integer id = Integer.parseInt(req.getParameter("id"));
		Personnel selectByid = personnelservice.selectByid(id);
		m.addAttribute("personnel", selectByid);
		return "person";
	}

	// 查看人员
	@RequestMapping("personnellist.action")
	public String personnellist(HttpServletRequest req, Model model, Personnel p) {
		if (p.getName() == null && p.getName() == "") {
			String parameter = req.getParameter("uid");
			p.setUnit(parameter);
			p.setName("");
		}
		if (String.valueOf(req.getSession().getAttribute("duty")).equals("2")) {
			p.setUnit(String.valueOf(req.getSession().getAttribute("uid")));
		}
		List<Personnel> selectmhpersonnel = personnelservice.selectmhpersonnel(p);
		for (Personnel personnel : selectmhpersonnel) {
			employee selectBypid = personnelservice.selectBypid(personnel.getId());
			if (selectBypid != null) {
				personnel.setDuty(String.valueOf(selectBypid.getDuty()));
				personnel.setUsername(selectBypid.getUsername());
				personnel.setPassword(selectBypid.getPassword());
			}

		}
		req.setAttribute("name", p.getUnit());
		req.getSession().setAttribute("personnellist", selectmhpersonnel);
		return "personnellist";
	}

	// 导入表格
	@RequestMapping(value = "fileUploadPe.action", produces = "application/text; charset=utf-8")
	public String UploadExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		personnelservice.ajaxUploadExcel(request, response);
		return "personnel";
	}

	// 删除人员
	@RequestMapping("removeUser.action")
	public void removeUser(HttpServletRequest req, Model model, Integer id) {
		personnelservice.deleteUser(id);

	}

	// 跳转到编辑
	@RequestMapping("eidtUser.action")
	public @ResponseBody employee eidtUser(HttpServletRequest req, Model model, Integer id) {
		employee employee = personnelservice.selectByuserid(id);
		return employee;
	}

	// 查询账号
	@RequestMapping("Userupdate.action")
	public String updateuser(HttpServletRequest req, Model model, employee e) {
		personnelservice.updateUser(e);
		return "removeUser";
	}

	
	@RequestMapping("updateemploy.action")
	public String updateemploy(HttpServletRequest req, Model model, Integer uid, String duty, String password,
			String username) {
		Personnel p = new Personnel();
		employee e = personnelservice.selectBypid(uid);
		e.setDuty(Integer.parseInt(duty));
		e.setPassword(password);
		e.setUsername(username);
		personnelservice.updateduty(e);
		personnellist(req, model, p);
		return "personnellist";
	}
	

	// 添加账号
	@RequestMapping("addEmployees.action")
	public String addEmployees(HttpServletRequest req, Model model, employee e) {
		System.out.println(e);
		Personnel selectByid = personnelservice.selectByid(Integer.parseInt(e.getPid()));
		e.setName(selectByid.getName());
		System.out.println(e.getUid());
		personnelservice.addEmployees(e);
		Personnel p = new Personnel();
		personnellist(req, model, p);
		return "personnellist";
	}

	// 批量删除
	@RequestMapping("pedelete.action")
	public @ResponseBody String pedelete(HttpServletRequest req, Model model, @RequestBody List<String> arr) {

		if (arr.size() == 0) {
			return null;
		}
		Personnel p = new Personnel();
		personnelservice.pedelete(arr);
		personnellist(req, model, p);
		return "1";
	}

	// 账号查重
	@RequestMapping("selectByeyploname.action")
	public @ResponseBody employee selectByusername(HttpServletRequest req, String name) {
		employee selectByusername = personnelservice.selectByusername(name);
		System.out.println(name);
		if (selectByusername != null) {
			selectByusername.setName("账号重复");
			return selectByusername;
		}
		return selectByusername;
	}
	
	@RequestMapping("upduty.action")
	public String upduty(HttpServletRequest req, Model m) {
		m.addAttribute("id", req.getParameter("id"));
		m.addAttribute("unit", req.getParameter("unit"));
		return "manageadd";
	}

	@RequestMapping("udt.action")
	public String udt(HttpServletRequest req, Model m) {
		m.addAttribute("id", req.getParameter("pid"));
		m.addAttribute("duty", req.getParameter("duty"));
		m.addAttribute("password", req.getParameter("password"));
		m.addAttribute("username", req.getParameter("username"));
		System.out.println( req.getParameter("username"));
		return "manageup";
	}
}
