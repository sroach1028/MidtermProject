package com.skilldistillery.petbnb.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class Service {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private double rate;

	@ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinTable(name = "host_service", joinColumns = @JoinColumn(name = "service_id"), inverseJoinColumns = @JoinColumn(name = "host_id"))
	private List<Host> hosts;
}
