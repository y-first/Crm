package com.crm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crm.pojo.employee;
import com.crm.pojo.unit;
import com.crm.service.Personnelservice;
import com.crm.service.unitservice;

@Controller
public class unitcontroller {
	@Autowired
	private unitservice unitservice;
	@Autowired
	private Personnelservice Personnelservice;

	@RequestMapping("unitfindall.action")
	public String unitfindall(HttpServletRequest req) {
		List<unit> findall = unitservice.findall();
		req.getSession().removeAttribute("findall");
		req.getSession().setAttribute("findall", findall);
		return "unit";
	}

	// 添加单位
	@RequestMapping("addUnit.action")
	public String addUnit(unit u, HttpServletRequest req) {
		unitservice.addUnit(u);
		req.getSession().removeAttribute("unitlist");
		List<unit> findall2 = unitservice.findall();
		req.getSession().setAttribute("unitlist", findall2);
		return "homepage";
	}

	// 删除单位
	@RequestMapping("removeUnit.action")
	public String removeUnit(Integer id, HttpServletRequest req) {
		unitservice.removeUnit(id);
		List<unit> findall = unitservice.findall();
		List<unit> findall2 = unitservice.findall();
		req.getSession().setAttribute("unitlist", findall2);
		req.getSession().setAttribute("findall", findall);
		return "unit";
	}

	// 根据单位id
	@RequestMapping("selectyunitByid.action")
	public String selectyunitByid(Integer id, HttpServletRequest req, Model m) {
		unit selectyunitByid = unitservice.selectyunitByid(id);
		m.addAttribute("unitu", selectyunitByid);
		return "unitupdate";
	}

	// 修改单位
	@RequestMapping("updateunit.action")
	public String updateunit(unit un, HttpServletRequest req, Model m) {
		unit selectyunitByid = unitservice.selectyunitByid(un.getId());
		un.setUname(selectyunitByid.getName());
		unitservice.updateunit(un);
		List<unit> findall = unitservice.findall();
		req.getSession().setAttribute("unitlist", findall);
		unitfindall(req);
		return "unit";
	}
}
