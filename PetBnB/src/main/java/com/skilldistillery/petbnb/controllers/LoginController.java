package com.skilldistillery.petbnb.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.petbnb.data.LoginDAO;
import com.skilldistillery.petbnb.entities.Host;
import com.skilldistillery.petbnb.entities.User;

@Controller
public class LoginController {
	@Autowired
	private LoginDAO logdao;
	
	@RequestMapping(path="goLogin.do", method= RequestMethod.GET)
	public ModelAndView goLogin(@Valid User user) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}
	
	@RequestMapping(path="login.do", method= RequestMethod.GET)
	public ModelAndView login(@Valid User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User u = logdao.verifyLogin(user.getUsername(), user.getPassword());
		if (u != null) {
			Host host = u.getHost();
			session.setAttribute("sessionUser", u);
			session.setAttribute("sessionHost", host);
			user = null;
			mv.addObject("user", user);
			mv.setViewName("home");
			return mv;
		}
		mv.setViewName("login");
		mv.addObject("error", "No matching users found for that username and password combination. Try again");
		return mv;
	}
	@RequestMapping(path="logout.do", method= RequestMethod.GET)
	public ModelAndView log(@Valid User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		session.removeAttribute("sessionUser");
		session.removeAttribute("sessionHost");
		mv.setViewName("home");
		return mv;
	}
}
