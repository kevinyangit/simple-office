/**  
 * Project Name:Recruitment  
 * File Name:StaticService.java  
 * Package Name:com.service  
 * Date:2018年5月21日上午11:00:43  
 * Copyright (c) 2018
 *  
*/  
  
package com.service;

import com.dto.output.StaticSalary;

/**  
 * ClassName:StaticService <br/>  
 * Function: 统计. <br/>  
 * Date:     2018年5月21日 上午11:00:43 <br/>  
 * @author   YangGuangFeng  
 * @version    
 * @since    JDK 1.8  
 * @see        
 */
public interface StaticService {

	/**  
	 * staticLowestSalaryEveryYear:统计每个最低工资的. <br/>  
	 *  
	 * @author YangGuangFeng  
	 * @return  
	 * @since JDK 1.8  
	 */
	StaticSalary staticSalaryEveryYear();

}
  
