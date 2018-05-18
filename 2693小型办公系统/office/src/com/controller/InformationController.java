package com.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.model.Chuqing;
import com.model.Conference;
import com.model.Email;
import com.model.Rcap;
import com.model.Salary;
import com.model.Shenqing;
import com.service.InformationServiceImpl;
import com.service.UserService;

@Controller
public class InformationController {
	@Autowired
	private InformationServiceImpl InformationService;
	@Autowired
	private UserService userService;

	// �г��б�
	@RequestMapping("/rcapTable.do")
	public String recpTable(HttpSession session) {
		List<Rcap> resume = InformationService.selectAllRcap();
		session.setAttribute("findRcapList", resume);
		return "views/admin/rcapTable";
	}

	// �����ճ̰���
	@RequestMapping(value = "/insertRcap.do")
	@ResponseBody
	public String insertRcap(@RequestParam String username, String time,
			String thing) throws IOException {
		InformationService.insertRcap(username, time, thing);
		return "true";
	}

	// ���Ҹ����ճ̰��ţ�����Uid
	@RequestMapping(value = "/rcapList.do")
	public ModelAndView rcapList(HttpSession session) throws IOException {
		String username = (String) session.getAttribute("username");
		List<Rcap> resume = InformationService.selectOneRcap(username);
		ModelAndView mv = new ModelAndView();
		mv.addObject("rcapList", resume);
		mv.setViewName("views/information/rcapList");
		return mv;
	}

	// ɾ���ճ̰���
	@ResponseBody
	@RequestMapping("/deleteRcap")
	public String deleteRcap(Integer id) {
		InformationService.deleteRcap(id);
		return "true";
	}

	// �ʼ��б�
	@RequestMapping("/emailTable.do")
	public String emailTable(HttpSession session) {
		List<Email> resume = InformationService.selectAllEmail();
		session.setAttribute("findEmailList", resume);
		return "views/admin/emailTable";
	}

	// �����ʼ�
	@RequestMapping(value = "/emailList.do")
	public ModelAndView emailList(HttpSession session, @RequestParam("username")String username) throws IOException {
//		List<Email> resume = InformationService.selectAllEmail();
		List<Email> resume = InformationService.selectMyEmail(username);
		ModelAndView mv = new ModelAndView();
		mv.addObject("emailList", resume);
		mv.setViewName("views/information/emailList");
		return mv;
	}

	// �����ʼ�
	@RequestMapping(value = "/insertEmail.do")
	@ResponseBody
	public String insertEmail(@RequestParam String fsperson,String jsperson,String time, String context)
			throws IOException {
		InformationService.insertEmail(fsperson,jsperson,time, context);
		return "true";
	}

	// ɾ���ʼ�
	@ResponseBody
	@RequestMapping("/deleteEmail")
	public String deleteEmail(Integer id) {
		InformationService.deleteEmail(id);
		return "true";
	}

	// ��̨�����б�
	@RequestMapping("/conferenceTable.do")
	public String conferenceTable(HttpSession session) {
		List<Conference> resume = InformationService.selectAllConference();
		session.setAttribute("findConferenceList", resume);
		return "views/admin/conferenceTable";
	}

	// ���һ���
	@RequestMapping(value = "/conferenceList.do")
	public ModelAndView conferenceList(HttpSession session) throws IOException {
		List<Conference> resume = InformationService.selectAllConference();
		ModelAndView mv = new ModelAndView();
		mv.addObject("conferenceList", resume);
		mv.setViewName("views/information/conferenceList");
		return mv;
	}

	// �����ʼ�
	@RequestMapping(value = "/insertConference.do")
	@ResponseBody
	public String insertConference(@RequestParam String time, String location,
			String context) throws IOException {
		InformationService.insertConference(time, location, context);
		return "true";
	}

	// ɾ���ʼ�
	@ResponseBody
	@RequestMapping("/deleteConference")
	public String deleteConference(Integer id) {
		InformationService.deleteConference(id);
		return "true";
	}

	// ��̨нˮ�б�
	@RequestMapping("/salaryTable.do")
	public String salaryTable(HttpSession session) {
		List<Salary> resume = InformationService.selectAllSalary();
		session.setAttribute("findSalaryList", resume);
		return "views/admin/salaryTable";
	}

	// ����нˮ
	@RequestMapping(value = "/insertSalary.do")
	@ResponseBody
	public String insertSalary(@RequestParam String username, String year,
			String month, String jibensalary, String jixiaosalary)
			throws IOException {
		InformationService.insertSalary(username, year, month, jibensalary,
				jixiaosalary);
		return "true";
	}

	// ɾ��нˮ
	@ResponseBody
	@RequestMapping("/deleteSalary")
	public String deleteSalary(Integer id) {
		InformationService.deleteSalary(id);
		return "true";
	}

	// ���һ���
	@RequestMapping(value = "/salaryList.do")
	public ModelAndView salaryList(HttpSession session) throws IOException {
		String username = (String) session.getAttribute("username");
		List<Salary> resume = InformationService.selectOneSalary(username);
		ModelAndView mv = new ModelAndView();
		mv.addObject("salaryList", resume);
		mv.setViewName("views/information/salaryList");
		return mv;
	}

	// ��������
	@RequestMapping(value = "/insertShengqing.do")
	@ResponseBody
	public String insertShengqing(@RequestParam String shengqingtype,
			String context, HttpSession session) throws IOException {
		String username = (String) session.getAttribute("username");
		Date day = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = df.format(day);
		InformationService.insertShengqing(username, shengqingtype, date,
				context, "������");
		return "true";
	}

	// �鿴�ҵ�������Ϣ
	@RequestMapping(value = "/myshengqingList.do")
	public ModelAndView myshenqingList(HttpSession session) throws IOException {
		String username = (String) session.getAttribute("username");
		List<Shenqing> resume = InformationService.selectOneShengqing(username);
		ModelAndView mv = new ModelAndView();
		mv.addObject("myshegnqingList", resume);
		mv.setViewName("views/information/myshengqingList");
		return mv;
	}

	// �鿴������Ϣ
	@RequestMapping(value = "/shengqingList.do")
	public ModelAndView shenqingList(HttpSession session) throws IOException {
		List<Shenqing> resume = InformationService.selectAllShengqing();
		ModelAndView mv = new ModelAndView();
		mv.addObject("shegnqingList", resume);
		mv.setViewName("views/information/shengqingList");
		return mv;
	}

	// �鿴ĳһ��������Ϣ
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

	// ��������
	@RequestMapping(value = "/updateShengqing.do")
	@ResponseBody
	public String updateShengqing(@RequestParam int id, String status,
			HttpSession session) throws IOException {
		InformationService.updateShengqing(id, status);
		return "true";
	}

	// ��������
	@RequestMapping(value = "/insertChuqing.do")
	@ResponseBody
	public String Chuqing(@RequestParam String chuqingtype, String context,String timeranges,
			HttpSession session) throws IOException {
		String username = (String) session.getAttribute("username");
		Date day = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = df.format(day);
		InformationService.insertChuqing(username, chuqingtype, date, context,
				"������",timeranges);
		return "true";
	}

	// �鿴�ҵ�������Ϣ
	@RequestMapping(value = "/mychuqingList.do")
	public ModelAndView mychuqingList(HttpSession session) throws IOException {
		String username = (String) session.getAttribute("username");
		List<Chuqing> resume = InformationService.selectOneChuqing(username);
		ModelAndView mv = new ModelAndView();
		mv.addObject("mychuqingList", resume);
		mv.setViewName("views/information/mychuqingList");
		return mv;
	}

	// �鿴������Ϣ
	@RequestMapping(value = "/chuqingList.do")
	public ModelAndView chuqingList(HttpSession session) throws IOException {
		List<Chuqing> resume = InformationService.selectAllChuqing();
		ModelAndView mv = new ModelAndView();
		mv.addObject("chuqingList", resume);
		mv.setViewName("views/information/chuqingList");
		return mv;
	}

	// �鿴ĳһ��������Ϣ
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

	// ��������
	@RequestMapping(value = "/updateChuqing.do")
	@ResponseBody
	public String updateChuqing(@RequestParam int id, String status,
			HttpSession session) throws IOException {
		InformationService.updateChuqing(id, status);
		return "true";
	}
	// ɾ������
		@ResponseBody
		@RequestMapping("/deleteChuqing")
		public String deleteChuqing(Integer id) {
			InformationService.deleteChuqing(id);
			return "true";
		}
}
