package com.skilldistillery.petbnb.data;

import java.util.List;

import javax.validation.Valid;

import com.skilldistillery.petbnb.entities.Pet;
import com.skilldistillery.petbnb.entities.User;

public interface PettrDAO {

	User findUserById(int userId);

	List<Pet> findAllPets();

	Pet findPet(int petId);

	Pet updatePet(Pet pet, int petId);
	
}
