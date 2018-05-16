package com.mapper;

import com.model.User;
import java.util.List;
public interface UserMapper {
	void insertUser(User user);//�û�ע��
	String findPwd(String username,String status);//��¼��֤
	List<User> selectUser();
	List<User> selectOneUser(int id);//����һ���û���¼
	void deleteUser(int id);
	int selectId(String username);//�����û��������û����
	List<User> selectThisUser(int id);//���ҵ�ǰ�û�����Ϣ
	void updateUser(int id,String username,String gonghao,String name,String sex,String age,String email,String phone);//�����û���Ϣ
}
