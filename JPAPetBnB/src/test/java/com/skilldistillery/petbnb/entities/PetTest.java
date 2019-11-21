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
	private Reservation newReservation;
	private ReviewOfPet newReviewOfPet;

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
		newReservation = new Reservation();
		newReviewOfPet = new ReviewOfPet();
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
		assertEquals("Cat", em.find(Pet.class, 1).getPetType().getType());
	}
	
	@Test
	@DisplayName("Pet relationship with Reservation")
	void test4() {
		assertEquals("Rhonda", em.find(Pet.class, 1).getReservations().get(0).getHost().getUser().getFirstName());
	}
	
	@Test
	@DisplayName("Pet relationship with User")
	void test5() {
		assertEquals("Jonny", em.find(Pet.class, 1).getUser().getFirstName());
	}

	@Test
	@DisplayName("Pet relationship with Reservation2")
	void test6() {
		assertEquals(12, em.find(Pet.class, 1).getReservations().get(0).getId());
	}

	@Test
	@DisplayName("Host relationship with Review_Of_Host")
	void test7() {
		assertNotNull(pet);
		assertTrue(pet.getReviewsOfPet().size() > 0);
	}
	
	@Test
	@DisplayName ("Testing pet add reservation")
	void test8() {
		assertEquals(3, pet.getReservations().size());
		pet.addReservation(newReservation);
		assertEquals(4, pet.getReservations().size());
		pet.removeReservation(newReservation);
		assertEquals(3, pet.getReservations().size());
	}
	
	@Test
	@DisplayName ("Testing pet add review")
	void test9() {
		assertEquals(2, pet.getReviewsOfPet().size());
		pet.addReviewOfPet(newReviewOfPet);
		assertEquals(3, pet.getReviewsOfPet().size());
		pet.removeReviewOfPet(newReviewOfPet);
		assertEquals(2, pet.getReviewsOfPet().size());
	}
}
