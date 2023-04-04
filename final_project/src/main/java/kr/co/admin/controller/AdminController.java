package kr.co.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.admin.model.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@RequestMapping(value="/memberList.do")
	public String memberList() {
		
		return "admin/memberList";
	}
	
	@RequestMapping(value="/sellerEnrollList.do")
	public String sellerEnrollList() {
		
		return "admin/sellerEnrollList";
	}
	
	@RequestMapping(value="/newProduct.do")
	public String newProduct() {
		
		return "admin/newProduct";
	}

}
