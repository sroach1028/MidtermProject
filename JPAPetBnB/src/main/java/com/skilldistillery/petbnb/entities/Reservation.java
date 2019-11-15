package com.skilldistillery.petbnb.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Reservation {
	
//	F I E L D S
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="host_id")
	private int hostId;
	
	@Column(name="client_id")
	private int clientId;
	
	@Column(name="pet_id")
	private int petId;
	
	@Column(name="open_date")
	private Date openDate;
	
	@Column(name="close_date")
	private Date closeDate;
	
	private int rating;
	
	@ManyToOne
	@JoinColumn(name = "client_id")
	private Client client;
	
	@ManyToOne
	@JoinColumn(name = "host_id")
	private Host host;
	
	@ManyToOne
	@JoinColumn(name = "pet_id")
	private Pet pet;
	

}
