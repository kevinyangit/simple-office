package com.model;

public class Salary {
	int id;
	String username;
	String year;
	String month;
	String jibensalary;
	String jixiaosalary;
	String kouQian;
	Integer qingJiaDate;
	Integer total;
	Integer totalSalary;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getJibensalary() {
		return jibensalary;
	}
	public void setJibensalary(String jibensalary) {
		this.jibensalary = jibensalary;
	}
	public String getJixiaosalary() {
		return jixiaosalary;
	}
	public void setJixiaosalary(String jixiaosalary) {
		this.jixiaosalary = jixiaosalary;
	}
	public Integer getTotalSalary() {
		if(jixiaosalary == null || jixiaosalary.equals("")){
			jixiaosalary = "0";
		}
		if(jibensalary == null || jibensalary.equals("")){
			jibensalary = "0";
		}
		return Integer.parseInt(jixiaosalary) + Integer.parseInt(jibensalary);
	}
	public String getKouQian() {
		return kouQian;
	}
	public void setKouQian(String kouQian) {
		this.kouQian = kouQian;
	}
	public Integer getQingJiaDate() {
		return qingJiaDate;
	}
	public void setQingJiaDate(Integer qingJiaDate) {
		this.qingJiaDate = qingJiaDate;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
}
