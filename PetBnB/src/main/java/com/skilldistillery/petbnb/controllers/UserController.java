
package com.skilldistillery.petbnb.controllers;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.petbnb.data.PettrDAO;
import com.skilldistillery.petbnb.entities.Host;
import com.skilldistillery.petbnb.entities.Pet;
import com.skilldistillery.petbnb.entities.Reservation;
import com.skilldistillery.petbnb.entities.ReviewOfHost;
import com.skilldistillery.petbnb.entities.ReviewOfPet;
import com.skilldistillery.petbnb.entities.User;

@Controller
public class UserController {

	@Autowired
	private PettrDAO pettrDAO;

	@RequestMapping(path = {"/", "home.do"})
	public String home() {
		return "home";
	}

	@RequestMapping(path = "coming.do")
	public String comingSoon() {
		return "comingSoon";
	}

	@RequestMapping(path = "goAccountPage.do")
	public ModelAndView goToAccountPage(@RequestParam("id") int userId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = pettrDAO.refreshUser(userId);
		Host host = pettrDAO.refreshHost(userId);
		session.removeAttribute("sessionUser");
		session.setAttribute("sessionUser", user);
		if (host != null) {
			session.removeAttribute("sessionHost");
			session.setAttribute("sessionHost", host);
		}
		mv.setViewName("account");
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

	@RequestMapping(path = "toUserProfile.do", method = RequestMethod.GET)
	public ModelAndView toUserProfile(@RequestParam("id") int userId) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", pettrDAO.findUserById(userId));
		mv.setViewName("userProfile");
		return mv;
	}

	@RequestMapping(path = "toPetProfile.do", method = RequestMethod.GET)
	public ModelAndView toPetProfile(@RequestParam("petId") int petId) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("pet", pettrDAO.findPet(petId));
		mv.setViewName("animalProfile");
		return mv;
	}
	
	@RequestMapping(path = "toPetReservations.do", method = RequestMethod.GET)
	public ModelAndView toPetReservations(@RequestParam("id") int userId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = pettrDAO.findUserById(userId);
		session.removeAttribute("sessionUser");
		session.setAttribute("sessionUser", user);
		mv.setViewName("myPetsReservations");
		return mv;
	}

	@RequestMapping(path = "toPetProfileRedir.do", method = RequestMethod.GET)
	public String toPetProfileRedir() {
		return "animalProfile";
	}
	
	@RequestMapping(path = "toHostPageRedir.do", method = RequestMethod.GET)
	public String toHostPageRedir() {
		return "hostPage";
	}

//	@RequestMapping(path = "getAllPets.do", method = RequestMethod.GET)
//	public ModelAndView getAllPets() {
//		ModelAndView mv = new ModelAndView();
//
//		List<Pet> pets = pettrDAO.findAllPets();
//		mv.addObject("pets", pets);
//		mv.setViewName("animalProfile");
//		return mv;
//	}

	@RequestMapping(path = "getPet.do", method = RequestMethod.GET)
	public ModelAndView getPet(@RequestParam("petId") int petId) {
		ModelAndView mv = new ModelAndView();

		Pet pet = pettrDAO.findPet(petId);
		int listSize = pet.getReviewsOfPet().size();
		mv.addObject("listSize", listSize);
		if (!pet.getReviewsOfPet().isEmpty()) {
			mv.addObject("reviewAverage", pettrDAO.getAverageOfPetReviewRatings(pet));
		}
		mv.addObject("pet", pet);
		mv.setViewName("animalProfile");
		return mv;
	}

	@RequestMapping(path = "goToUpdatePet.do", method = RequestMethod.GET)
	public ModelAndView goToUpdatePet(@RequestParam("petId") int petId) {
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

	@RequestMapping(path = "addPet.do", method = RequestMethod.GET)
	public ModelAndView newPet(@Valid Pet pet, @RequestParam("userId") int userId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Pet addPet = pettrDAO.addPet(pet, userId);
		mv.addObject("pet", addPet);
		User user = pettrDAO.findUserById(userId);
		session.removeAttribute("sessionUser");
		user.getPets().add(addPet);
		session.setAttribute("sessionUser", user);

		mv.setViewName("animalProfile");
		return mv;
	}

	@RequestMapping(path = "removePet.do", method = RequestMethod.GET)
	public ModelAndView removePet(@RequestParam("petId") int petId, @RequestParam("userId") int userId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = pettrDAO.removePetById(petId);
		session.removeAttribute("sessionUser");
		session.setAttribute("sessionUser", user);
		mv.addObject("user", user);
		mv.setViewName("userProfile");
		return mv;
	}

	@RequestMapping(path = "addPetImage.do", method = RequestMethod.GET)
	public String addPetImage(@RequestParam("petId") int petId,
			@RequestParam("url") String url, HttpSession session) {
//		ModelAndView mv = new ModelAndView();
		Pet pet = pettrDAO.addPetImage(petId, url);
		session.setAttribute("pet", pet);
//		mv.addObject("pet", pet);
//		mv.setViewName("animalProfile");
		return "redirect:/toPetProfileRedir.do";
	}

	@RequestMapping(path = "searchHost.do")
	public ModelAndView searchHost(@RequestParam("city") String city, @RequestParam("state") String state) {
		ModelAndView mv = new ModelAndView();
		List<Host> hosts = pettrDAO.searchHostByLocation(city, state);
		mv.addObject("hosts", hosts);
		mv.setViewName("searchResults");
		return mv;
	}

	@RequestMapping(path = "searchService.do")
	public ModelAndView searchHost(@RequestParam("serviceId") int serviceId) {
		ModelAndView mv = new ModelAndView();
		List<Host> hosts = pettrDAO.searchHostByService(serviceId);
		mv.addObject("hosts", hosts);
		mv.setViewName("searchResults");
		return mv;
	}

	@RequestMapping(path = "goToCreateHost.do", method = RequestMethod.GET)
	public ModelAndView goToCreateHost(@RequestParam("id") int id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
//		Host host = pettrDAO.becomeHost(id);
		mv.addObject("allServices", pettrDAO.getAllServices());
		mv.setViewName("becomeHost");
//		session.setAttribute("sessionHost", host);
		return mv;
	}

	@RequestMapping(path = "createHost.do", method = RequestMethod.GET)
	public ModelAndView createHost( @RequestParam("selections") int[] selections, @RequestParam("description") String description,
			@RequestParam("userId") int userId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Host host = pettrDAO.becomeHost(userId);
		pettrDAO.addDescriptiontoHostById(description, host.getId());
		host = pettrDAO.addServicestoHostById(selections, host.getId());
		session.setAttribute("sessionHost", host);
		mv.addObject("host", host);
		mv.setViewName("hostPage");
		return mv;
	}

	@RequestMapping(path = "goToUpdateHost.do", params = "hostId", method = RequestMethod.GET)
	public ModelAndView goToUpdateHost(@RequestParam("hostId") int hostId) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("host", new Host());
		mv.addObject("allServices", pettrDAO.getAllServices());
		mv.addObject("oldHost", pettrDAO.getHostById(hostId));
		mv.setViewName("updateHost");
		return mv;
	}

	@RequestMapping(path = "updateHost.do", params = "hostId", method = RequestMethod.GET)
	public ModelAndView updateHost(@RequestParam("description") String description,
			@RequestParam("selections") int[] selections, @RequestParam("hostId") int hostId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		pettrDAO.updateDescriptiontoHostById(description, hostId);
		Host host = pettrDAO.updateServicestoHostById(selections, hostId);
		session.removeAttribute("sessionHost");
		session.setAttribute("sessionHost", host);
		mv.addObject("host", host);
		mv.setViewName("hostPage");
		return mv;
	}
	
	@RequestMapping(path = "toEditUserProfile.do", method = RequestMethod.GET)
	public ModelAndView toEditUserProfile(@RequestParam("id") int userId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
//		mv.addObject("user", new User());
		mv.addObject("oldUser", pettrDAO.findUserById(userId));
		mv.setViewName("editUserProfile");
		return mv;
	}
	
	@RequestMapping(path = "editUserProfile.do", method = RequestMethod.GET)
	public ModelAndView editUserProfile(@Valid User updatedUser, @RequestParam("id") int userId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = pettrDAO.editUserProfileById(updatedUser, userId);
		session.removeAttribute("sessionUser");
		session.setAttribute("sessionUser", user);
		mv.setViewName("userProfile");
		return mv;
	}

	@RequestMapping(path = "addHostImage.do", method = RequestMethod.GET)
	public String addHostImage(@RequestParam("hostId") int hostId, @RequestParam("url") String url,
			HttpSession session) {
//		ModelAndView mv = new ModelAndView();
		Host host = pettrDAO.addHostImage(hostId, url);
		session.setAttribute("host", host);
//		mv.addObject("host", host);
//		mv.setViewName("hostPage");
		return "redirect:/toHostPageRedir.do";
	}
	
//	@RequestMapping(path = "addPetImage.do", method = RequestMethod.GET)
//	public String addPetImage(@RequestParam("petId") int petId,
//			@RequestParam("url") String url, HttpSession session) {
////		ModelAndView mv = new ModelAndView();
//		Pet pet = pettrDAO.addPetImage(petId, url);
//		session.setAttribute("pet", pet);
////		mv.addObject("pet", pet);
////		mv.setViewName("animalProfile");
//		return "redirect:/toPetProfileRedir.do";
//	}

//	@RequestMapping(path = "removeHostImage.do", params = "hostId", method = RequestMethod.GET)
//	public ModelAndView removeHostImage(@RequestParam("imageId") int imageId, @RequestParam("hostId") int hostId) {
//		ModelAndView mv = new ModelAndView();
//		HostImage hostImage = pettrDAO.getHostImageById(imageId);
//		
//		Host updatedHost = pettrDAO.updateHost(host, hostId);
//		updatedHost.removeImage(hostImage);
//
//		mv.addObject("host", updatedHost);
//		mv.setViewName("hostPage");
//		return mv;
//	}

	@RequestMapping(path = "goToHostPage.do", method = RequestMethod.GET)
	public ModelAndView goToHostPage(@RequestParam("hostId") int hostId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Host host = pettrDAO.getHostById(hostId);
		int listSize = host.getReviewsOfHost().size();
		mv.addObject("listSize", listSize);
		if (!host.getReviewsOfHost().isEmpty()) {
			mv.addObject("reviewAverage", pettrDAO.getAverageOfHostReviewRatings(host));
		}
		mv.addObject("host", host);
		mv.setViewName("hostPage");
		return mv;
	}

	@RequestMapping(path = "findReservationById.do", method = RequestMethod.GET)
	public ModelAndView getReservation(@RequestParam("rid") int rid) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("reservation", pettrDAO.findReservationById(rid));
		mv.setViewName("viewReservation");
		return mv;
	}

	@RequestMapping(path = "goToReservation.do")
	public ModelAndView goToAddReservation(@RequestParam("hostId") int hostId,
			@RequestParam("serviceId") int serviceId) {
		ModelAndView mv = new ModelAndView();
		Reservation reservation = new Reservation();
		mv.addObject("reservation", reservation);
		mv.addObject("hostId", hostId);
		mv.addObject("serviceId", serviceId);
		mv.setViewName("makeReservation");
		return mv;
	}

	@RequestMapping(path = "createReservation.do")
	public ModelAndView createReservation(@RequestParam("petId") int petId, @RequestParam("hostId") int hostId,
			@RequestParam("serviceId") int serviceId,
			@RequestParam("openDate") @DateTimeFormat(iso = ISO.DATE) LocalDate openDate,
			@RequestParam("closeDate") @DateTimeFormat(iso = ISO.DATE) LocalDate closeDate) {
		ModelAndView mv = new ModelAndView();
		System.out.println(petId);
		Reservation reservation = pettrDAO.createReservation(petId, hostId, serviceId, openDate, closeDate);
		mv.addObject("reservation", reservation);
		mv.setViewName("viewReservation");
		return mv;
	}

	@RequestMapping(path = "reservationHistory.do")
	public ModelAndView toReservationHistory(@RequestParam("petId") int petId) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("pet", pettrDAO.findPet(petId));
		mv.setViewName("reservationHistory");
		return mv;
	}

	@RequestMapping(path = "hostReservationHistory.do")
	public ModelAndView hostReservationHistory(@RequestParam("hostId") int hostId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Host host = pettrDAO.findHostById(hostId);
		session.removeAttribute("sessionHost");
		session.setAttribute("sessionHost", host);
		mv.addObject("host", host);
		mv.setViewName("hostResHistory");
		return mv;
	}

	@RequestMapping(path = "goToCreatePetReview.do")
	public ModelAndView goToCreatePetReview(@RequestParam("petId") int petId,
			@RequestParam("reservationId") int reservationId, @RequestParam("hostId") int hostId) {
		ModelAndView mv = new ModelAndView();
		ReviewOfPet review = new ReviewOfPet();
		mv.addObject("petId", petId);
		mv.addObject("hostId", hostId);
		mv.addObject("reservationId", reservationId);
		mv.addObject("petReview", review);
		mv.setViewName("writePetReview");
		return mv;
	}

	@RequestMapping(path = "createPetReview.do")
	public ModelAndView createPetReview(@Valid ReviewOfPet review, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		ReviewOfPet petReview = pettrDAO.writePetReview(review);
		Host host = (Host) session.getAttribute("sessionHost");
		Host h = pettrDAO.findHostById(host.getId());
		session.removeAttribute("sessionHost");
		session.setAttribute("sessionHost", host);
		mv.addObject("petReview", petReview);
		mv.setViewName("home");
		return mv;
	}

	@RequestMapping(path = "goToCreateHostReview.do")
	public ModelAndView goToCreateHostReview(@RequestParam("petId") int petId,
			@RequestParam("reservationId") int reservationId, @RequestParam("hostId") int hostId) {
		ModelAndView mv = new ModelAndView();
		ReviewOfHost review = new ReviewOfHost();
		mv.addObject("petId", petId);
		mv.addObject("hostId", hostId);
		mv.addObject("reservationId", reservationId);
		mv.addObject("hostReview", review);
		mv.setViewName("writeHostReview");
		return mv;
	}

	@RequestMapping(path = "createHostReview.do")
	public ModelAndView createHostReview(@Valid ReviewOfHost review, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		System.out.println("UserController.createHostReview(): " + review);
		ReviewOfHost hostReview = pettrDAO.writeHostReview(review);
		User user = (User) session.getAttribute("sessionUser");
		User u = pettrDAO.findUserById(user.getId());
		session.removeAttribute("sessionUser");
		session.setAttribute("sessionUser", u);
		mv.addObject("hostReview", hostReview);
		mv.setViewName("home");
		return mv;
	}

}
