package com.mapper;

import com.model.User;
import java.util.List;
public interface UserMapper {
	void insertUser(User user);//用户注册
	String findPwd(String username,String status);//登录验证
	List<User> selectUser();
	List<User> selectOneUser(int id);//查找一条用户记录
	void deleteUser(int id);
	int selectId(String username);//根据用户名查找用户编号
	List<User> selectThisUser(int id);//查找当前用户的信息
	void updateUser(int id,String username,String gonghao,String name,String sex,String age,String email,String phone);//更新用户信息
}
