package com.crm.mapper;

import com.crm.pojo.BudgetSummary;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BudgetSummaryMapper {
	//插入数据
	public void   budgadd(BudgetSummary b);
	//查询所有
	public List<BudgetSummary>   selectall();
	public List<BudgetSummary>   selectall2(String b);
}