package com.service;
import java.util.List;

import com.model.News;
public interface NewsService {
	List<News> selectNews();
	void insertNews(News news);
	void updateNews(int id, String newsname,String author,String date, String context);
	void deleteNews(int id);
	List<News> selectNewsContext(int id);//查找新闻内容
}
