package com.skilldistillery.petbnb.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Host {
	
//	F I E L D S

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToOne
	@JoinColumn(name = "client_id")
	private Client client;
	
	@Column(name="home_features")
	private String homeFeatures;
	
	@OneToMany(mappedBy = "host")
	private List<Reservation> reservations;
	
	@OneToMany(mappedBy = "host")
	private List<ReviewOfHost> reviews;
	
	@ManyToMany
	@JoinTable(name = "host_service", joinColumns = @JoinColumn(name = "host_id"), inverseJoinColumns = @JoinColumn(name = "service_id"))
	private List<Service> services;
	

//	C O N S T R U C T O R 
	
public Host() {
	super();
}
	
	
	

}
