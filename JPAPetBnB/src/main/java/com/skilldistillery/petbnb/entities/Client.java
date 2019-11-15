package com.skilldistillery.petbnb.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Client {

//	F I E L D S

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;
	
	private String username;

	private String password;

	private String email;

	private boolean active;

	@Column(name = "address_id")
	private int addressId;
	
	@OneToMany(mappedBy = "client")
	private Host host;
	
	@OneToMany(mappedBy = "client")
	private List<Pet> pets;
	
	@OneToMany(mappedBy = "client")
	private List<Reservation> reservations;
	
	@OneToMany(mappedBy = "client")
	private List<ReviewOfClient> reviews;
	

}
