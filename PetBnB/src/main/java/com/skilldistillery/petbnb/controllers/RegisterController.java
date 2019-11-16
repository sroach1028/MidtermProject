package com.skilldistillery.petbnb.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.petbnb.data.RegisterDAO;
import com.skilldistillery.petbnb.entities.User;

@Controller
public class RegisterController {
	@Autowired
	private RegisterDAO registerDAO;
	
	@RequestMapping(path="goRegister.do", method= RequestMethod.GET)
	public ModelAndView goRegister(@Valid User user) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("register");
		return mv;
	}
	
	@RequestMapping(path="register.do", method= RequestMethod.GET)
	public ModelAndView register(@Valid User user) {
		ModelAndView mv = new ModelAndView();
		User newUser = registerDAO.registerUser(user);
		if (newUser != null) {
			user = null;
			mv.addObject("user", newUser);
			mv.setViewName("userProfile");
			return mv;
		}
		mv.setViewName("register");
		mv.addObject("error", "No matching users found for that username and password combination. Try again");
		return mv;
	}
}
