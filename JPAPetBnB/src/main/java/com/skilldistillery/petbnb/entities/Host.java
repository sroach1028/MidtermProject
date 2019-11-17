package com.skilldistillery.petbnb.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
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
	
	@OneToMany(mappedBy = "host")
	private List<ReviewOfHost> reviewsOfHost;

<<<<<<< HEAD
	@ManyToMany(mappedBy="hosts")
=======
	@ManyToMany
	@JoinTable(name = "host_service", joinColumns = @JoinColumn(name = "host_id"), inverseJoinColumns = @JoinColumn(name = "service_id"))

>>>>>>> 9f09b2ba3a18c23a0164d31d3fb38f516d665433
	private List<HostService> services;
	
	@OneToMany(mappedBy = "host")
	private List<Image> images;


//	C O N S T R U C T O R S

	public Host() {
		super();
	}

	public Host(int id, User user, String description, List<Reservation> reservations, List<ReviewOfHost> reviewsOfHost,
			List<HostService> hostServices) {
		super();
		this.id = id;
		this.user = user;
		this.description = description;
		this.reservations = reservations;
		this.reviewsOfHost = reviewsOfHost;
		this.services = hostServices;
	}

	//	M E T H O D S
	
	public void addImage(Image image) {
		if (images == null) {
			images = new ArrayList<>();
		}
		if (!images.contains(image)) {
			images.add(image);
			if (image.getHost() != null) {
				image.getHost().getImages().remove(image);
			}
		}
		image.setHost(this);
	}
	
	public void removeImage(Image image) {
		image.setHost(null);
		if (images != null) {
			images.remove(image);
		}
	}

	@Override
	public String toString() {
		return "Host [id=" + id + ", user=" + user + ", description=" + description;
	}
	
	public void addReservation(Reservation reservation) {
		if (reservations == null) {
			reservations = new ArrayList<>();
		}
		if (!reservations.contains(reservation)) {
			reservations.add(reservation);
			if (reservation.getHost() != null) {
				reservation.getHost().getReservations().remove(reservation);
			}
		}
		reservation.setHost(this);
	}
	
	public void removeReservation(Reservation reservation) {
		reservation.setHost(null);
		if (reservations != null) {
			reservations.remove(reservation);
		}
	}
	
	public void addReviewOfHost(ReviewOfHost reviewOfHost) {
		if (reviewsOfHost == null) {
			reviewsOfHost = new ArrayList<>();
		}
		if (!reviewsOfHost.contains(reviewOfHost)) {
			reviewsOfHost.add(reviewOfHost);
			if (reviewOfHost.getHost() != null) {
				reviewOfHost.getHost().getReviewsOfHost().remove(reviewOfHost);
			}
		}
		reviewOfHost.setHost(this);
	}
	
	public void removeReviewOfHost(ReviewOfHost reviewOfHost) {
		reviewOfHost.setHost(null);
		if (reviewsOfHost != null) {
			reviewsOfHost.remove(reviewOfHost);
		}
	}
	
	public void addService(HostService hostService) {
		if (services == null) {
			services = new ArrayList<>();
		}
		if (!services.contains(hostService)) {
			services.add(hostService);
			hostService.addHost(this);
			}
		}
	
	public void removeService(HostService hostService) {
		if(services != null && services.contains(hostService)) {
			services.remove(hostService);
			hostService.removeHost(this);
		}
	}

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

	public List<HostService> getServices() {
		return services;
	}

	public void setServices(List<HostService> hostServices) {
		this.services = hostServices;
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

	public List<ReviewOfHost> getReviewsOfHost() {
		return reviewsOfHost;
	}

	public void setReviewsOfHost(List<ReviewOfHost> reviewsOfHost) {
		this.reviewsOfHost = reviewsOfHost;
	}


	public List<Image> getImages() {
		return images;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
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
		if (id != other.id)
			return false;
		return true;
	}

}
