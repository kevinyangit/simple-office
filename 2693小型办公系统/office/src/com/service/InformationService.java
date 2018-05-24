package com.service;
import java.util.List;

import com.model.Chuqing;
import com.model.Conference;
import com.model.Email;
import com.model.Rcap;
import com.model.Salary;
import com.model.Shenqing;
public interface InformationService {
	void insertRcap(String username,String time,String thing);//����ճ̰���
	List<Rcap> selectAllRcap();
	List<Rcap> selectOneRcap(String username);	
	void deleteRcap(int id);
	void insertEmail(String fsperson,String jsperson,String time,String context);//����ʼ���Ϣ
	List<Email> selectAllEmail();	
	List<Email> selectMyEmail(String jsperson);
	void deleteEmail(int id);
	void insertConference(String time,String location,String context);//��ӻ�����Ϣ
	List<Conference> selectAllConference();	
	void deleteConference(int id);
	void insertSalary(String username, String year, String month,
			String jibensalary, String jixiaosalary,String kouQian, String qingJiaDate,String total);
	List<Salary> selectAllSalary();	
	List<Salary> selectOneSalary(String username);
	void deleteSalary(int id);
	void insertShengqing(String username,String shengqingtype,String date,String context,String status);//���������Ϣ
	List<Shenqing> selectOneShengqing(String username);
	List<Shenqing> selectShengqingById(int id);
	void updateShengqing(int id,String status);//��������״̬
	List<Chuqing> selectOneChuqing(String username);
	List<Shenqing> selectAllShengqing();
	List<Chuqing> selectAllChuqing();
	List<Chuqing> selectChuqingById(int id);
	void updateChuqing(int id,String status);//��������״̬
	void deleteChuqing(int id);//ɾ������
	void insertChuqing(String username, String chuqingtype, String date, String startDate, String endDate,
			String context, String status, String timeranges);
}
