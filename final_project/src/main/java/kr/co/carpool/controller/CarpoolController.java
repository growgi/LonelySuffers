package kr.co.carpool.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.carpool.model.service.CarpoolService;

@Controller
public class CarpoolController {
	@Autowired
	private CarpoolService service;
	

}
