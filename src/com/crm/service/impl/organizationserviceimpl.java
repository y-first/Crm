package com.crm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.mapper.OrganizationMapper;
import com.crm.pojo.Organization;
import com.crm.service.organizationservice;
/**
 * 社团表实现类
 * @author Administrator
 *
 */
@Service
public class organizationserviceimpl implements organizationservice {
	@Autowired
    private   OrganizationMapper organizationMapper;
	//社团表数据插入
	
	public void insert(Organization o) {
		organizationMapper.insert(o);
	}
 
	
	
}
