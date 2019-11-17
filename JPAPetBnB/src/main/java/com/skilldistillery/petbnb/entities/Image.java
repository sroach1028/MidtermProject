package com.skilldistillery.petbnb.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Image {

// F I E L D S
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String url;
	
	@ManyToOne
	@JoinColumn(name = "host_id")
	private Host host;
	
	@ManyToOne
	@JoinColumn(name = "pet_id")
	private Pet pet;
	

// C O N S T R U C T O R S
	
	public Image() {
		super();
	}

	public Image(int id, String url) {
		super();
		this.id = id;
		this.url = url;
	}


	public Image(int id, String url, Host host, Pet pet) {
		super();
		this.id = id;
		this.url = url;
		this.host = host;
		this.pet = pet;
	}

// M E T H O D S
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Host getHost() {
		return host;
	}

	public void setHost(Host host) {
		this.host = host;
	}

	public Pet getPet() {
		return pet;
	}

	public void setPet(Pet pet) {
		this.pet = pet;
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
		Image other = (Image) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Image [id=" + id + ", url=" + url + ", host=" + host + ", pet=" + pet + "]";
	}
	
}
