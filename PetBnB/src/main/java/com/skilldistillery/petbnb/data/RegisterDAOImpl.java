package com.skilldistillery.petbnb.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.petbnb.entities.Address;
import com.skilldistillery.petbnb.entities.User;

@Transactional
@Service
public class RegisterDAOImpl implements RegisterDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User registerUser(User user) {

		Address address = new Address(user.getAddress().getStreet(), user.getAddress().getCity(),
				user.getAddress().getState(), user.getAddress().getZip(), user.getAddress().getPhone());
		
		em.persist(address);
		em.flush();
		
		user.setAddress(address);
		
		em.persist(user);
		em.flush();

		return user;

	}

}
