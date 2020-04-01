package com.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.mapper.AchievmentMapper;
import com.crm.mapper.GroupMapper;
import com.crm.mapper.OrganizationMapper;
import com.crm.mapper.PersonnelMapper;
import com.crm.mapper.ProjectMapper;
import com.crm.mapper.TrainingMapper;
import com.crm.mapper.UnitMapper;
import com.crm.pojo.unit;
import com.crm.service.unitservice;
@Service
public class unitserviceimpl  implements unitservice{

	@Autowired
	private  UnitMapper unitMapper;
	@Autowired
	private  AchievmentMapper AchievmentMapper;
	@Autowired
	private  PersonnelMapper PersonnelMapper;
	@Autowired
	private  GroupMapper GroupMapper;
	@Autowired
	private  OrganizationMapper OrganizationMapper;
	@Autowired
	private  ProjectMapper ProjectMapper;
	@Autowired
	private  TrainingMapper TrainingMapper;
	
	public List<unit> findall() {
		
		return unitMapper.findall();
	}
	@Override
	public void addUnit(unit u) {
		unitMapper.addUnit(u);
		
	}
	@Override
	public void removeUnit(Integer id) {
		unitMapper.removeUnit(id);
	}
	@Override
	public unit selectyunitByid(Integer id) {
		return unitMapper.selectyunitByid(id);
	}
	public unit selectunitByName(String name){
		return unitMapper.selectunitByName(name);
	}
	@Override
	public void updateunit(unit un) {
		unitMapper.updateunitname(un);
		AchievmentMapper.updateunit(un);
		PersonnelMapper.updateuinte(un);
		PersonnelMapper.updateuintp(un);
		GroupMapper.updateunit(un);
		OrganizationMapper.updateunito(un);
		ProjectMapper.updateunitpr(un);
		ProjectMapper.updateunitpro(un);
		TrainingMapper.updateunitt(un);
	}

}
