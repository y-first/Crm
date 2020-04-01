package com.crm.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.crm.mapper.PersonnelMapper;
import com.crm.mapper.UnitMapper;
import com.crm.pojo.Personnel;
import com.crm.pojo.achievment;
import com.crm.pojo.employee;
import com.crm.pojo.project;
import com.crm.pojo.unit;
import com.crm.service.Personnelservice;
import com.crm.service.projectpersonnelservice;
import com.crm.service.unitservice;
import com.crm.utils.ExcelUtil;

/**
 * 外事人员表业务层实现
 * 
 * @author Administrator
 *
 */
@Service
public class Personnelserviceimpl implements Personnelservice {
	@Autowired
	private PersonnelMapper personnelMapper;

	public void updatePersonnel(Personnel p) {
		personnelMapper.updatePersonnel(p);
	}

	public Personnel selectByid(Integer id) {
		Personnel selectByid = personnelMapper.selectByid(id);
		return selectByid;
	}

	public List<Personnel> selectmhpersonnel(Personnel m) {
		return personnelMapper.selectmhpersonnel(m);

	}

	@Override
	public void personneladd(Personnel m) {
		personnelMapper.personneladd(m);
	}
	public void ajaxUploadExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
			Personnel p = new Personnel();
			p.setName(String.valueOf(lo.get(0)));
			p.setSex(String.valueOf(lo.get(1)));
			p.setPlace(String.valueOf(lo.get(2)));
			UnitMapper um;
			String name="";
			name=String.valueOf(lo.get(3));
			if(name!="") {
				unit u=personnelMapper.selectunitByName(name);
				if(u!=null) {
					
					p.setUnit(String.valueOf(u.getId()));
				}
			}
//			unit uid=u.selectyunitByid(Integer.valueOf(lo.get(3)))
//			//unitservice u=new unitservice();
			
			p.setZzmm(String.valueOf(lo.get(4)));
			p.setZw(String.valueOf(lo.get(5)));
			p.setZc(String.valueOf(lo.get(6)));
			p.setFidentity(String.valueOf(lo.get(7)));
			p.setSchool(String.valueOf(lo.get(8)));
			p.setProfessional(String.valueOf(lo.get(9)));
			p.setGtime(String.valueOf(lo.get(10)));
			p.setPwork(String.valueOf(lo.get(11)));
			p.setIdcare(String.valueOf(lo.get(12)));
			p.setHead(String.valueOf(lo.get(13)));
			p.setPreal(String.valueOf(lo.get(14)));
			p.setNote(String.valueOf(lo.get(15)));
			personnelMapper.personneladd(p);
		}
	}
	
	@Override
	public void deleteUser(Integer id) {
		personnelMapper.deleteUser(id);
		
	}

	@Override
	public employee selectByuserid(Integer id) {
	return	personnelMapper.selectByuserid(id);
	}

	@Override
	public void updateUser(employee e) {
		personnelMapper.updateUser(e);
		
	}

	@Override
	public List<employee> selectAll(employee e) {
		return personnelMapper.selectAll(e);
	}

	@Override
	public employee selectBypid(Integer id) {
		return personnelMapper.selectBypid(id);
	}

	@Override
	public void updateduty(employee duty) {
		personnelMapper.updateduty(duty);
	}
	@Override
	public void addEmployees(employee e) {
		personnelMapper.addEmployees(e);
	}
	@Override
	public void pedelete(List<String> arr) {
		// TODO Auto-generated method stub
		personnelMapper.pedelete(arr);
	}

	@Override
	public employee selectByusername(String name) {
		return personnelMapper.selectByusername(name);
	}
	
	public unit selectunitByName(String name) {
		return personnelMapper.selectunitByName(name);
	}
	//根据人员id更新出访记录
	public void updateInfoabroadByPid(Personnel p) {
		personnelMapper.updateInfoabroadByPid(p);
	}
}
