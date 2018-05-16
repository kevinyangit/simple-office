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

import com.model.News;
import com.service.NewsService;

@Controller
public class NewsController {
	@Autowired
	private NewsService newsService;

	// 新闻列表
	@RequestMapping("/newsTable.do")
	public String newsTable(HttpSession session) {
		List<News> findNewsList = newsService.selectNews();
		session.setAttribute("findNewsList", findNewsList);
		return "views/news/newsTable";
	}

	// 用户界面新闻列表
	@RequestMapping("/allNews.do")
	public String allNewsU(HttpSession session) {
		List<News> findNewsList = newsService.selectNews();
		session.setAttribute("findNewsList", findNewsList);
		return "views/news/indexNews";
	}

	// 删除新闻
	@ResponseBody
	@RequestMapping("/delNews")
	public String delNews(Integer id) {
		newsService.deleteNews(id);
		return "true";
	}

	// 添加新闻信息
	@ResponseBody
	@RequestMapping("/insertNews")
	public String addNewsInfo(String newsname, String author, String date,
			String context) {
		News news = new News();
		news.setAuthor(author);
		news.setContext(context);
		news.setDate(date);
		news.setNewsname(newsname);
		newsService.insertNews(news);
		return "true";
	}

	// 使要修改的信息在页面显示
	@RequestMapping("/upNews")
	public String upnews(Integer id, String newsname, String author,
			String date, String context, HttpSession session)
			throws IOException {
		newsname = new String(newsname.getBytes("ISO-8859-1"), "UTF-8");
		author = new String(author.getBytes("ISO-8859-1"), "UTF-8");
		context = new String(context.getBytes("ISO-8859-1"), "UTF-8");
		List list = new ArrayList();
		list.add(id);
		list.add(newsname);
		list.add(author);
		list.add(date);
		list.add(context);
		session.setAttribute("upList", list);
		return "views/news/upNews";
	}

	// 更新新闻信息
	@ResponseBody
	@RequestMapping(value = "/updateNewsInfo")
	public String upAdminInfo(@RequestParam Integer id, String newsname,
			String author, String date, String context) {
		newsService.updateNews(id, newsname, author, date, context);
		return "true";
	}
	//用户新闻显示
		@RequestMapping("/newsContext.do")
		public String newsContextU(HttpServletRequest request,HttpSession session) {
			String id=request.getParameter("id");
			List<News> context=newsService.selectNewsContext(Integer.parseInt(id));
			session.setAttribute("newsContext", context);
			return "views/news/newsContext";
		}
}
