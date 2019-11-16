package com.skilldistillery.petbnb.data;

import com.skilldistillery.petbnb.entities.User;

public interface LoginDAO {

public User verifyLogin(String username, String password);

}
