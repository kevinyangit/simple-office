package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.model.Admin;
import com.model.User;
import com.service.UserService;

@Controller
public class userController {
	@Autowired
	private UserService userService;

	// 员工注册
	@RequestMapping(value = "/yuangongRegister.do")
	public String yuangong(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		User user = new User();
		String username = request.getParameter("account");
		String password = request.getParameter("pwd");
		String gonghao = request.getParameter("gonghao");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");
		String email = request.getParameter("email");
		user.setUsername(username);
		user.setPassword(password);
		user.setPhone(phone);
		user.setAge(age);
		user.setEmail(email);
		user.setSex(sex);
		user.setGonghao(gonghao);
		user.setName(name);
		user.setStatus("员工");
		userService.insertUser(user);
		/*
		 * 注册成功，前往登录页进行登录
		 */
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write("<script>alert('注册成功，前往登录页进行登录');</script>");
		response.getWriter().flush();
		return "views/login/login";
	}

	// 登录
	@RequestMapping(value = "/userLogin.do")
	@ResponseBody
	public int userLogin(@RequestParam String username,String status, String password,
			HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession(true);
		if (password != "" && password.equals(userService.findPwd(username,status))) {
			session.setAttribute("username", username);
			session.setAttribute("status", status);
			return 1;
		} else
			return 0;
	}

	@RequestMapping(value = "/jingliRegister.do")
	public String jingli(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		User user = new User();
		String username = request.getParameter("account");
		String password = request.getParameter("pwd");
		String gonghao = request.getParameter("gonghao");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");
		String email = request.getParameter("email");
		user.setUsername(username);
		user.setPassword(password);
		user.setPhone(phone);
		user.setAge(age);
		user.setEmail(email);
		user.setSex(sex);
		user.setGonghao(gonghao);
		user.setName(name);
		user.setStatus("经理");
		userService.insertUser(user);
		/*
		 * 注册成功，前往登录页进行登录
		 */
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write("<script>alert('注册成功，前往登录页进行登录');</script>");
		response.getWriter().flush();
		return "views/login/login";
	}


	// 用户列表
	@RequestMapping("/userTable.do")
	public String userTable(HttpSession session) {
		List<User> finduserList = userService.selectUser();
		session.setAttribute("finduserList", finduserList);
		return "views/admin/userTable";
	}

	// 删除用户
	@ResponseBody
	@RequestMapping("/deluser")
	public String delUser(Integer id) {
		userService.deleteUser(id);
		return "true";
	}

	// 用户信息在页面显示
	@RequestMapping("/userInfo")
	public String userInfo(HttpServletRequest request, HttpSession session)
			throws IOException {
		String username = (String) session.getAttribute("username");
		int id = userService.selectId(username);
		List<User> userInfo = userService.selectThisUser(id);
		session.setAttribute("userInfo", userInfo);
		return "views/login/userManage";
	}

	// 更新用户信息
	@ResponseBody
	@RequestMapping(value = "/updateUserInfo")
	public String upUserInfo(@RequestParam Integer id, String username, String gonghao,
			String name,String sex, String age, String email, String phone) {
		userService.updateUser(id, username, gonghao, name, sex, age, email, phone);
		return "true";
	}

	// 注销
		@RequestMapping("/exit")
		public ModelAndView exit(HttpSession session) {
			session.invalidate();
			return new ModelAndView("index");
		}

}
