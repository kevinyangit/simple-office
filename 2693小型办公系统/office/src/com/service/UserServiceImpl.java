package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.UserMapper;
import com.model.User;
import com.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService{   
    @Resource
    public UserMapper userMapper;

	@Override
	public void insertUser(User user) {
		// TODO Auto-generated method stub
		userMapper.insertUser(user);
	}

	@Override
	public List<User> selectUser() {
		// TODO Auto-generated method stub
		return userMapper.selectUser();
	}

	@Override
	public void deleteUser(int id) {
		// TODO Auto-generated method stub
		userMapper.deleteUser(id);
	}

	@Override
	public Integer selectId(String username) {
		// TODO Auto-generated method stub
		return userMapper.selectId(username);
	}

	@Override
	public List<User> selectThisUser(int id) {
		// TODO Auto-generated method stub
		return userMapper.selectThisUser(id);
	}

	@Override
	public List<User> selectOneUser(int id) {
		// TODO Auto-generated method stub
		return userMapper.selectOneUser(id);
	}

	@Override
	public String findPwd(String username, String status) {
		// TODO Auto-generated method stub
		return userMapper.findPwd(username, status);
	}

	@Override
	public void updateUser(int id, String username,String password, String gonghao,
			String name, String sex, String age, String email, String phone) {
		// TODO Auto-generated method stub
		userMapper.updateUser(id, username,password, gonghao, name, sex, age, email, phone);
	}

	@Override
	public String selectUSERId(String gonghao) {
		// TODO Auto-generated method stub
		return  userMapper.selectUSERId(gonghao);
	
	}
      
}