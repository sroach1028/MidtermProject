package com.skilldistillery.petbnb.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Pet {

//	F I E L D S

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String type;
	
	private String breed;
	
	@Column(name="special_needs")
	private String specialNeeds;
	
	private String description;
	
	@ManyToOne
	@JoinColumn(name = "client_id")
	private Client client;
	
	@OneToMany(mappedBy = "pet")
	private List<Reservation> reservations;
	
	

//	C O N S T R U C T O R 
	
	public Pet() {
		super();
	}
	
	
	
	

}
