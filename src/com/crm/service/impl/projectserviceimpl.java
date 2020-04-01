package com.crm.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.crm.mapper.ProjectMapper;
import com.crm.pojo.group2;
import com.crm.pojo.project;
import com.crm.service.projectservice;
import com.crm.utils.ExcelUtil;

/**
 * 科技项目表实现
 * 
 * @author Administrator
 *
 */
@Service
public class projectserviceimpl implements projectservice {

	@Autowired
	private ProjectMapper ProjectMapper;

	// 插入数据
	public void Projectadd(project p) {
		ProjectMapper.Projectadd(p);
	}

	public List<project> pselect(String uid) {
		return ProjectMapper.pselect(uid);
	}

	public List<project> pselectall() {
		return ProjectMapper.pselectall();

	}

	public project pj(String id) {
		return ProjectMapper.pj(id);

	}

	public void pupdate(project p) {
		ProjectMapper.pupdate(p);
	}

	public List<project> pfile(project p) {
		return ProjectMapper.pfile(p);
	}

	public void pdelete(String id) {
		ProjectMapper.pdelete(id);
	}

	public List<project> start() {
		project	p=new project();
		p.setEwork("");
		p.setName("");
		return ProjectMapper.pfile(p);
	}

	public List<project> starta(String id) {
		return ProjectMapper.pselect(id);
	}

	public List<project> pfileall(project p) {
		return ProjectMapper.pfileall(p);
	}

	public List<String> ajaxUploadExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<String> list=new ArrayList<String>();
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
		project p=new project();
		p.setEwork("");
		List<project> groupfindall = ProjectMapper.pfile(p);
	    //该处可调用service相应方法进行数据保存到数据库中，现只对数据输出  
        for (int i = 0; i < listob.size(); i++) {  
            List<Object> lo = listob.get(i);  
            project vo = new project(); 
            List<project> selectbyname = ProjectMapper.selectbyname(String.valueOf(lo.get(0)));
        		if (selectbyname.size()==0&&String.valueOf(lo.get(0))!="") {
                vo.setName(String.valueOf(lo.get(0)));    
	            vo.setRegistration(String.valueOf(lo.get(1))); 
	            vo.setEwork(String.valueOf(lo.get(2)));
	            vo.setLinkman(String.valueOf(lo.get(3)));
	            vo.setPhone(String.valueOf(lo.get(4)));
	            vo.setExpenditure(String.valueOf(lo.get(5)));
	            vo.setProgress(String.valueOf(lo.get(6)));
	            //由于数据库中此字段是datetime，所以要将字符串时间格式：yyyy-MM-dd HH:mm:ss，转为Date类型
	            if (lo.get(7) != null && lo.get(7) != "") {
	            	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	            	 vo.setApplicationtime(sdf.parse(String.valueOf(lo.get(7))));
				}else {
					 vo.setApplicationtime(new Date());
				}
	            vo.setEway(String.valueOf(lo.get(8)));
	            vo.setEunit(String.valueOf(lo.get(9)));
	       
	            if (lo.get(10) != null && lo.get(10) != "") {
	            	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	            	 vo.setAcceptancetime(sdf.parse(String.valueOf(lo.get(10))));
				}else {
					 vo.setAcceptancetime(new Date());
				}
	            vo.setAchievement(String.valueOf(lo.get(11)));
	            vo.setNote(String.valueOf(lo.get(12)));
	            ProjectMapper.Projectadd(vo);
        		} else {
        			list.add("("+String.valueOf(lo.get(0))+")"+"项目名重复");
        			 break;
        		}
        	
            
        }
        return list;
	}

	public void remind(project p) {
		ProjectMapper.remind(p);
	}

	public List<project> nselect(project p) {
		return ProjectMapper.nselect(p);
	}

	public void up(project p) {
		ProjectMapper.up(p);
	}

	public List<project> ps(String uid) {
		return ProjectMapper.ps(uid);
	}

	@Override
	public List<project> pselect2(project p) {
		return ProjectMapper.pselect2(p);
	}

	@Override
	public List<project> pselectall2(project p) {
		return ProjectMapper.pselectall2(p);
	}

	@Override
	public List<project> selectbyname(String s) {
	
		return ProjectMapper.selectbyname(s);
	}
	@Override
	public void deletall(List<String> id) {
		
		ProjectMapper.deletall(id);
	}
}
