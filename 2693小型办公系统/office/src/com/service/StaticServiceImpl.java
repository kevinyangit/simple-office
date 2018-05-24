
  
package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dto.output.SalaryEveryYeary;
import com.dto.output.StaticSalary;
import com.mapper.StaticMapper;


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
  
