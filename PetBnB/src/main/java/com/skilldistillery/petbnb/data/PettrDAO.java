package com.skilldistillery.petbnb.data;

import com.skilldistillery.petbnb.entities.User;

public interface PettrDAO {

	User findUserById(int userId);
	
}
