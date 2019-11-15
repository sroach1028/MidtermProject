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
	@JoinColumn(name = "user_id")
	private User user;

	@Column(name = "description")
	private String description;

	@OneToMany(mappedBy = "host")
	private List<Reservation> reservations;

	@OneToMany
	@JoinTable(name = "reservation", joinColumns = @JoinColumn(name = "host_id"), inverseJoinColumns = @JoinColumn(name = "reservation_id"))
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
		return "Host [id=" + id + ", user=" + user + ", description=" + description + ", reservations=" + reservations
				+ ", reviews=" + reviews + ", services=" + services + "]";
	}

//	M E T H O D S

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getClient() {
		return user;
	}

	public void setClient(User user) {
		this.user = user;
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + id;
		result = prime * result + ((reservations == null) ? 0 : reservations.hashCode());
		result = prime * result + ((reviews == null) ? 0 : reviews.hashCode());
		result = prime * result + ((services == null) ? 0 : services.hashCode());
		result = prime * result + ((user == null) ? 0 : user.hashCode());
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
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
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
		if (user == null) {
			if (other.user != null)
				return false;
		} else if (!user.equals(other.user))
			return false;
		return true;
	}

}
