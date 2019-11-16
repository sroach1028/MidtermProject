package com.skilldistillery.petbnb.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class UserTest {
	
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private User user;
	private Pet newPet;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("PetBnBPU");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		user = em.find(User.class, 1);
		newPet = new Pet();
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	@DisplayName("user entity test case")
	void test1() {
		System.out.println(user.getPets().get(0).getReviewsOfPet().get(0));
		assertNotNull(user);
		assertEquals("jclient", user.getUsername());
	}
	
	@Test
	@DisplayName ("Testing User add Pet")
	void testUserAddPet() {
	assertEquals(1, user.getPets().size());
	user.addPet(newPet);
	assertEquals(2, user.getPets().size());
	user.removePet(newPet);
	assertEquals(1, user.getPets().size());
	}
}
