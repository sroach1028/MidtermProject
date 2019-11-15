package com.skilldistillery.petbnb.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="review_of_host")
public class ReviewOfHost {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private int rating;
	
	private String review;

	@ManyToOne
	@JoinColumn(name = "host_id")
	private Host host;
	

}
