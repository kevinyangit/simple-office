package com.service;

import java.util.List;

import com.model.Admin;

public interface AdminService {
	
	 String findAdminPwd(String username);//��¼��֤
	 List<Admin> selectAdmin();
	 void insertAdmin(String username,String password);
		void updateAdmin(int id,String username,String password);
		void deleteAdmin(int id);
}
