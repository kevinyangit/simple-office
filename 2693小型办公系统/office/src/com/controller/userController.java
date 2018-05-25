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

import com.dto.output.StaticSalary;
import com.model.Admin;
import com.model.ResultBean;
import com.model.User;
import com.service.UserService;

@Controller
public class userController {
	@Autowired
	private UserService userService;

	// Ա��ע��
	@RequestMapping(value = "/yuangongRegister.do")
	@ResponseBody
	public ResultBean<String> yuangong(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		ResultBean<String> result = new ResultBean<String>();
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
		user.setStatus("Ա��");
		try {
			Integer userID = userService.selectId(username);
			String repeatWorkerNo = userService.selectUSERId(gonghao);
			if (null != userID) {
				/*
				 * ע��ʧ�ܣ��ǳ��ظ�
				 */
				result.setData("nameExist");
				//ע��ʧ�ܣ����ǳ��Ѿ�����
				
			} else if (repeatWorkerNo != null) {
				/*
				 * ע��ʧ�ܣ������ظ�
				 */
				//ע��ʧ�ܣ��ù����Ѿ�����
				result.setData("gonghaoExist");
			} else {
				userService.insertUser(user);
				/*
				 * ע��ɹ���ǰ����¼ҳ���е�¼
				 */
				//ע��ɹ���ǰ����¼ҳ���е�¼
				result.setData("login");
				//return "views/login/login";
			}
			} catch (Exception e) {
				e.printStackTrace();
				result.setCode(ResultBean.UNKNOWN_EXCEPTION);
				result.setMsg(ResultBean.MESSAGE_ERROR);
			}
			return result;

	}

	// ��¼
	@RequestMapping(value = "/userLogin.do")
	@ResponseBody
	public int userLogin(@RequestParam String username, String status,
			String password, HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession(true);
		if (password != ""
				&& password.equals(userService.findPwd(username, status))) {
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
		user.setStatus("����");
		Integer userID = userService.selectId(username);
		String repeatWorkerNo = userService.selectUSERId(gonghao);
		if (null != userID) {
			/*
			 * ע��ʧ�ܣ��ǳ��ظ�
			 */
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write(
					"<script>alert('ע��ʧ�ܣ����ǳ��Ѿ�����');</script>");
			response.getWriter().flush();
			return "views/login/addJingli";
		} else if (repeatWorkerNo != null) {
			/*
			 * ע��ʧ�ܣ������ظ�
			 */
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write(
					"<script>alert('ע��ʧ�ܣ��ù����Ѿ�����');</script>");
			response.getWriter().flush();
			return "views/login/addJingli";
		} else {
			
			userService.insertUser(user);
			/*
			 * ע��ɹ���ǰ����¼ҳ���е�¼
			 */
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alert('ע��ɹ���ǰ����¼ҳ���е�¼');</script>");
			response.getWriter().flush();
			return "views/login/login";
		}
	}
	// �û��б�
	@RequestMapping("/userTable.do")
	public String userTable(HttpSession session) {
		List<User> finduserList = userService.selectUser();
		session.setAttribute("finduserList", finduserList);
		return "views/admin/userTable";
	}

	// ɾ���û�
	@ResponseBody
	@RequestMapping("/deluser")
	public String delUser(Integer id) {
		userService.deleteUser(id);
		return "true";
	}

	// �û���Ϣ��ҳ����ʾ
	@RequestMapping("/userInfo")
	public String userInfo(HttpServletRequest request, HttpSession session)
			throws IOException {
		String username = (String) session.getAttribute("username");
		int id = userService.selectId(username);
		List<User> userInfo = userService.selectThisUser(id);
		session.setAttribute("userInfo", userInfo);
		return "views/login/userManage";
	}

	// �����û���Ϣ
	@ResponseBody
	@RequestMapping(value = "/updateUserInfo")
	public String upUserInfo(@RequestParam Integer id, String username,String password,
			String gonghao, String name, String sex, String age, String email,
			String phone) {
		userService.updateUser(id, username,password, gonghao, name, sex, age, email,
				phone);
		return "true";
	}

	// ע��
	@RequestMapping("/exit")
	public ModelAndView exit(HttpSession session) {
		session.invalidate();
		return new ModelAndView("index");
	}

	// �û��б�
	@RequestMapping("/user/list.do")
	@ResponseBody
	public ResultBean<List<User>> list(HttpSession session) {
		ResultBean<List<User>> result = new ResultBean<List<User>>();
		try {
			List<User> list = userService.selectUser();
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
			result.setCode(ResultBean.UNKNOWN_EXCEPTION);
			result.setMsg(ResultBean.MESSAGE_ERROR);
		}
		return result;
	}
}
