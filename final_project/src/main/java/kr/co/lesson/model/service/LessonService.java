package kr.co.lesson.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.lesson.model.dao.LessonDao;

@Service
public class LessonService {

	@Autowired
	private LessonDao dao;
}
