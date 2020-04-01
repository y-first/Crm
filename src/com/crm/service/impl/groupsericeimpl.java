package com.crm.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.crm.mapper.GroupMapper;
import com.crm.pojo.group2;
import com.crm.pojo.unit;
import com.crm.service.groupservice;
import com.crm.utils.ExcelUtil;

/**
 * 团体表实现
 * 
 * @author Administrator
 *
 */
@Service
public class groupsericeimpl implements groupservice {
	@Autowired
	private GroupMapper GroupMapper;

	public void Groupadd(group2 g) {
		GroupMapper.Groupadd(g);
	}

	public List<group2> groupfindall() {
		return GroupMapper.groupfindall();

	}
	//所有单位预算汇总
	public List<unit> querySummaryAll(){
		return GroupMapper.querySummaryAll();
	}
	//根据单位查询单位预算汇总query
	public List<unit> querySummaryByunit(){
		return GroupMapper.querySummaryByunit();
	}
	public void deletegroup(Integer id) {
		GroupMapper.deletegroup(id);
		
	}

	public group2 selectByid(Integer id) {
	
		return 	GroupMapper.selectByid(id);
	}

	@Override
	public List<group2> selectByunit(String unit) {
		return 	GroupMapper.selectByunit(unit);
	}

	@Override
	public void addperson(group2 g) {
		GroupMapper.addperson(g);		
	}

	@Override
	public void groupupdate(group2 g) {
		 GroupMapper.groupupdate(g);
	}


	@Override
	public void UploadExcel(HttpServletRequest request, HttpServletResponse response) {
		List<String> list=new ArrayList<String>();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile file = multipartRequest.getFile("upfile");
		if (file.isEmpty()) {
			try {
				throw new Exception("文件不存在！");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		InputStream in = null;
		try {
			in = file.getInputStream();
		} catch (IOException e) {
			e.printStackTrace();
		}
		List<List<Object>> listob = null;
		try {
			listob = new ExcelUtil().getBankListByExcel(in, file.getOriginalFilename());
		} catch (Exception e) {
			e.printStackTrace();
		}
		for (int i = 0; i < listob.size(); i++) {
			List<Object> lo = listob.get(i);
		     group2 vo=new group2();
		   vo.setName(String.valueOf(lo.get(0)));
		   vo.setAccess(String.valueOf(lo.get(1)));
		   vo.setAccesstime(String.valueOf(lo.get(2)));
		   vo.setAccesscountry(String.valueOf(lo.get(3)));
		   vo.setAccessunit(String.valueOf(lo.get(4)));
		   vo.setExpenditure(String.valueOf(lo.get(5)));
		   vo.setPexpenditure(String.valueOf(lo.get(6)));
		   vo.setDays(String.valueOf(lo.get(7)));
		   vo.setOfunds(String.valueOf(lo.get(8)));
		   vo.setFcapital(String.valueOf(lo.get(9)));
		   vo.setNote(String.valueOf(lo.get(10)));
		   GroupMapper.Groupadd(vo);
			
		}
		
	}
	@Override
	public void gdelete(List<String> arr) {
		GroupMapper.gdelete(arr);
	}

	

}
