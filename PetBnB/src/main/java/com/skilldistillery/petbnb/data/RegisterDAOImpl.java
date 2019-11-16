package com.skilldistillery.petbnb.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.petbnb.entities.Address;
import com.skilldistillery.petbnb.entities.User;
import com.skilldistillery.petbnb.entities.UserAddressDTO;

@Transactional
@Service
public class RegisterDAOImpl implements RegisterDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User registerUser(UserAddressDTO user) {

		User newUser = new User(user.getFirstName(), user.getLastName(), user.getUsername(), user.getPassword(),
				user.getEmail());

		Address address = new Address(user.getStreet(), user.getCity(),
				user.getState(), user.getZip(), user.getPhone());
		
		em.persist(address);
		em.flush();
		
		newUser.setAddress(address);
		
		em.persist(newUser);
		em.flush();

		return newUser;

	}

}
