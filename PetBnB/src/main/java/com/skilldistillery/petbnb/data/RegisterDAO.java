package com.skilldistillery.petbnb.data;

import javax.validation.Valid;

import com.skilldistillery.petbnb.entities.User;
import com.skilldistillery.petbnb.entities.UserAddressDTO;

public interface RegisterDAO {

	User registerUser(@Valid UserAddressDTO user);

}
