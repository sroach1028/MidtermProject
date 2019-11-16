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

class ServiceTest {

	private static EntityManagerFactory emf;
	private static EntityManager em;
	private Service service;
	private Host newHost;
	

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
		service = em.find(Service.class, 1);
		newHost = new Host();
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		service = null;
	}

	@Test
	@DisplayName("simple not null service test")
	void test1() {
		assertNotNull(service);
	}
	
	@Test
	@DisplayName("test service entity mapping")
	void test2() {
		String name = service.getName();
		assertNotNull("Grooming", name);
	}
	
	@Test
	@DisplayName ("Testing service add host")
	void test3() {
		assertEquals(2, service.getHosts().size());
		service.addHost(newHost);
		assertEquals(3, service.getHosts().size());
		service.removeHost(newHost);
		assertEquals(2, service.getHosts().size());
	}
}
