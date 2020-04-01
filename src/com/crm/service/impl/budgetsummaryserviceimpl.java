package com.crm.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.crm.mapper.BudgetSummaryMapper;
import com.crm.pojo.BudgetSummary;
import com.crm.pojo.Training;
import com.crm.service.budgetsummaryservice;
import com.crm.utils.ExcelUtil;
@Service
public class budgetsummaryserviceimpl implements budgetsummaryservice {
    @Autowired
	private BudgetSummaryMapper BudgetSummaryMapper;
 	@Override
	public void budgadd(BudgetSummary b) {
 		BudgetSummaryMapper.budgadd(b);
	}
 	public void ajaxUploadExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;    
		        MultipartFile file = multipartRequest.getFile("upfile");  
		        if(file.isEmpty()){  
		            try {
						throw new Exception("文件不存在！");
					} catch (Exception e) {
						e.printStackTrace();
					}  
		        }  
		        InputStream in =null;  
		        try {
					in = file.getInputStream();
				} catch (IOException e) {
					e.printStackTrace();
				}  
				List<List<Object>> listob = null; 
				try {
					listob = new ExcelUtil().getBankListByExcel(in,file.getOriginalFilename());
				} catch (Exception e) {
					e.printStackTrace();
				}   
			    //该处可调用service相应方法进行数据保存到数据库中，现只对数据输出  
		        for (int i = 0; i < listob.size(); i++) {  
		            List<Object> lo = listob.get(i);  
                   BudgetSummary bs=new BudgetSummary(); 
                   bs.setName(String.valueOf(lo.get(0)));
                   bs.setUnitname(String.valueOf(lo.get(1)));
                   bs.setExpenses(String.valueOf(lo.get(2)));
                   BudgetSummaryMapper.budgadd(bs);
		        }
			}
	@Override
	public List<BudgetSummary> selectall() {
		return BudgetSummaryMapper.selectall();
	}
	@Override
	public List<BudgetSummary> selectall2(String b) {
		return BudgetSummaryMapper.selectall2(b);
	}
}
