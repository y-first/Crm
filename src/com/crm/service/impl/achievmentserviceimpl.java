package com.crm.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.crm.mapper.AchievmentMapper;
import com.crm.pojo.achievment;
import com.crm.pojo.page;
import com.crm.service.achievmentservice;
import com.crm.utils.ExcelUtil;

/**
 * 科技成果表实现
 * 
 * @author Administrator
 *
 */
@Service
public class achievmentserviceimpl implements achievmentservice {
	@Autowired
	private AchievmentMapper AchievmentMapper;

	public void Achievmentadd(achievment a) {
		List<achievment> achievmentfindall = AchievmentMapper.Achievmentfindall();
		int id = 0;
		if (achievmentfindall.size() != 0) {
			id = achievmentfindall.get(achievmentfindall.size() - 1).getId();
		} else {
			id = 2019001;

		}
		Calendar date = Calendar.getInstance();
		String year = String.valueOf(date.get(Calendar.YEAR));
		if (String.valueOf(id).substring(0, 4) == year) {
			id += 1;
		} else {
			String string = String.valueOf(id).substring(4);
			String iw = "";
			if ((Integer.parseInt(string) + 1) < 100) {
				iw = "0" + (Integer.parseInt(string) + 1);
			}
			if ((Integer.parseInt(string) + 1) < 10) {
				iw = "00" + (Integer.parseInt(string) + 1);
			}
			id = Integer.parseInt(year + iw);

		}
		Date now = new Date();
		a.setEntrytime(now);
		a.setId(id);
		AchievmentMapper.Achievmentadd(a);
	}

	public List<achievment> Achievmentfindall() {
		return AchievmentMapper.Achievmentfindall();
	}

	public achievment AchievmentByid(Integer id) {
		return AchievmentMapper.AchievmentByid(id);
	}

	public void Achievmentudate(achievment achi) {
		AchievmentMapper.Achievmentudate(achi);
	}

	public void Achievmentdelete(Integer id) {
		AchievmentMapper.Achievmentdelete(id);

	}

	public List<String> ajaxUploadExcel(HttpServletRequest request, HttpServletResponse response)  {
		List<String> list = new ArrayList<String>();
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
			achievment vo = new achievment();
			List<achievment> selectbyname = AchievmentMapper.selectbyname(String.valueOf(lo.get(0)));
			if (String.valueOf(lo.get(0)) != "" && selectbyname.size() == 0) {
				vo.setName(String.valueOf(lo.get(0)));
				vo.setRegistration(String.valueOf(lo.get(1)));
				vo.setType(String.valueOf(lo.get(3)));
				vo.setUnit(String.valueOf(lo.get(4)));
				vo.setPerson(String.valueOf(lo.get(5)));
				vo.setNote(String.valueOf(lo.get(6)));
				// 由于数据库中此字段是datetime，所以要将字符串时间格式：yyyy-MM-dd HH:mm:ss，转为Date类型
				if (lo.get(2) != null && lo.get(2) != "") {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					try {
						vo.setTime(sdf.parse(String.valueOf(lo.get(2))));
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} else {
					vo.setTime(new Date());
				}
				List<achievment> achievmentfindall = AchievmentMapper.Achievmentfindall();
				int id = 0;
				if (achievmentfindall.size() != 0) {
					id = achievmentfindall.get(achievmentfindall.size() - 1).getId();
				} else {
					id = 2019001;

				}
				Calendar date = Calendar.getInstance();
				String year = String.valueOf(date.get(Calendar.YEAR));
				if (String.valueOf(id).substring(0, 4) == year) {
					id += 1;
				} else {
					String string = String.valueOf(id).substring(4);
					String iw = "";
					if ((Integer.parseInt(string) + 1) < 100) {
						iw = "0" + (Integer.parseInt(string) + 1);
					}
					if ((Integer.parseInt(string) + 1) < 10) {
						iw = "00" + (Integer.parseInt(string) + 1);
					}
					id = Integer.parseInt(year + iw);

				}
				vo.setId(id);
				Date now = new Date();
				vo.setEntrytime(now);
				AchievmentMapper.Achievmentadd(vo);
			} else {
				list.add("(" + String.valueOf(lo.get(0)) + "),项目名重复");
				break;
			}
		}
		return list;
	}

	@Override
	public List<achievment> achiBynt(achievment a) {
		return AchievmentMapper.achiBynt(a);
	}

	@Override
	public List<achievment> AchievmentByyear(String id) {
		return AchievmentMapper.AchievmentByyear(id);
	}

	@Override
	public List<achievment> selectbyname(String s) {
		return AchievmentMapper.selectbyname(s);
	}

	@Override
	public void achdelete(List<String> arr) {

		AchievmentMapper.achdelete(arr);
	}

	@Override
	public List<achievment> achfind(String uid) {

		return AchievmentMapper.achfind(uid);
	}

	@Override
	public List<achievment> Achievmentfindall1(Integer lim) {
		return AchievmentMapper.Achievmentfindall1(lim);
	}

	@Override
	public List<achievment> achfind1(page p) {
		return AchievmentMapper.achfind1(p);
	}


}
