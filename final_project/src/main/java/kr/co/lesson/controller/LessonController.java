package kr.co.lesson.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.lesson.model.service.LessonService;

@Controller
public class LessonController {

	@Autowired
	private LessonService service;
}
