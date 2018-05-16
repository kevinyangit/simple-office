package com.mapper;
import java.util.List;

import com.model.Admin;
public interface AdminMapper {
	String findAdminPwd(String username);//µÇÂ¼ÑéÖ¤
	List<Admin> selectAdmin();
	void insertAdmin(String username,String password);
	void updateAdmin(int id,String username,String password);
	void deleteAdmin(int id);
}
