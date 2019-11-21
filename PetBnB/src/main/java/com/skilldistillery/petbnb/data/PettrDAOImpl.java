
package com.skilldistillery.petbnb.data;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.stereotype.Service;

import com.skilldistillery.petbnb.entities.Host;
import com.skilldistillery.petbnb.entities.HostImage;
import com.skilldistillery.petbnb.entities.HostService;
import com.skilldistillery.petbnb.entities.Pet;
import com.skilldistillery.petbnb.entities.PetImage;
import com.skilldistillery.petbnb.entities.Reservation;
import com.skilldistillery.petbnb.entities.ReviewOfHost;
import com.skilldistillery.petbnb.entities.ReviewOfPet;
import com.skilldistillery.petbnb.entities.User;

@Transactional
@Service
public class PettrDAOImpl implements PettrDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User findUserById(int userId) {
		return em.find(User.class, userId);
	}

	@Override
	public Host findHostById(int hostId) {
		return em.find(Host.class, hostId);
	}

	@Override
	public HostImage getHostImageById(int hostImageId) {
		return em.find(HostImage.class, hostImageId);
	}
	
	@Override
	public List<Pet> findAllPets() {

		String queryString = "SELECT p FROM Pet p ORDER BY p.name";
		List<Pet> results = em.createQuery(queryString, Pet.class).getResultList();

		for (Pet element : results) {
			System.out.println(element.getName());
		}

		return results;
	}

	@Override
	public Pet findPet(int petId) {

		Pet pet = em.find(Pet.class, petId);

		return pet;
	}

	@Override
	public Pet updatePet(Pet pet, int petId) {
		Pet updatedPet = em.find(Pet.class, petId);
		updatedPet.setName(pet.getName());
		updatedPet.setBreed(pet.getBreed());
		updatedPet.setSpecialNeeds(pet.getSpecialNeeds());
		updatedPet.setDescription(pet.getDescription());
		updatedPet.setPetImages(pet.getPetImages());

		em.flush();

		return updatedPet;
	}

	@Override
	public User refreshUser(int userId) {
		return em.find(User.class, userId);

	}

	@Override
	public Host refreshHost(int userId) {
		String query = "Select host from Host host where host.user.id = :userId";
		List<Host> hosts = em.createQuery(query, Host.class).setParameter("userId", userId).getResultList();
		if (hosts.size() != 0) {
			return hosts.get(0);
		} else {
			return null;
		}

	}

	@Override
	public Pet addPet(Pet addPet, int userId) {
		addPet.setUser(em.find(User.class, userId));
		addPet.setActive(true);
		em.persist(addPet);
		em.flush();
		return em.find(Pet.class, addPet.getId());
	}

	@Override
	public User removePetById(int id) {
		Pet petRemoved = em.find(Pet.class, id);
		petRemoved.setActive(false);
		em.flush();

		return em.find(User.class, petRemoved.getUser().getId());

	}

	@Override
	public List<Host> searchHostByLocation(String city, String state) {
		String query = "Select host from Host host where host.user.address.city = :city and host.user.address.state = :state";
		List<Host> hosts = em.createQuery(query, Host.class).setParameter("city", city).setParameter("state", state)
				.getResultList();
		return hosts;
	}

	@Override
	public List<Host> searchHostByService(int serviceId) {
		
		String query = "SELECT h FROM Host h JOIN h.services hs WHERE hs.id = :serviceId";
		List<Host> hosts = em.createQuery(query, Host.class).setParameter("serviceId", serviceId).getResultList();
		return hosts;
	}

	@Override
	public Host becomeHost(int id) {
		Host host = new Host();
		host.setUser(em.find(User.class, id));
		em.persist(host);
		em.flush();
		return host;
	}
	
	public Host updateHost(Host host, int hostId) {
		Host updatedHost = em.find(Host.class, hostId);
		
		updatedHost.setDescription(host.getDescription());
		updatedHost.setServices(host.getServices());
		updatedHost.setHostImages(host.getHostImages());

		em.flush();

		return updatedHost;
	}
	
	@Override
	public User editUserProfileById(User updatedUser, int userId) {
		User user = em.find(User.class, userId);
		
		user.setFirstName(updatedUser.getFirstName());
		user.setLastName(updatedUser.getLastName());
		user.setEmail(updatedUser.getEmail());
		user.getAddress().setStreet(updatedUser.getAddress().getStreet());
		user.getAddress().setCity(updatedUser.getAddress().getCity());
		user.getAddress().setState(updatedUser.getAddress().getState());
		user.getAddress().setZip(updatedUser.getAddress().getZip());
		user.getAddress().setPhone(updatedUser.getAddress().getPhone());
		
		
		em.flush();
		
		return user;
	}
	
	

//	@Override
//	public Host updateHost(Host host, int hostId) {
////		System.out.println(host.getDescription());
////		Host updatedHost = em.find(Host.class, hostId);
////		System.out.println(updatedHost.getUser().getFirstName());
//////		for(HostService element : host.getServices()) {
//////			element.setActive(true);
//////		}
////		updatedHost.setServices(host.getServices());
////		System.out.println(host.getServices());
////		updatedHost.setDescription(host.getDescription());
////		System.out.println(updatedHost.getDescription());
////		em.flush();
////		return updatedHost;
//	}

	@Override
	public Host addServicestoHostById(int[] selections, int hostId) {
		Host host = em.find(Host.class, hostId);

//		for (int i = 0; i < host.getServices().size(); i++) {
//			host.removeService(host.getServices().get(i--));
//		}
		for (int i : selections) {
			host.addService(em.find(HostService.class, i));
		}
		em.persist(host);
		em.flush();
		return host;
	}
	
	@Override
	public void addDescriptiontoHostById(String description, int hostId) {
		Host host = em.find(Host.class, hostId);
		host.setDescription(description);
		em.persist(host);
		em.flush();
	}
	
	@Override
	public void addImagetoHostById(String imageURL, int hostId) {
		Host host = em.find(Host.class, hostId);
		HostImage hostImage = new HostImage(imageURL, host);
		em.persist(hostImage);
		em.flush();
		host.addImage(hostImage);
		em.persist(host);
		em.flush();
	}
	
	@Override
	public Host addHostImage(int hostId, String url) {
		Host host = em.find(Host.class,  hostId);
		HostImage image = new HostImage();
		image.setUrl(url);
		image.setHost(host);
		em.persist(image);
		host.addImage(image);
		em.persist(host);
		em.flush();
		return host;
	}
	
	@Override
	public Host updateDescriptiontoHostById(String description, int hostId) {
		Host host = em.find(Host.class, hostId);
		host.setDescription(description);
		em.flush();
		return host;
	}
	
	@Override
	public Host updateServicestoHostById(int[] selections, int hostId) {
		Host host = em.find(Host.class, hostId);

		for (int i = 0; i < host.getServices().size(); i++) {
			host.removeService(host.getServices().get(i--));
		}
		for (int i : selections) {
			host.addService(em.find(HostService.class, i));
		}
		em.flush();
	return host;
	}
	
	@Override
	public double findHostAvgRatingById(int hostId) {
//		String query = "SELECT AVG(f.rentalRate) FROM Film f WHERE f.id < 10";
//		double average = em.createQuery(query, Double.class).getSingleResult();
		Host host = em.find(Host.class, hostId);
		double average = (host.getReviewsOfHost().get(hostId).getRating() / host.getReviewsOfHost().size());
		return average;
	}

	@Override
	public double findPetAvgRatingById(int petId) {
		Pet pet = em.find(Pet.class, petId);
		double average = (pet.getReviewsOfPet().get(petId).getRating() / pet.getReviewsOfPet().size());
		return average;
	}

	@Override
	public List<HostService> getAllServices() {
		String query = "Select service from HostService service";
		List<HostService> services = em.createQuery(query, HostService.class).getResultList();
		return services;
	}

	@Override
	public Object getAverageOfHostReviewRatings(Host host) {
		List<ReviewOfHost> reviewsOfHost = host.getReviewsOfHost();
		int currentSum = 0;
		int average = 0;
		for (int i = 0; i < reviewsOfHost.size(); i++) {
			currentSum += reviewsOfHost.get(i).getRating();
		}
		average = currentSum / reviewsOfHost.size();
		return average;
	}

	@Override
	public Object getAverageOfPetReviewRatings(Pet pet) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Host getHostById(int hostId) {
		Host host = em.find(Host.class, hostId);
		return host;
	}

	public Reservation findReservationById(int id) {
		return em.find(Reservation.class, id);
	}

	@Override
	public Pet addPetImage(int petId, String url) {
		Pet pet = em.find(Pet.class, petId);
		PetImage image = new PetImage();
		image.setUrl(url);
		image.setPet(pet);
		em.persist(image);
		pet.addPetImage(image);
		em.persist(pet);
		em.flush();
		return pet;
	}

	@Override
	public Reservation createReservation(int petId, int hostId, int serviceId, LocalDate openDate,
			LocalDate closeDate) {
		Pet pet = em.find(Pet.class, petId);
		Host host = em.find(Host.class, hostId);
		Reservation reservation = new Reservation();
		reservation.setPet(pet);
		reservation.setHost(host);

		reservation.setOpenDate(openDate);
		reservation.setCloseDate(closeDate);
		em.persist(reservation);
		em.flush();
		return reservation;
	}
	


	@Override
	public ReviewOfPet writePetReview(@Valid ReviewOfPet review) {
		Reservation r = em.find(Reservation.class, review.getReservation().getId());
		review.setReservation(r);
		em.persist(review);
		em.flush();
		return review;
	}

	@Override
	public ReviewOfHost writeHostReview(@Valid ReviewOfHost review) {
		Reservation reservation = em.find(Reservation.class, review.getReservation().getId());
		review.setReservation(reservation);
		em.persist(review);
		em.flush();
		return review;
	}

}
