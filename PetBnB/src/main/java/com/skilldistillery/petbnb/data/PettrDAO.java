package com.skilldistillery.petbnb.data;

import java.util.List;

import com.skilldistillery.petbnb.entities.Host;
import com.skilldistillery.petbnb.entities.Pet;
import com.skilldistillery.petbnb.entities.User;

public interface PettrDAO {

	User findUserById(int userId);

	List<Pet> findAllPets();

	Pet findPet(int petId);

	Pet updatePet(Pet pet, int petId);
	
	Pet addPet(Pet addpet, int userId);
	
	User removePetById(int id);

	User refreshUser(int userId);
	
	List<Host> searchHostByLocation (String city, String state);

	Host becomeHost(int id);

	Host updateHost(Host host, int hostId);

	Host refreshHost(int userId);

	Host addServicestoHostById(int[] selections, int hostId);
}
