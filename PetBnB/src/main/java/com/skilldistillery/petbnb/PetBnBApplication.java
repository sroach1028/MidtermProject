package com.skilldistillery.petbnb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication
@EntityScan("com.skilldistillery.petbnb")
public class PetBnBApplication {

	public static void main(String[] args) {
		SpringApplication.run(PetBnBApplication.class, args);
	}

}
