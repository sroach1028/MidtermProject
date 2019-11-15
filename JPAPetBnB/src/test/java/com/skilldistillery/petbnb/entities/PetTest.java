package com.skilldistillery.petbnb.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class PetTest {

	private static EntityManagerFactory emf;
	private static EntityManager em;
	private Pet pet;

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
		pet = em.find(Pet.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		pet = null;
	}

	@Test
	@DisplayName("very simple test case")
	void test1() {
		assertNotNull(pet);
	}
	@Test
	@DisplayName("Pet internal test")
	void test2() {
		assertEquals("Kitten", pet.getBreed());
	}
	@Test
	@DisplayName("Pet relationship with PetType")
	void test3() {
		assertEquals("Dog", em.find(Pet.class, 1).getPetType().getType());
	}
	@Test
	@DisplayName("Pet relationship with User")
	void test5() {
		assertEquals("Jonny", em.find(Pet.class, 1).getUser().getFirstName());
	}
	@Test
	@DisplayName("Pet relationship with Reservation")
	void test4() {
		assertEquals("Brad", em.find(Pet.class, 1).getReservations().get(0).getHost().getUser().getFirstName());
	}
	@Test
	@DisplayName("Pet relationship with Reservation2")
	void test6() {
		assertEquals(1, em.find(Pet.class, 1).getReservations().get(0).getId());
	}
	@Test
	@DisplayName("Pet relationship with Review")
	void test7() {
		assertEquals(5, em.find(Pet.class, 1).getReviews().get(0).getRating());
	}

}
