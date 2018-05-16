package com.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.model.Conference;
import com.model.Email;
import com.model.Rcap;
import com.model.Salary;
import com.model.Shenqing;
import com.model.Chuqing;
import com.model.User;
import com.service.InformationServiceImpl;
import com.service.UserService;

@Controller
public class InformationController {
	@Autowired
	private InformationServiceImpl InformationService;
	@Autowired
	private UserService userService;

	// 行程列表
	@RequestMapping("/rcapTable.do")
	public String recpTable(HttpSession session) {
		List<Rcap> resume = InformationService.selectAllRcap();
		session.setAttribute("findRcapList", resume);
		return "views/admin/rcapTable";
	}

	// 新增日程安排
	@RequestMapping(value = "/insertRcap.do")
	@ResponseBody
	public String insertRcap(@RequestParam String username, String time,
			String thing) throws IOException {
		InformationService.insertRcap(username, time, thing);
		return "true";
	}

	// 查找个人日程安排，根据Uid
	@RequestMapping(value = "/rcapList.do")
	public ModelAndView rcapList(HttpSession session) throws IOException {
		String username = (String) session.getAttribute("username");
		List<Rcap> resume = InformationService.selectOneRcap(username);
		ModelAndView mv = new ModelAndView();
		mv.addObject("rcapList", resume);
		mv.setViewName("views/information/rcapList");
		return mv;
	}

	// 删除日程安排
	@ResponseBody
	@RequestMapping("/deleteRcap")
	public String deleteRcap(Integer id) {
		InformationService.deleteRcap(id);
		return "true";
	}

	// 邮件列表
	@RequestMapping("/emailTable.do")
	public String emailTable(HttpSession session) {
		List<Email> resume = InformationService.selectAllEmail();
		session.setAttribute("findEmailList", resume);
		return "views/admin/emailTable";
	}

	// 查找邮件
	@RequestMapping(value = "/emailList.do")
	public ModelAndView emailList(HttpSession session) throws IOException {
		List<Email> resume = InformationService.selectAllEmail();
		ModelAndView mv = new ModelAndView();
		mv.addObject("emailList", resume);
		mv.setViewName("views/information/emailList");
		return mv;
	}

	// 新增邮件
	@RequestMapping(value = "/insertEmail.do")
	@ResponseBody
	public String insertEmail(@RequestParam String fsperson,String jsperson,String time, String context)
			throws IOException {
		InformationService.insertEmail(fsperson,jsperson,time, context);
		return "true";
	}

	// 删除邮件
	@ResponseBody
	@RequestMapping("/deleteEmail")
	public String deleteEmail(Integer id) {
		InformationService.deleteEmail(id);
		return "true";
	}

	// 后台会议列表
	@RequestMapping("/conferenceTable.do")
	public String conferenceTable(HttpSession session) {
		List<Conference> resume = InformationService.selectAllConference();
		session.setAttribute("findConferenceList", resume);
		return "views/admin/conferenceTable";
	}

	// 查找会议
	@RequestMapping(value = "/conferenceList.do")
	public ModelAndView conferenceList(HttpSession session) throws IOException {
		List<Conference> resume = InformationService.selectAllConference();
		ModelAndView mv = new ModelAndView();
		mv.addObject("conferenceList", resume);
		mv.setViewName("views/information/conferenceList");
		return mv;
	}

	// 新增邮件
	@RequestMapping(value = "/insertConference.do")
	@ResponseBody
	public String insertConference(@RequestParam String time, String location,
			String context) throws IOException {
		InformationService.insertConference(time, location, context);
		return "true";
	}

	// 删除邮件
	@ResponseBody
	@RequestMapping("/deleteConference")
	public String deleteConference(Integer id) {
		InformationService.deleteConference(id);
		return "true";
	}

	// 后台薪水列表
	@RequestMapping("/salaryTable.do")
	public String salaryTable(HttpSession session) {
		List<Salary> resume = InformationService.selectAllSalary();
		session.setAttribute("findSalaryList", resume);
		return "views/admin/salaryTable";
	}

	// 新增薪水
	@RequestMapping(value = "/insertSalary.do")
	@ResponseBody
	public String insertSalary(@RequestParam String username, String year,
			String month, String jibensalary, String jixiaosalary)
			throws IOException {
		InformationService.insertSalary(username, year, month, jibensalary,
				jixiaosalary);
		return "true";
	}

	// 删除薪水
	@ResponseBody
	@RequestMapping("/deleteSalary")
	public String deleteSalary(Integer id) {
		InformationService.deleteSalary(id);
		return "true";
	}

	// 查找会议
	@RequestMapping(value = "/salaryList.do")
	public ModelAndView salaryList(HttpSession session) throws IOException {
		String username = (String) session.getAttribute("username");
		List<Salary> resume = InformationService.selectOneSalary(username);
		ModelAndView mv = new ModelAndView();
		mv.addObject("salaryList", resume);
		mv.setViewName("views/information/salaryList");
		return mv;
	}

	// 新增申请
	@RequestMapping(value = "/insertShengqing.do")
	@ResponseBody
	public String insertShengqing(@RequestParam String shengqingtype,
			String context, HttpSession session) throws IOException {
		String username = (String) session.getAttribute("username");
		Date day = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = df.format(day);
		InformationService.insertShengqing(username, shengqingtype, date,
				context, "审批中");
		return "true";
	}

	// 查看我的申请信息
	@RequestMapping(value = "/myshengqingList.do")
	public ModelAndView myshenqingList(HttpSession session) throws IOException {
		String username = (String) session.getAttribute("username");
		List<Shenqing> resume = InformationService.selectOneShengqing(username);
		ModelAndView mv = new ModelAndView();
		mv.addObject("myshegnqingList", resume);
		mv.setViewName("views/information/myshengqingList");
		return mv;
	}

	// 查看申请信息
	@RequestMapping(value = "/shengqingList.do")
	public ModelAndView shenqingList(HttpSession session) throws IOException {
		List<Shenqing> resume = InformationService.selectAllShengqing();
		ModelAndView mv = new ModelAndView();
		mv.addObject("shegnqingList", resume);
		mv.setViewName("views/information/shengqingList");
		return mv;
	}

	// 查看某一条申请信息
	@RequestMapping(value = "/shengqingInfo.do")
	public ModelAndView shengqingInfo(HttpServletRequest request,
			HttpSession session) throws IOException {
		String id = request.getParameter("id");
		List<Shenqing> resume = InformationService.selectShengqingById(Integer
				.parseInt(id));
		ModelAndView mv = new ModelAndView();
		mv.addObject("shegnqingInfo", resume);
		mv.setViewName("views/information/shengqingInfo");
		return mv;
	}

	// 更新审批
	@RequestMapping(value = "/updateShengqing.do")
	@ResponseBody
	public String updateShengqing(@RequestParam int id, String status,
			HttpSession session) throws IOException {
		InformationService.updateShengqing(id, status);
		return "true";
	}

	// 新增出勤
	@RequestMapping(value = "/insertChuqing.do")
	@ResponseBody
	public String Chuqing(@RequestParam String chuqingtype, String context,String timeranges,
			HttpSession session) throws IOException {
		String username = (String) session.getAttribute("username");
		Date day = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = df.format(day);
		InformationService.insertChuqing(username, chuqingtype, date, context,
				"审批中",timeranges);
		return "true";
	}

	// 查看我的申请信息
	@RequestMapping(value = "/mychuqingList.do")
	public ModelAndView mychuqingList(HttpSession session) throws IOException {
		String username = (String) session.getAttribute("username");
		List<Chuqing> resume = InformationService.selectOneChuqing(username);
		ModelAndView mv = new ModelAndView();
		mv.addObject("mychuqingList", resume);
		mv.setViewName("views/information/mychuqingList");
		return mv;
	}

	// 查看出勤信息
	@RequestMapping(value = "/chuqingList.do")
	public ModelAndView chuqingList(HttpSession session) throws IOException {
		List<Chuqing> resume = InformationService.selectAllChuqing();
		ModelAndView mv = new ModelAndView();
		mv.addObject("chuqingList", resume);
		mv.setViewName("views/information/chuqingList");
		return mv;
	}

	// 查看某一条申请信息
	@RequestMapping(value = "/chuqingInfo.do")
	public ModelAndView chuqingInfo(HttpServletRequest request,
			HttpSession session) throws IOException {
		String id = request.getParameter("id");
		List<Chuqing> resume = InformationService.selectChuqingById(Integer
				.parseInt(id));
		ModelAndView mv = new ModelAndView();
		mv.addObject("chuqingInfo", resume);
		mv.setViewName("views/information/chuqingInfo");
		return mv;
	}

	// 更新审批
	@RequestMapping(value = "/updateChuqing.do")
	@ResponseBody
	public String updateChuqing(@RequestParam int id, String status,
			HttpSession session) throws IOException {
		InformationService.updateChuqing(id, status);
		return "true";
	}
	// 删除出勤
		@ResponseBody
		@RequestMapping("/deleteChuqing")
		public String deleteChuqing(Integer id) {
			InformationService.deleteChuqing(id);
			return "true";
		}
}
