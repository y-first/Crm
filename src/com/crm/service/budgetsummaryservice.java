package com.crm.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crm.pojo.BudgetSummary;

public interface budgetsummaryservice {
	    //插入数据
		public void   budgadd(BudgetSummary b);
		//插入表格
		public void ajaxUploadExcel(HttpServletRequest request, HttpServletResponse response) throws Exception;
		//查询所有
		public List<BudgetSummary>   selectall();
		public List<BudgetSummary>   selectall2(String b);
}
