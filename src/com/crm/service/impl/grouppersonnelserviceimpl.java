package com.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.mapper.GroupPersonnelMapper;
import com.crm.pojo.GroupPersonnel;
import com.crm.pojo.Personnel;
import com.crm.pojo.group2;
import com.crm.service.grouppersonnelservice;

@Service
public class grouppersonnelserviceimpl implements grouppersonnelservice {
	@Autowired
	private GroupPersonnelMapper GroupPersonnelMapper;

	public List<GroupPersonnel> selectByid(Integer id) {
		return GroupPersonnelMapper.selectByid(id);
	}

	public void deletegroupperson(Integer id) {
		GroupPersonnelMapper.deletegroupperson(id);
	}

	public void addgroupperson(GroupPersonnel p) {
		GroupPersonnelMapper.addgroupperson(p);
	}

	@Override
	public GroupPersonnel selectBypid(Integer pid) {
		
		return GroupPersonnelMapper.selectBypid(pid);
	}
	
	//根据团组id和人员id查询改该员工是否在该团组 
	public Integer queryByidAndPid(Integer pid,Integer gid) {
		
		return GroupPersonnelMapper.queryByidAndPid(pid,gid);
	}
	
	//根据人员id查询出访信息
	public List<group2> queryByPid(Integer pid) {
		return GroupPersonnelMapper.queryByPid(pid);
	}
}
