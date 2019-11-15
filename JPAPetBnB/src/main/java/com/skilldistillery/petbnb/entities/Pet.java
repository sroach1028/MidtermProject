package com.skilldistillery.petbnb.entities;

import java.util.ArrayList;
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

	private String breed;

	@Column(name = "special_needs")
	private String specialNeeds;

	private String description;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	@OneToMany(mappedBy = "pet")
	private List<ReviewOfPet> reviewsOfPet;
	
	@ManyToOne
	@JoinColumn(name = "type_id")
	private PetType petType;

	@OneToMany(mappedBy = "pet")
	private List<Reservation> reservations;
	
//	C O N S T R U C T O R S

	public Pet() {
		super();
	}
	
	public Pet(int id, String name, String breed, String specialNeeds, String description, User user,
			List<ReviewOfPet> reviewsOfPet, PetType petType, List<Reservation> reservations) {
		super();
		this.id = id;
		this.name = name;
		this.breed = breed;
		this.specialNeeds = specialNeeds;
		this.description = description;
		this.user = user;
		this.reviewsOfPet = reviewsOfPet;
		this.petType = petType;
		this.reservations = reservations;
	}

//	M E T H O D S

	public void addReservation(Reservation reservation) {
		if (reservations == null) {
			reservations = new ArrayList<>();
		}
		if (!reservations.contains(reservation)) {
			reservations.add(reservation);
			if (reservation.getPet() != null) {
				reservation.getPet().getReservations().remove(reservation);
			}
		}
		reservation.setPet(this);
	}
	
	public void removeReservation(Reservation reservation) {
		reservation.setPet(null);
		if (reservations != null) {
			reservations.remove(reservation);
		}
	}
	
	public void addReviewOfPet(ReviewOfPet review) {
		if (reviewsOfPet == null) {
			reviewsOfPet = new ArrayList<>();
		}
		if (!reviewsOfPet.contains(review)) {
			reviewsOfPet.add(review);
			if (review.getPet() != null) {
				review.getPet().getReviewsOfPet().remove(review);
			}
		}
		review.setPet(this);
	}
	
	public void removeReviewOfPet(ReviewOfPet review) {
		review.setPet(null);
		if (reviewsOfPet != null) {
			reviewsOfPet.remove(review);
		}
	}
	
	@Override
	public String toString() {
		return "Pet [id=" + id + ", name=" + name + ", breed=" + breed + ", specialNeeds=" + specialNeeds
				+ ", description=" + description + ", petType=" + petType + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBreed() {
		return breed;
	}

	public void setBreed(String breed) {
		this.breed = breed;
	}

	public String getSpecialNeeds() {
		return specialNeeds;
	}

	public void setSpecialNeeds(String specialNeeds) {
		this.specialNeeds = specialNeeds;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Reservation> getReservations() {
		return reservations;
	}

	public void setReservations(List<Reservation> reservations) {
		this.reservations = reservations;
	}

	public List<ReviewOfPet> getReviewsOfPet() {
		return reviewsOfPet;
	}

	public void setReviewsOfPet(List<ReviewOfPet> reviewsOfPet) {
		this.reviewsOfPet = reviewsOfPet;
	}

	public PetType getPetType() {
		return petType;
	}

	public void setPetType(PetType petType) {
		this.petType = petType;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((breed == null) ? 0 : breed.hashCode());
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + id;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((petType == null) ? 0 : petType.hashCode());
		result = prime * result + ((reservations == null) ? 0 : reservations.hashCode());
		result = prime * result + ((specialNeeds == null) ? 0 : specialNeeds.hashCode());
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
		Pet other = (Pet) obj;
		if (breed == null) {
			if (other.breed != null)
				return false;
		} else if (!breed.equals(other.breed))
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (id != other.id)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (petType == null) {
			if (other.petType != null)
				return false;
		} else if (!petType.equals(other.petType))
			return false;
		if (reservations == null) {
			if (other.reservations != null)
				return false;
		} else if (!reservations.equals(other.reservations))
			return false;
		if (specialNeeds == null) {
			if (other.specialNeeds != null)
				return false;
		} else if (!specialNeeds.equals(other.specialNeeds))
			return false;
		if (user == null) {
			if (other.user != null)
				return false;
		} else if (!user.equals(other.user))
			return false;
		return true;
	}

}
