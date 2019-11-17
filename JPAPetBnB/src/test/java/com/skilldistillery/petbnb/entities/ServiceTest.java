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
	private HostService hostService;
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
		hostService = em.find(HostService.class, 1);
		newHost = new Host();
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		hostService = null;
	}

	@Test
	@DisplayName("simple not null service test")
	void test1() {
		assertNotNull(hostService);
	}
	
	@Test
	@DisplayName("test service entity mapping")
	void test2() {
		String name = hostService.getName();
		assertNotNull("Grooming", name);
	}
	
	@Test
	@DisplayName ("Testing service add host")
	void test3() {
		assertEquals(2, hostService.getHosts().size());
		hostService.addHost(newHost);
		assertEquals(3, hostService.getHosts().size());
		hostService.removeHost(newHost);
		assertEquals(2, hostService.getHosts().size());
	}
}
