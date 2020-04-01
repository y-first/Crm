package com.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.mapper.ClubMapper;
import com.crm.pojo.club;
import com.crm.pojo.clubvc;
import com.crm.pojo.employee;
import com.crm.service.ClubService;

@Service("ClubService")
public class ClubServiceImpl implements ClubService {

	@Autowired
	private ClubMapper clubmapper;

	public List<club> clubselect(String uid) {
		// TODO Auto-generated method stub
		List<club> clubselect = clubmapper.clubselect(uid);
		return clubselect;
	}

	public void clubdelete(String id) {
		// TODO Auto-generated method stub
		clubmapper.clubdelete(id);
	}

	public club us(String id) {
		// TODO Auto-generated method stub
		club us = clubmapper.us(id);
		return us;
	}

	public void clubupdate(club c) {
		// TODO Auto-generated method stub
		clubmapper.clubupdate(c);
	}

	public List<clubvc> filtrate(clubvc c) {
		// TODO Auto-generated method stub
		List<clubvc> filtrate = clubmapper.filtrate(c);
		return filtrate;
	}

	public employee login(employee e) {
		// TODO Auto-generated method stub
		employee login = clubmapper.login(e);
		return login;
	}

	public List<club> clubselectall() {
		// TODO Auto-generated method stub
		List<club> clubselectall = clubmapper.clubselectall();
		return clubselectall;
	}

	public List<clubvc> tfiltrate(clubvc c) {
		// TODO Auto-generated method stub
		List<clubvc> tfiltrate = clubmapper.tfiltrate(c);
		return tfiltrate;
	}

	@Override
	public void addUser(employee e) {
		clubmapper.addUser(e);		
	}

	@Override
	public List<employee> selectUser(employee e) {
		clubmapper.selectUser(e);
		return null;
	}

	@Override
	public void chdelete(List<String> arr) {
		// TODO Auto-generated method stub
		clubmapper.chdelete(arr);
	}

	@Override
	public List<club> clubselectall1(Integer page) {
		// TODO Auto-generated method stub
		return clubmapper.clubselectall1(page);
	}

	@Override
	public List<club> clubselect1(clubvc c) {
		
		return clubmapper.clubselect1(c);
	}

	

	
	



}
