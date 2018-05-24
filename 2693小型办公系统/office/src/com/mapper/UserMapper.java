package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.model.User;
public interface UserMapper {
	void insertUser(User user);//用户注册
	String findPwd(String username,String status);//登录验证
	List<User> selectUser();
	List<User> selectOneUser(int id);//查找一条用户记录
	void deleteUser(int id);
	Integer selectId(String username);//根据用户名查找用户编号
	String selectUSERId(String gonghao);//根据工号查找用户编号
	List<User> selectThisUser(int id);//查找当前用户的信息
	void updateUser(@Param("id")int id,@Param("userName")String username,@Param("password")String password,@Param("gonghao")String gonghao,@Param("name")String name,@Param("sex")String sex,@Param("age")String age,@Param("email")String email,@Param("phone")String phone);//更新用户信息
}
