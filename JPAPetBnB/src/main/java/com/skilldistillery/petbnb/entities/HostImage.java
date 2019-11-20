package com.skilldistillery.petbnb.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="host_image")
public class HostImage {

// F I E L D S	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String url;
	
	@ManyToOne
	@JoinColumn(name = "host_id")
	private Host host;

// C O N S T R U C T O R S

	public HostImage() {
		super();
	}

	public HostImage(String url, Host host) {
	super();
	this.url = url;
	this.host = host;
	}

	// M E T H O D S
	
	public int getId() {
		return id;
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
		HostImage other = (HostImage) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Image [id=" + id + ", url=" + url + ", hsot=" + host + "]";
	}
	
}
