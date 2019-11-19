package com.skilldistillery.petbnb.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "review_of_pet")
public class ReviewOfPet {

//	F I E L D S

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private int rating;
	
	private String review;
	
	@OneToOne
	@JoinColumn(name="reservation_id")
	private Reservation reservation;
	
	@ManyToOne
	@JoinTable(name="reservation",
	joinColumns=@JoinColumn(name = "id"),
	inverseJoinColumns = @JoinColumn(name="pet_id"))
	private Pet pet;

//	C O N S T R U C T O R S

	public ReviewOfPet() {
		super();
	}

	public ReviewOfPet(int id, int rating, String review, Pet pet) {
		super();
		this.id = id;
		this.rating = rating;
		this.review = review;
		this.pet = pet;
	}


//	M E T H O D S

	@Override
	public String toString() {
		return "ReviewOfPet [id=" + id + ", rating=" + rating + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public Pet getPet() {
		return pet;
	}

	public void setPet(Pet pet) {
		this.pet = pet;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public Reservation getReservation() {
		return reservation;
	}

	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		result = prime * result + ((pet == null) ? 0 : pet.hashCode());
		result = prime * result + rating;
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
		ReviewOfPet other = (ReviewOfPet) obj;
		if (id != other.id)
			return false;
		if (pet == null) {
			if (other.pet != null)
				return false;
		} else if (!pet.equals(other.pet))
			return false;
		if (rating != other.rating)
			return false;
		return true;
	}

}