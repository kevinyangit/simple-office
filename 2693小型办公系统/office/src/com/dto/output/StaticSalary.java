/**  
 * Project Name:Recruitment  
 * File Name:StaticSalary.java  
 * Package Name:com.dto.output  
 * Date:2018年5月21日下午1:54:37  
 * Copyright (c) 2018
 *  
*/  
  
package com.dto.output;  
/**  
 * ClassName:StaticSalary <br/>  
 * Function: TODO ADD FUNCTION. <br/>  
 * Reason:   TODO ADD REASON. <br/>  
 * Date:     2018年5月21日 下午1:54:37 <br/>  
 * @author   YangGuangFeng  
 * @version    
 * @since    JDK 1.8  
 * @see        
 */

import java.util.List;

public class StaticSalary {

	/**  
	 * lowestSalaryEveryYearsList:最低工资.  
	 * @since JDK 1.8  
	 */
	private List<SalaryEveryYeary> lowestSalaryEveryYearsList;
	private List<SalaryEveryYeary> higherSalaryEveryYearsList;
	private List<SalaryEveryYeary> totolSalaryEveryYearsList;
	private List<SalaryEveryYeary> averageSalaryEveryYearsList;
	
	public List<SalaryEveryYeary> getLowestSalaryEveryYearsList() {
		return lowestSalaryEveryYearsList;
	}
	public void setLowestSalaryEveryYearsList(List<SalaryEveryYeary> lowestSalaryEveryYearsList) {
		this.lowestSalaryEveryYearsList = lowestSalaryEveryYearsList;
	}
	public List<SalaryEveryYeary> getHigherSalaryEveryYearsList() {
		return higherSalaryEveryYearsList;
	}
	public void setHigherSalaryEveryYearsList(List<SalaryEveryYeary> higherSalaryEveryYearsList) {
		this.higherSalaryEveryYearsList = higherSalaryEveryYearsList;
	}
	public List<SalaryEveryYeary> getTotolSalaryEveryYearsList() {
		return totolSalaryEveryYearsList;
	}
	public void setTotolSalaryEveryYearsList(List<SalaryEveryYeary> totolSalaryEveryYearsList) {
		this.totolSalaryEveryYearsList = totolSalaryEveryYearsList;
	}
	public List<SalaryEveryYeary> getAverageSalaryEveryYearsList() {
		return averageSalaryEveryYearsList;
	}
	public void setAverageSalaryEveryYearsList(List<SalaryEveryYeary> averageSalaryEveryYearsList) {
		this.averageSalaryEveryYearsList = averageSalaryEveryYearsList;
	}
}
  
