/**  
 * Project Name:Recruitment  
 * File Name:StaticServiceImpl.java  
 * Package Name:com.service  
 * Date:2018年5月21日上午11:01:11  
 * Copyright (c) 2018
 *  
*/  
  
package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dto.output.SalaryEveryYeary;
import com.dto.output.StaticSalary;
import com.mapper.StaticMapper;

/**  
 * ClassName:StaticServiceImpl <br/>  
 * Date:     2018年5月21日 上午11:01:11 <br/>  
 * @author   YangGuangFeng  
 * @version    
 * @since    JDK 1.8  
 * @see        
 */
@Service
public class StaticServiceImpl implements StaticService{

	@Autowired
	private StaticMapper staticMapper;
	@Override
	public StaticSalary staticSalaryEveryYear() {
		StaticSalary staticSalary = new StaticSalary();
		List<SalaryEveryYeary> lowestSalaryEveryYearsList = staticMapper.staticLowestSalaryEveryYear();
		List<SalaryEveryYeary> higherSalaryEveryYearsList = staticMapper.staticHighSalaryEveryYear();
		List<SalaryEveryYeary> totolSalaryEveryYearsList = staticMapper.staticTotalSalaryEveryYear();
		List<SalaryEveryYeary> averageSalaryEveryYearsList = staticMapper.staticAverageSalaryEveryYear();
		staticSalary.setLowestSalaryEveryYearsList(lowestSalaryEveryYearsList);
		staticSalary.setHigherSalaryEveryYearsList(higherSalaryEveryYearsList);
		staticSalary.setTotolSalaryEveryYearsList(totolSalaryEveryYearsList);
		staticSalary.setAverageSalaryEveryYearsList(averageSalaryEveryYearsList);
		return staticSalary;
	}

}
  
