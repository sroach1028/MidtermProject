package com.skilldistillery.petbnb.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.petbnb.data.PettrDAO;
import com.skilldistillery.petbnb.entities.User;

@Controller
public class UserController {

	@Autowired
	private PettrDAO pettrDAO;
	
	
	@RequestMapping(path = "/")
	public String home() {
		return "home";
	}
	
	@RequestMapping(path = "coming.do")
	public String comingSoon() {
		return "coming-soon";
	}
	
	@RequestMapping(path = "getUser.do", method = RequestMethod.GET)
	public ModelAndView getUser(@RequestParam("userId") int userId) {
		ModelAndView mv = new ModelAndView();

		System.out.println(userId);
		User user = pettrDAO.findUserById(userId);

		mv.addObject("user", user);
		mv.setViewName("user_profile");
		return mv;
	}
}
