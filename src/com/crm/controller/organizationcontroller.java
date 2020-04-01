package com.crm.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
/**
 * 社团表控制层
 * @author Administrator
 *
 */
import org.springframework.web.bind.annotation.RequestMapping;

import com.crm.pojo.Organization;
import com.crm.pojo.club;
import com.crm.pojo.clubvc;
import com.crm.pojo.unit;
import com.crm.service.ClubService;
import com.crm.service.Personnelservice;
import com.crm.service.organizationservice;
import com.crm.service.projectservice;
import com.crm.service.unitservice;

/**
 * 社团表控制层
 * 
 * @author Administrator
 *
 */
@Controller
public class organizationcontroller {
	@Autowired
	private organizationservice organizationservice;
	@Autowired
	private unitservice unitservice;
	@Resource(name = "ClubService")
	private ClubService clubservice;

//   社团表插入数据
	@RequestMapping("insert.action")
	public void insert(Organization organization, Model m, HttpServletRequest req,HttpServletResponse rep) throws ParseException, IOException {
		organizationservice.insert(organization);
		club(m, req);
		rep.sendRedirect("RegEditor.jsp");
	}
	// 跳转查询页面的数据请求
		@RequestMapping("clubselect.action")
		public String club(Model m, HttpServletRequest req) throws ParseException {
			String uid = req.getSession().getAttribute("uid").toString();
			String duty = req.getSession().getAttribute("duty").toString();
		/*
		 * String page = req.getParameter("page"); if (page == "" || page == null) {
		 * page = "0"; } Integer pg = Integer.parseInt(page) - 1; if (pg - 1 < 0) { pg =
		 * 0; }
		 */

			List<unit> findall = unitservice.findall();
			m.addAttribute("unitlist", findall);
			List<club> clubselect = null;
			List<club> clu = null;
			clubvc c = new clubvc();
			c.setUid(uid);
			//c.setPage(pg * 8);
			if (duty.equals("2")) {
				clubselect = clubservice.clubselect(uid);
				//clu = clubservice.clubselect1(c);
			} else if (duty.equals("3")) {
				clubselect = clubservice.clubselectall();
				//clu = clubservice.clubselectall1(pg * 8);
			}
			// 格式化日期
			for (club club : clubselect) {
				Date eontime = club.getEontime();
				SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
				String format = sm.format(eontime);
				club.setFormatting(format);
			}

			Integer totalPages = clubselect.size() % 8 == 0 ? clubselect.size() / 8 : clubselect.size() / 8 + 1;
			req.getSession().setAttribute("totalPages", totalPages);
			req.getSession().setAttribute("club", clubselect);
			return "RegEditor";
		}
	

}
