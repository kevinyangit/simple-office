package com.mapper;
import java.util.List;

import com.model.Chuqing;
import com.model.Conference;
import com.model.Email;
import com.model.Rcap;
import com.model.Salary;
import com.model.Shenqing;
public interface InformationMapper {
	void insertRcap(String username,String time,String thing);//添加日程安排
	List<Rcap> selectAllRcap();
	List<Rcap> selectOneRcap(String username);	
	void deleteRcap(int id);
	void insertEmail(String fsperson,String jsperson,String time,String context);//添加邮件信息
	List<Email> selectAllEmail();	
	List<Email> selectMyEmail(String jsperson);
	void deleteEmail(int id);
	void insertConference(String time,String location,String context);//添加会议信息
	List<Conference> selectAllConference();	
	void deleteConference(int id);
	void insertSalary(String username,String year,String month,String jibensalary,String jixiaosalary);//添加薪水信息
	List<Salary> selectAllSalary();	
	List<Salary> selectOneSalary(String username);
	void deleteSalary(int id);
	void insertShengqing(String username,String shengqingtype,String date,String context,String status);//添加申请信息
	List<Shenqing> selectOneShengqing(String username);
	List<Shenqing> selectAllShengqing();
	List<Shenqing> selectShengqingById(int id);
	void updateShengqing(int id,String status);//更新申请状态
	void insertChuqing(String username,String chuqingtype,String date,String context,String status,String timeranges);//添加考勤信息
	List<Chuqing> selectOneChuqing(String username);
	List<Chuqing> selectAllChuqing();
	List<Chuqing> selectChuqingById(int id);
	void updateChuqing(int id,String status);//更新申请状态
	void deleteChuqing(int id);//删除申请
}
