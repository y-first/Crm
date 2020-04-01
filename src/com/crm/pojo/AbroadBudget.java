package com.crm.pojo;

public class AbroadBudget {
    private Integer id;

    private String unitcode;

    private String totalbudget;

    private String ofunds;

    private String person;

    private String group;

    private String year;

    private String cost;

    private String fcapital;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUnitcode() {
        return unitcode;
    }

    public void setUnitcode(String unitcode) {
        this.unitcode = unitcode == null ? null : unitcode.trim();
    }

    public String getTotalbudget() {
        return totalbudget;
    }

    public void setTotalbudget(String totalbudget) {
        this.totalbudget = totalbudget == null ? null : totalbudget.trim();
    }

    public String getOfunds() {
        return ofunds;
    }

    public void setOfunds(String ofunds) {
        this.ofunds = ofunds == null ? null : ofunds.trim();
    }

    public String getPerson() {
        return person;
    }

    public void setPerson(String person) {
        this.person = person == null ? null : person.trim();
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group == null ? null : group.trim();
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year == null ? null : year.trim();
    }

    public String getCost() {
        return cost;
    }

    public void setCost(String cost) {
        this.cost = cost == null ? null : cost.trim();
    }

    public String getFcapital() {
        return fcapital;
    }

    public void setFcapital(String fcapital) {
        this.fcapital = fcapital == null ? null : fcapital.trim();
    }
}