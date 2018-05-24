package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.model.User;
public interface UserMapper {
	void insertUser(User user);//�û�ע��
	String findPwd(String username,String status);//��¼��֤
	List<User> selectUser();
	List<User> selectOneUser(int id);//����һ���û���¼
	void deleteUser(int id);
	Integer selectId(String username);//�����û��������û����
	String selectUSERId(String gonghao);//���ݹ��Ų����û����
	List<User> selectThisUser(int id);//���ҵ�ǰ�û�����Ϣ
	void updateUser(@Param("id")int id,@Param("userName")String username,@Param("password")String password,@Param("gonghao")String gonghao,@Param("name")String name,@Param("sex")String sex,@Param("age")String age,@Param("email")String email,@Param("phone")String phone);//�����û���Ϣ
}
