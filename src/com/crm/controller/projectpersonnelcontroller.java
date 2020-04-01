package com.crm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
/**
 * 科技项目人员表控制层
 * @author Administrator
 *
 */
import org.springframework.web.bind.annotation.RequestMapping;

import com.crm.pojo.ProjectPersonnel;
import com.crm.service.projectpersonnelservice;
@Controller
public class projectpersonnelcontroller {
@Autowired
private projectpersonnelservice projectpersonnelservice;

//插入数据
@RequestMapping("ProjectPersonneladd.action")
public void ProjectPersonneladd(ProjectPersonnel p) {
	projectpersonnelservice.ProjectPersonneladd(p);
	
	
}
}
