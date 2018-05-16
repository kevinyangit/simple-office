package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.NewsMapper;
import com.model.News;

@Service
@Transactional
public class NewsServiceImpl implements NewsService{   
    @Resource
    public NewsMapper newsMapper;

	@Override
	public List<News> selectNews() {
		// TODO Auto-generated method stub
		return newsMapper.selectNews();
	}

	@Override
	public void insertNews(News news) {
		// TODO Auto-generated method stub
		newsMapper.insertNews(news);
	}

	@Override
	public void updateNews(int id, String newsname, String author, String date,
			String context) {
		// TODO Auto-generated method stub
		newsMapper.updateNews(id, newsname, author, date, context);
	}

	@Override
	public void deleteNews(int id) {
		// TODO Auto-generated method stub
		newsMapper.deleteNews(id);
	}

	@Override
	public List<News> selectNewsContext(int id) {
		// TODO Auto-generated method stub
		return newsMapper.selectNewsContext(id);
	}

	

	

    
}