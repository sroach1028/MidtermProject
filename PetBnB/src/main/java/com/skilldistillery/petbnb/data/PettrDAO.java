package com.skilldistillery.petbnb.data;

import java.time.LocalDate;
import java.util.List;

import javax.validation.Valid;

import com.skilldistillery.petbnb.entities.Host;
import com.skilldistillery.petbnb.entities.HostImage;
import com.skilldistillery.petbnb.entities.HostService;
import com.skilldistillery.petbnb.entities.Pet;
import com.skilldistillery.petbnb.entities.Reservation;
import com.skilldistillery.petbnb.entities.ReviewOfHost;
import com.skilldistillery.petbnb.entities.ReviewOfPet;
import com.skilldistillery.petbnb.entities.User;

public interface PettrDAO {

	User findUserById(int userId);

	List<Pet> findAllPets();

	Pet findPet(int petId);

	Pet updatePet(Pet pet, int petId);

	Pet addPet(Pet addpet, int userId);

	User removePetById(int id);

	User refreshUser(int userId);

	List<Host> searchHostByLocation(String city, String state);

	List<Host> searchHostByService(int serviceId);

	Host becomeHost(int id);

//	Host updateHost(Host host, int hostId);

	Host refreshHost(int userId);

	Host addServicestoHostById(int[] selections, int hostId);

	Host findHostById(int hostId);

	double findHostAvgRatingById(int hostId);

	double findPetAvgRatingById(int petId);

	List<HostService> getAllServices();

	public Host getHostById(int hostId);

	Reservation findReservationById(int rid);

	Pet addPetImage(int petId, String url);

	Reservation createReservation(int petId, int hostId, int serviceId, LocalDate openDate, LocalDate closeDate);

	Object getAverageOfHostReviewRatings(Host host);

	Object getAverageOfPetReviewRatings(Pet pet);

	void addDescriptiontoHostById(String description, int hostId);

	void addImagetoHostById(String imageURL, int hostId);
	ReviewOfHost writeHostReview(int hostId, int reservationId);

	ReviewOfPet writePetReview(ReviewOfPet review, int petId, int reservationId);

	ReviewOfPet writePetReview(@Valid ReviewOfPet review, int petId, int reservationId, int hostId);

	Host updateHost(@Valid Host host, int hostId);

	HostImage getHostImageById(int hostImageId);
	ReviewOfPet writePetReview(@Valid ReviewOfPet review);

	Host updateDescriptiontoHostById(String description, int hostId);

	Host updateServicestoHostById(int[] selections, int hostId);
}