
  
package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.output.StaticSalary;
import com.model.ResultBean;
import com.service.StaticService;


@Controller
@RequestMapping("/statis")
public class StaticController {

	@Autowired
	private StaticService staticService;
	@RequestMapping(value = "/salary/staticSalaryEveryYear.do", method = RequestMethod.POST)
	@ResponseBody
	public ResultBean<StaticSalary> staticSalaryEveryYear() {
		ResultBean<StaticSalary> result = new ResultBean<StaticSalary>();
		try {
			StaticSalary list = staticService.staticSalaryEveryYear();
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
			result.setCode(ResultBean.UNKNOWN_EXCEPTION);
			result.setMsg(ResultBean.MESSAGE_ERROR);
		}
		return result;
	}
}
  
