package com.skilldistillery.petbnb.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.petbnb.data.PettrDAO;
import com.skilldistillery.petbnb.entities.Pet;
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
		return "comingSoon";
	}
	
	@RequestMapping(path = "getUser.do", method = RequestMethod.GET)
	public ModelAndView getUser(@RequestParam("userId") int userId) {
		ModelAndView mv = new ModelAndView();

		System.out.println(userId);
		User user = pettrDAO.findUserById(userId);

		mv.addObject("user", user);
		mv.setViewName("userProfile");
		return mv;
	}
	
	@RequestMapping(path = "getAllPets.do", method = RequestMethod.GET)
	public ModelAndView getAllPets() {
		ModelAndView mv = new ModelAndView();
		
		List<Pet> pets = pettrDAO.findAllPets();
		mv.addObject("pets", pets);
		mv.setViewName("animalProfile");
		return mv;
	}
	
	@RequestMapping(path = "getPet.do", method = RequestMethod.GET)
	public ModelAndView getPet(@RequestParam("petId") int petId) {
		ModelAndView mv = new ModelAndView();
		
		Pet pet = pettrDAO.findPet(petId);
		mv.addObject("pet", pet);
		mv.setViewName("animalProfile");
		return mv;
	}
	
	@RequestMapping(path = "goToUpdatePet.do", params = "petId", method = RequestMethod.GET)
	public ModelAndView goToUpdateHero(@Valid Pet pet, int petId) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("oldPet", pettrDAO.findPet(petId));
		mv.setViewName("updatePet");
		return mv;
	}
	
	@RequestMapping(path = "updatePet.do", params = "petId", method = RequestMethod.GET)
	public ModelAndView updateHero(@Valid Pet pet, int petId) {
		ModelAndView mv = new ModelAndView();
		Pet updatedPet = pettrDAO.updatePet(pet, petId);
		mv.addObject("pet", updatedPet);
		mv.setViewName("animalProfile");
		return mv;
	}
	
	@RequestMapping(path = "updatePet.do", method = RequestMethod.GET)
	public ModelAndView updatePet(@RequestParam("petId") int petId) {
		ModelAndView mv = new ModelAndView();
		
		Pet pet = pettrDAO.findPet(petId);
		mv.addObject("pet", pet);
		mv.setViewName("animalProfile");
		return mv;
	}
	
	
}
