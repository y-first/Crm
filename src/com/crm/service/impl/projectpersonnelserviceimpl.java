package com.crm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.mapper.ProjectPersonnelMapper;
import com.crm.pojo.ProjectPersonnel;
import com.crm.service.projectpersonnelservice;
/**
 * 科技项目人员表实现
 * @author Administrator
 *
 */
@Service
public class projectpersonnelserviceimpl implements projectpersonnelservice {
    @Autowired
	private ProjectPersonnelMapper ProjectPersonnelMapper;
	//插入数据

	public void ProjectPersonneladd(ProjectPersonnel p) {
		ProjectPersonnelMapper.ProjectPersonneladd(p);
	}

}
