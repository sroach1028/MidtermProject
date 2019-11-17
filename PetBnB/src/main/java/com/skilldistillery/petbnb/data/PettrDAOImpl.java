package com.skilldistillery.petbnb.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.petbnb.entities.Host;
import com.skilldistillery.petbnb.entities.Pet;
import com.skilldistillery.petbnb.entities.User;

@Transactional
@Service
public class PettrDAOImpl implements PettrDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User findUserById(int userId) {

		System.out.println(userId);
		User user = em.find(User.class, userId);

		return user;

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
		updatedPet.setImage(pet.getImage());

		em.flush();

		return updatedPet;
	}

	@Override
	public User refreshUser(int userId) {
		return em.find(User.class, userId);
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
	List<Host> hosts = em.createQuery(query, Host.class).setParameter("city", city).setParameter("state", state).getResultList();
	return hosts;
	}

}
