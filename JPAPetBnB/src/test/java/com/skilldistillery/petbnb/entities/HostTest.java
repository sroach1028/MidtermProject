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

class HostTest {

	private static EntityManagerFactory emf;
	private static EntityManager em;
	private Host host;
	private Reservation newReservation;
	private ReviewOfHost newReviewOfHost;
	private Service newService;

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
		host = em.find(Host.class, 1);
		newReservation = new Reservation();
		newReviewOfHost = new ReviewOfHost();
		newService = new Service();
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		host = null;
	}

	@Test
	@DisplayName("test host entity mapping")
	void test1() {
		String string = host.getDescription();
		assertEquals("Fenced yard", string);
	}
	
	@Test
	@DisplayName("test host service association")
	void test2() {
		String string = host.getServices().get(0).getName();
		assertEquals("Grooming", string);
	}
	@Test
	@DisplayName("Host relationship with Host_Services")
	void test3() {
		assertEquals("Grooming", em.find(Host.class, 1).getServices().get(0).getName());
	}
	
	@Test
	@DisplayName("Host relationship with Review_Of_Host")
	void test4() {
		assertNotNull(host);
		assertTrue(host.getReviewsOfHost().size() > 0);
		assertEquals(1, host.getReviewsOfHost().get(0).getRating());
	}
	
	@Test
	@DisplayName ("Testing Host add reservation")
	void test5() {
		assertEquals(2, host.getReservations().size());
		host.addReservation(newReservation);
		assertEquals(3, host.getReservations().size());
		host.removeReservation(newReservation);
		assertEquals(2, host.getReservations().size());
	}
	
	@Test
	@DisplayName ("Testing Host add review of host")
	void test6() {
		assertEquals(1, host.getReviewsOfHost().size());
		host.addReviewOfHost(newReviewOfHost);
		assertEquals(2, host.getReviewsOfHost().size());
		host.removeReviewOfHost(newReviewOfHost);
		assertEquals(1, host.getReviewsOfHost().size());
	}
	
	@Test
	@DisplayName ("Testing Host add service")
	void test7() {
		assertEquals(5, host.getServices().size());
		host.addService(newService);
		assertEquals(6, host.getServices().size());
		host.removeService(newService);
		assertEquals(5, host.getServices().size());
	}
}
