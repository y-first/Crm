package com.crm.mapper;

import com.crm.pojo.GroupPersonnel;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.crm.pojo.group2;
public interface GroupPersonnelMapper {
	// 根据id查询
	public List<GroupPersonnel> selectByid(Integer id);

	// 删除团租人员
	public void deletegroupperson(Integer id);
    //插入团组人员
	public void addgroupperson(GroupPersonnel g);
	//跟据personnel id查询出国记录
	public GroupPersonnel selectBypid(Integer pid);
	//根据团组id和人员id查询改该员工是否在该团组 
	public Integer queryByidAndPid(Integer pid,Integer gid);
	//根据人员id查询出访信息
	public List<group2> queryByPid(Integer pid);
	
	
}