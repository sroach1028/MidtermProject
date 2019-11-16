package com.skilldistillery.petbnb.data;

import javax.validation.Valid;

import com.skilldistillery.petbnb.entities.User;

public interface RegisterDAO {

	User registerUser(@Valid User user);

}
