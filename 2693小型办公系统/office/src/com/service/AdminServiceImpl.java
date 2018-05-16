package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.AdminMapper;
import com.model.Admin;
import com.service.UserService;

@Service
@Transactional
public class AdminServiceImpl implements AdminService{   
    @Resource
    public AdminMapper adminMapper;

	@Override
	public String findAdminPwd(String username) {
		// TODO Auto-generated method stub
		return adminMapper.findAdminPwd(username);
	}

	@Override
	public List<Admin> selectAdmin() {
		// TODO Auto-generated method stub
		return adminMapper.selectAdmin();
	}

	@Override
	public void insertAdmin(String username, String password) {
		// TODO Auto-generated method stub
		adminMapper.insertAdmin(username, password);
	}

	@Override
	public void updateAdmin(int id, String username, String password) {
		// TODO Auto-generated method stub
		adminMapper.updateAdmin(id, username, password);
	}

	@Override
	public void deleteAdmin(int id) {
		// TODO Auto-generated method stub
		adminMapper.deleteAdmin(id);
	}  
    
}