package kr.co.lesson.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LessonDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
