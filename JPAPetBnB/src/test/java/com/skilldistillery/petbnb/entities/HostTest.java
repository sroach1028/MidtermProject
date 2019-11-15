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
	@DisplayName("Host relationship with Host_Services")
	void test4() {
		assertEquals(2, em.find(Host.class, 1).getReviews().get(0).getRating());
	}
}
