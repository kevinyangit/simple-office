package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.InformationMapper;
import com.model.Chuqing;
import com.model.Conference;
import com.model.Email;
import com.model.Rcap;
import com.model.Salary;
import com.model.Shenqing;


@Service
@Transactional
public class InformationServiceImpl implements InformationService{   
    @Resource
    public InformationMapper informationMapper;

	@Override
	public void insertRcap(String username, String time, String thing) {
		// TODO Auto-generated method stub
		informationMapper.insertRcap(username, time, thing);
	}

	@Override
	public List<Rcap> selectAllRcap() {
		// TODO Auto-generated method stub
		return informationMapper.selectAllRcap();
	}

	@Override
	public List<Rcap> selectOneRcap(String username) {
		// TODO Auto-generated method stub
		return informationMapper.selectOneRcap(username);
	}

	@Override
	public void deleteRcap(int id) {
		// TODO Auto-generated method stub
		informationMapper.deleteRcap(id);
	}

	@Override
	public List<Email> selectAllEmail() {
		// TODO Auto-generated method stub
		return informationMapper.selectAllEmail();
	}

	@Override
	public void deleteEmail(int id) {
		// TODO Auto-generated method stub
		informationMapper.deleteEmail(id);
	}

	@Override
	public void insertConference(String time, String location, String context) {
		// TODO Auto-generated method stub
		informationMapper.insertConference(time, location, context);
	}

	@Override
	public List<Conference> selectAllConference() {
		// TODO Auto-generated method stub
		return informationMapper.selectAllConference();
	}

	@Override
	public void deleteConference(int id) {
		// TODO Auto-generated method stub
		informationMapper.deleteConference(id);
	}

	@Override
	public void insertSalary(String username, String year, String month,
			String jibensalary, String jixiaosalary) {
		// TODO Auto-generated method stub
		informationMapper.insertSalary(username, year, month, jibensalary, jixiaosalary);
	}

	@Override
	public List<Salary> selectAllSalary() {
		// TODO Auto-generated method stub
		return informationMapper.selectAllSalary();
	}

	@Override
	public void deleteSalary(int id) {
		// TODO Auto-generated method stub
		informationMapper.deleteSalary(id);
	}

	@Override
	public List<Salary> selectOneSalary(String username) {
		// TODO Auto-generated method stub
		return informationMapper.selectOneSalary(username);
	}

	@Override
	public void insertShengqing(String username, String shengqingtype,
			String date, String context, String status) {
		// TODO Auto-generated method stub
		informationMapper.insertShengqing(username, shengqingtype, date, context, status);
	}

	@Override
	public List<Shenqing> selectOneShengqing(String username) {
		// TODO Auto-generated method stub
		return informationMapper.selectOneShengqing(username);
	}

	@Override
	public void insertChuqing(String username, String chuqingtype,
			String date, String context, String status,String timeranges) {
		// TODO Auto-generated method stub
		informationMapper.insertChuqing(username, chuqingtype, date, context, status,timeranges);
	}

	@Override
	public List<Chuqing> selectOneChuqing(String username) {
		// TODO Auto-generated method stub
		return informationMapper.selectOneChuqing(username);
	}

	@Override
	public List<Shenqing> selectAllShengqing() {
		// TODO Auto-generated method stub
		return informationMapper.selectAllShengqing();
	}

	@Override
	public List<Chuqing> selectAllChuqing() {
		// TODO Auto-generated method stub
		return informationMapper.selectAllChuqing();
	}

	@Override
	public List<Shenqing> selectShengqingById(int id) {
		// TODO Auto-generated method stub
		return informationMapper.selectShengqingById(id);
	}

	@Override
	public List<Chuqing> selectChuqingById(int id) {
		// TODO Auto-generated method stub
		return informationMapper.selectChuqingById(id);
	}

	@Override
	public void updateShengqing(int id, String status) {
		// TODO Auto-generated method stub
		informationMapper.updateShengqing(id, status);
	}

	@Override
	public void updateChuqing(int id, String status) {
		// TODO Auto-generated method stub
		informationMapper.updateChuqing(id, status);
	}

	@Override
	public void insertEmail(String fsperson, String jsperson, String time,
			String context) {
		// TODO Auto-generated method stub
		informationMapper.insertEmail(fsperson, jsperson, time, context);
	}

	@Override
		// TODO Auto-generated method stub
	public List<Email> selectMyEmail(String jsperson) {
		return informationMapper.selectMyEmail(jsperson);
	}

	@Override
	public void deleteChuqing(int id) {
		// TODO Auto-generated method stub
		informationMapper.deleteChuqing(id);
	}

	
}