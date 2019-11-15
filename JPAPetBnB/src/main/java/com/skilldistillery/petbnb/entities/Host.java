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
	private User client;

	@Column(name = "home_features")
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

	@Override
	public String toString() {
		return "Host [id=" + id + ", client=" + client + "]";
	}

//	M E T H O D S

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getClient() {
		return client;
	}

	public void setClient(User client) {
		this.client = client;
	}

	public String getHomeFeatures() {
		return homeFeatures;
	}

	public void setHomeFeatures(String homeFeatures) {
		this.homeFeatures = homeFeatures;
	}

	public List<Reservation> getReservations() {
		return reservations;
	}

	public void setReservations(List<Reservation> reservations) {
		this.reservations = reservations;
	}

	public List<ReviewOfHost> getReviews() {
		return reviews;
	}

	public void setReviews(List<ReviewOfHost> reviews) {
		this.reviews = reviews;
	}

	public List<Service> getServices() {
		return services;
	}

	public void setServices(List<Service> services) {
		this.services = services;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((client == null) ? 0 : client.hashCode());
		result = prime * result + ((homeFeatures == null) ? 0 : homeFeatures.hashCode());
		result = prime * result + id;
		result = prime * result + ((reservations == null) ? 0 : reservations.hashCode());
		result = prime * result + ((reviews == null) ? 0 : reviews.hashCode());
		result = prime * result + ((services == null) ? 0 : services.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Host other = (Host) obj;
		if (client == null) {
			if (other.client != null)
				return false;
		} else if (!client.equals(other.client))
			return false;
		if (homeFeatures == null) {
			if (other.homeFeatures != null)
				return false;
		} else if (!homeFeatures.equals(other.homeFeatures))
			return false;
		if (id != other.id)
			return false;
		if (reservations == null) {
			if (other.reservations != null)
				return false;
		} else if (!reservations.equals(other.reservations))
			return false;
		if (reviews == null) {
			if (other.reviews != null)
				return false;
		} else if (!reviews.equals(other.reviews))
			return false;
		if (services == null) {
			if (other.services != null)
				return false;
		} else if (!services.equals(other.services))
			return false;
		return true;
	}

}
