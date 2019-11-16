package com.skilldistillery.petbnb.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.petbnb.entities.User;

@Transactional
@Service
public class LoginDAOImpl implements LoginDAO{
	@PersistenceContext
	private EntityManager em;

	@Override
	public User verifyLogin(String username, String password) {
		String query = "Select user from User user where user.username = :username and user.password = :password";
		List<User> user = em.createQuery(query, User.class).setParameter("username", username).setParameter("password", password).getResultList(); 
		if (! user.isEmpty()) {
			return user.get(0);
		}
		return null;
	}

}
