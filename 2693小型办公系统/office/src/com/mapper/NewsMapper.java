package com.mapper;
import com.model.News;
import java.util.List;
public interface NewsMapper {
	List<News> selectNews();
	void insertNews(News news);
	void updateNews(int id, String newsname,String author,String date, String context);
	void deleteNews(int id);
	List<News> selectNewsContext(int id);//查找新闻内容
}
