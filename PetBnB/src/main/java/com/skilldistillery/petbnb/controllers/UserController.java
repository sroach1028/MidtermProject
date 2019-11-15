package com.skilldistillery.petbnb.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {


	@RequestMapping(path = "/")
	public String home() {
		return "home";
	}
	
	@RequestMapping(path = "coming.do")
	public String comingSoon() {
		return "coming-soon";
	}
}
