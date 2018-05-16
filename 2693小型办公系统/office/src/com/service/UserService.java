package com.service;
import java.util.List;

import com.model.User;
public interface UserService {
	 void insertUser(User user);//注册
	 String findPwd(String username,String status);//登录验证
	 List<User> selectUser();//用户列表
	 List<User> selectOneUser(int id);//查找一条用户记录
     void deleteUser(int id);//删除用户
     int selectId(String username);//根据用户名查找用户编号
 	List<User> selectThisUser(int id);//查找当前用户的信息
 	void updateUser(int id,String username,String gonghao,String name,String sex,String age,String email,String phone);//更新用户信息
}
