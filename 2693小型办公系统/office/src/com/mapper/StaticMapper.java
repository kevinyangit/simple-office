package com.mapper;
import java.util.List;

import com.dto.output.SalaryEveryYeary;
public interface StaticMapper {
	
	List<SalaryEveryYeary> staticLowestSalaryEveryYear();
	List<SalaryEveryYeary> staticHighSalaryEveryYear();
	List<SalaryEveryYeary> staticTotalSalaryEveryYear();
	List<SalaryEveryYeary> staticAverageSalaryEveryYear();

}
