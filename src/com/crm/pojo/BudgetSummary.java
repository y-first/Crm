package com.crm.pojo;

public class BudgetSummary {
    private Integer id;

    private String name;

    private String unitname;
    private String expenses;
    private String expensesx;
    private String sum;

    public String getExpensesx() {
		return expensesx;
	}

	public void setExpensesx(String expensesx) {
		this.expensesx = expensesx;
	}

	public String getSum() {
		return sum;
	}

	public void setSum(String sum) {
		this.sum = sum;
	}

	public String getExpenses() {
		return expenses;
	}

	public void setExpenses(String expenses) {
		this.expenses = expenses;
	}

	public BudgetSummary() {
		super();
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getUnitname() {
        return unitname;
    }

    public void setUnitname(String unitname) {
        this.unitname = unitname == null ? null : unitname.trim();
    }




}