package com.service;
import java.util.List;

import com.model.User;
public interface UserService {
	 void insertUser(User user);//ע��
	 String findPwd(String username,String status);//��¼��֤
	 List<User> selectUser();//�û��б�
	 List<User> selectOneUser(int id);//����һ���û���¼
     void deleteUser(int id);//ɾ���û�
     int selectId(String username);//�����û��������û����
 	List<User> selectThisUser(int id);//���ҵ�ǰ�û�����Ϣ
 	void updateUser(int id,String username,String gonghao,String name,String sex,String age,String email,String phone);//�����û���Ϣ
}
