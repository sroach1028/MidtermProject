  
package com.skilldistillery.petbnb.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.petbnb.data.PettrDAO;
import com.skilldistillery.petbnb.entities.Host;
import com.skilldistillery.petbnb.entities.Pet;
import com.skilldistillery.petbnb.entities.Reservation;
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

	@RequestMapping(path = "goAccountPage.do")
	public ModelAndView goToAccountPage(@RequestParam("userId") int userId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = pettrDAO.refreshUser(userId);
		Host host = pettrDAO.refreshHost(userId);
		session.removeAttribute("sessionUser");
		session.setAttribute("sessionUser", user);
		if(host != null) {
		session.removeAttribute("sessionHost");
		session.setAttribute("sessionHost", host);
		}
		mv.setViewName("userProfile");
		return mv;
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
	public ModelAndView goToUpdatePet(@Valid Pet pet, int petId) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("oldPet", pettrDAO.findPet(petId));
		mv.setViewName("updatePet");
		return mv;
	}

	@RequestMapping(path = "updatePet.do", params = "petId", method = RequestMethod.GET)
	public ModelAndView updatePet(@Valid Pet pet, int petId) {
		ModelAndView mv = new ModelAndView();
		Pet updatedPet = pettrDAO.updatePet(pet, petId);
		mv.addObject("pet", updatedPet);
		mv.setViewName("animalProfile");
		return mv;
	}

	@RequestMapping(path = "goToAddPet.do")
	public ModelAndView goToAdd() {
		ModelAndView mv = new ModelAndView();
		Pet pet = new Pet();
		mv.addObject("pet", pet);
		mv.setViewName("addPet");
		return mv;
	}

	@RequestMapping(path = "addPet.do", method = RequestMethod.POST)
	public ModelAndView newPet(@Valid Pet pet, @RequestParam("userId") int userId) {
		ModelAndView mv = new ModelAndView();
		Pet addPet = pettrDAO.addPet(pet, userId);
		mv.addObject("pet", addPet);
		mv.setViewName("animalProfile");
		return mv;
	}

	@RequestMapping(path = "removePet.do", method = RequestMethod.GET)
	public ModelAndView removePet(@RequestParam("petId") int petId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = pettrDAO.removePetById(petId);
		session.removeAttribute("sessionUser");
		session.setAttribute("sessionUser", user);
		mv.setViewName("userProfile");
		return mv;
	}
	
	@RequestMapping(path = "searchHost.do")
	public ModelAndView searchHost(@RequestParam("city") String city, @RequestParam("state") String state) {
		ModelAndView mv = new ModelAndView();
		List<Host> hosts = pettrDAO.searchHostByLocation(city, state);
		mv.addObject("hosts", hosts);
		mv.setViewName("searchResults");
		return mv;
	}
	
	@RequestMapping(path="becomeHost.do", method = RequestMethod.GET)
	public ModelAndView becomeHost(@RequestParam("id") int id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Host host = pettrDAO.becomeHost(id);
		mv.addObject("allServices", pettrDAO.getAllServices());
		mv.setViewName("becomeHost");
		session.setAttribute("sessionHost", host);
		return mv;
	}
	@RequestMapping(path="goToUpdateSettings.do", method = RequestMethod.GET)
	public ModelAndView goToUpdateSettings(@RequestParam("hostId") int hostId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("allServices", pettrDAO.getAllServices());
		mv.setViewName("becomeHost");
		return mv;
	}
	@RequestMapping(path="updateHost.do", method = RequestMethod.GET)
	public ModelAndView updateHost(@RequestParam("selections") int[] selections, @RequestParam("hostId") int hostId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Host host = pettrDAO.addServicestoHostById(selections, hostId);
		session.removeAttribute("sessionHost");
		session.setAttribute("sessionHost", host);
		mv.setViewName("userProfile");
		return mv;
	}
	
	@RequestMapping(path = "findReservationById.do", method = RequestMethod.GET)
	public ModelAndView getReservation(@RequestParam("rid") int rid) {
		ModelAndView mv = new ModelAndView();
		Reservation reservation = pettrDAO.findReservationById(rid);
		mv.addObject("reservation", reservation);
		mv.setViewName("viewReservation");
		return mv;
	}
	

}
