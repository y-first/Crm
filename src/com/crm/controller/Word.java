package com.crm.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crm.pojo.AbroadBudget;
import com.crm.pojo.Personnel;
import com.crm.pojo.achievment;
import com.crm.pojo.group2;
import com.crm.pojo.unit;
import com.crm.service.Personnelservice;
import com.crm.service.achievmentservice;
import com.crm.service.groupservice;
import com.crm.utils.DocUtil;
import com.crm.utils.timeage;

@Controller
public class Word {
	@Autowired
	private Personnelservice Personnelservice;
	@Autowired
	private groupservice groupservice;
	@Autowired
	private achievmentservice achievmentservice;
	@RequestMapping("downResumeDoc.action")
	public void getDoc(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> map = new HashMap<String, String>();
		Integer gid = Integer.parseInt(request.getParameter("gid"));
		Integer pid = Integer.parseInt(request.getParameter("pid"));
		Personnel k = Personnelservice.selectByid(pid);
		group2 selectByid = groupservice.selectByid(gid);
		if (selectByid.getName() == null && selectByid.getName() == "") {
			selectByid.setName("无");
		}
		if (selectByid.getAccesscountry() == null && selectByid.getAccesscountry() == "") {
			selectByid.setAccesscountry("无");
		}
		if (selectByid.getDays() == null && selectByid.getDays() == "") {
			selectByid.setDays("无");
		}
		if (k.getName() == null || k.getName() == "") {
			k.setName("无");
		}
		if (k.getSex() == null || k.getSex() == "") {
			k.setSex("无");
		}
		if (k.getPlace() == null || k.getPlace() == "") {
			k.setPlace("无");
		}
		if (k.getIdcare() == null || k.getIdcare() == "") {
			k.setIdcare("无");
		}
		
		if (k.getUnit() == null || k.getUnit() == "") {
			k.setUnit("无");
		}
		if (k.getUnitname() == null || k.getUnitname() == "") {
			k.setUnitname("无");
		}
		if (k.getZc() == null || k.getZc() == "") {
			k.setZc("无");
		}
		if (selectByid.getAccesstime() == null || selectByid.getAccesstime() == "") {
			selectByid.setAccesstime("无");
		}
		if (selectByid.getNote() == null || selectByid.getNote() == "") {
			selectByid.setNote("无");
		}
		map.put("groupname", selectByid.getName());
		map.put("country", selectByid.getAccesscountry());
		map.put("days", selectByid.getDays());
		map.put("name", k.getName());
		map.put("sex", k.getSex());
		map.put("place", k.getPlace());
		map.put("idcare", k.getIdcare());
		Map<String, String> birAgeSex = timeage.getBirAgeSex(k.getIdcare());
		String string = birAgeSex.get("birthday");
		map.put("birthday",string);
		map.put("unit", k.getUnitname());
		map.put("zc", k.getZc());
		map.put("time", selectByid.getAccesstime());
		map.put("note", selectByid.getNote());
		String newWordName = "审批表.doc";
        //调用打印word的函数
		DocUtil.download(request, response, newWordName, map);

	}
	//科技目录文稿
	@RequestMapping("exportachievement.action")
	public void exportachievement(String year,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		List<achievment> list = achievmentservice.AchievmentByyear(year);
		//二、 数据转成excel
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/x-download");

		String fileName = "目录文稿.xlsx";
		fileName = URLEncoder.encode(fileName, "UTF-8");
		response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        // 第一步：定义一个新的工作簿
		XSSFWorkbook wb = new XSSFWorkbook();
		// 第二步：创建一个Sheet页
		XSSFSheet sheet = wb.createSheet("startTimeendTime");
		sheet.setDefaultRowHeight((short) (2 * 256));//设置行高
		sheet.setColumnWidth(0, 4000);//设置列宽
		sheet.setColumnWidth(1, 4000);//设置列宽
		XSSFFont font = wb.createFont();
		font.setFontName("宋体");
		font.setFontHeightInPoints((short) 16);
		XSSFRow row = sheet.createRow(0);
		XSSFCell cell = row.createCell(0);
		cell.setCellValue("科技成果名称 ");
		cell = row.createCell(1);
		cell.setCellValue("实施单位");
		cell = row.createCell(2);
		
		cell.setCellValue("成果登记号");
		cell = row.createCell(3);
		cell.setCellValue("成果登记时间");
		cell = row.createCell(4);
		cell.setCellValue("成果类型");
		cell = row.createCell(5);
		cell.setCellValue("成果完成单位");
		cell = row.createCell(6);
		cell.setCellValue("成果完成人");
		cell = row.createCell(7);
		XSSFRow rows;
		XSSFCell cells;
		for (int i = 0; i < list.size(); i++) {
			// 第三步：在这个sheet页里创建一行
			rows = sheet.createRow(i+1);
			// 第四步：在该行创建一个单元格
			cells = rows.createCell(0);
			// 第五步：在该单元格里设置值
			cells.setCellValue(list.get(i).getName());
			cells = rows.createCell(1);
			cells.setCellValue(list.get(i).getUnit());
			
			cells = rows.createCell(2);
			cells.setCellValue(list.get(i).getRegistration());//登记号
			cells = rows.createCell(3);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String format = sdf.format(list.get(i).getTime());
			cells.setCellValue(format);
			//cells.setCellValue(list.get(i).getTime());//登记时间
			cells = rows.createCell(4);
			cells.setCellValue(list.get(i).getType());//成果类型
			cells = rows.createCell(5);
			cells.setCellValue(list.get(i).getUnit());//完成单位
			cells = rows.createCell(6);
			cells.setCellValue(list.get(i).getPerson());//完成人
			
		}
			
			try {
				OutputStream out = response.getOutputStream();
    			wb.write(out);
    			out.close();
    		
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

}
	//出国预算预估
	@RequestMapping("abdaochu.action")
	public void daochu(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		List<group2> list = (List<group2>) request.getSession().getAttribute("abroadBudgets");
		//二、 数据转成excel
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/x-download");

		String fileName = "出国预算预估.xlsx";
		fileName = URLEncoder.encode(fileName, "UTF-8");
		response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        // 第一步：定义一个新的工作簿
		XSSFWorkbook wb = new XSSFWorkbook();
		// 第二步：创建一个Sheet页
		XSSFSheet sheet = wb.createSheet("startTimeendTime");
		sheet.setDefaultRowHeight((short) (2 * 256));//设置行高
		sheet.setColumnWidth(0, 4000);//设置列宽
		sheet.setColumnWidth(1, 4000);//设置列宽
		XSSFFont font = wb.createFont();
		font.setFontName("宋体");
		font.setFontHeightInPoints((short) 16);
		XSSFRow row = sheet.createRow(0);
		XSSFCell cell = row.createCell(0);
		cell.setCellValue("单位");
		cell = row.createCell(1);
		cell.setCellValue("预算总额");
		cell = row.createCell(2);
		cell.setCellValue("财政资金因公出国费用 （一般）");
		cell = row.createCell(3);
		cell.setCellValue("其他资金");
		cell = row.createCell(4);
		cell.setCellValue("人员");
		cell = row.createCell(5);
		cell.setCellValue("参加团组");
		cell = row.createCell(6);
		cell.setCellValue("预估费用");
		XSSFRow rows;
		XSSFCell cells;
		for (int i = 0; i < list.size(); i++) {
			// 第三步：在这个sheet页里创建一行
			rows = sheet.createRow(i+1);
			// 第四步：在该行创建一个单元格
			cells = rows.createCell(0);
			// 第五步：在该单元格里设置值
			cells.setCellValue(list.get(i).getUnitname());
			cells = rows.createCell(1);
			cells.setCellValue(list.get(i).getExpenditure());
			cells = rows.createCell(2);
			cells.setCellValue(list.get(i).getFcapital());
			cells = rows.createCell(3);
			cells.setCellValue(list.get(i).getOfunds());
			cells = rows.createCell(4);
			cells.setCellValue(list.get(i).getAccess());
			cells = rows.createCell(5);
			cells.setCellValue(list.get(i).getName());
			cells = rows.createCell(6);
			cells.setCellValue(list.get(i).getExpenditure());
			
		}
			
			try {
				OutputStream out = response.getOutputStream();
    			wb.write(out);
    			out.close();
    		
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

}
	   //出国预算汇总
		@RequestMapping("huizong.action")
		public void huizong(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
			 List<unit> list = (List<unit>) request.getSession().getAttribute("budgetsummarylist");
			//二、 数据转成excel
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/x-download");

			String fileName = "出国预算汇总.xlsx";
			fileName = URLEncoder.encode(fileName, "UTF-8");
			response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
	        // 第一步：定义一个新的工作簿
			XSSFWorkbook wb = new XSSFWorkbook();
			// 第二步：创建一个Sheet页
			XSSFSheet sheet = wb.createSheet("startTimeendTime");
			sheet.setDefaultRowHeight((short) (2 * 256));//设置行高
			sheet.setColumnWidth(0, 4000);//设置列宽
			sheet.setColumnWidth(1, 4000);//设置列宽
			XSSFFont font = wb.createFont();
			font.setFontName("宋体");
			font.setFontHeightInPoints((short) 16);
			XSSFRow row = sheet.createRow(0);
			XSSFCell cell = row.createCell(0);
			cell.setCellValue("单位名称");
			cell = row.createCell(1);
			cell.setCellValue("单位代码");
			cell = row.createCell(2);
			cell.setCellValue("财政资金因公出国费用 （一般）");
			cell = row.createCell(3);
			cell.setCellValue("其他资金");
			cell = row.createCell(4);
			cell.setCellValue("合计");
			XSSFRow rows;
			XSSFCell cells;
			for (int i = 0; i < list.size(); i++) {
				// 第三步：在这个sheet页里创建一行
				rows = sheet.createRow(i+1);
				// 第四步：在该行创建一个单元格
				cells = rows.createCell(0);
				// 第五步：在该单元格里设置值
				cells.setCellValue(list.get(i).getName());
				cells = rows.createCell(1);
				cells.setCellValue(list.get(i).getCode());
				cells = rows.createCell(2);
				cells.setCellValue(list.get(i).getFcapital());
				cells = rows.createCell(3);
				cells.setCellValue(list.get(i).getOfunds());
				cells = rows.createCell(4);
				cells.setCellValue(list.get(i).getSum());
				
			}
				
				try {
					OutputStream out = response.getOutputStream();
	    			wb.write(out);
	    			out.close();
	    		
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

	}
		
	}
