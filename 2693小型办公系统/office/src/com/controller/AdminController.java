package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import com.service.AdminService;
import com.service.UserService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private UserService userService;


	// ��ְ�ߵ�¼
	@RequestMapping(value = "/adminLogin.do")
	@ResponseBody
	public int adminLogin(@RequestParam String username, String password,
			HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession(true);
		if (password != ""
				&& password.equals(adminService.findAdminPwd(username))) {
			session.setAttribute("adminname", username);
			return 1;
		} else
			return 0;
	}

	// ����Ա�б�
	@RequestMapping("/adminTable.do")
	public String adminTable(HttpSession session) {
		List<Admin> findadminList = adminService.selectAdmin();
		session.setAttribute("findadminList", findadminList);
		return "views/admin/adminTable";
	}

	// ��ӹ���Ա��Ϣ
	@ResponseBody
	@RequestMapping("/addAdminInfo")
	public String addCourseInfo(String username, String password) {
		adminService.insertAdmin(username, password);
		return "true";
	}

	// ʹҪ�޸ĵ���Ϣ��ҳ����ʾ
	@RequestMapping("/upAdmin")
	public String upAdmin(Integer id, String username, String password,
			HttpSession session) throws IOException {
		username = new String(username.getBytes("ISO-8859-1"), "UTF-8");
		password = new String(password.getBytes("ISO-8859-1"), "UTF-8");
		List list = new ArrayList();
		list.add(id);
		list.add(username);
		list.add(password);
		session.setAttribute("upList", list);
		return "views/admin/upAdmin";
	}

	// ���¹���Ա��Ϣ
	@ResponseBody
	@RequestMapping(value = "/upAdminInfo")
	public String upAdminInfo(@RequestParam Integer id, String username,
			String password) {
		adminService.updateAdmin(id, username, password);
		return "true";
	}

	@ResponseBody
	@RequestMapping("/delAdmin")
	public String delAdmin(Integer id) {
		adminService.deleteAdmin(id);
		return "true";
	}

	// ����ѧ����Ϣ
	@ResponseBody
	@RequestMapping(value = "/insertUser")
	public String insertUser(@RequestParam String username, String password,String gonghao,
			String name,String sex, String age, String email, String phone,String status) {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setPhone(phone);
		user.setAge(age);
		user.setEmail(email);
		user.setSex(sex);
		user.setGonghao(gonghao);
        user.setName(name);
        user.setStatus(status);
		userService.insertUser(user);
		return "true";
	}

	@RequestMapping("/upUser.do")
	public String upUser(int id, HttpSession session) {
		List<User> findadminList = userService.selectOneUser(id);
		session.setAttribute("finduserList", findadminList);
		return "views/admin/upUser";
	}
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("adminname");
		session = null;
		return "views/admin/adminLogin";
	}
}
