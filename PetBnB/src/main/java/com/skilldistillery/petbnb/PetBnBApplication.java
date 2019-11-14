package com.skilldistillery.petbnb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
@EntityScan("com.skilldistillery.petbnb")
public class PetBnBApplication extends SpringBootServletInitializer{
	
	  @Override
	  protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
	    return application.sources(PetBnBApplication.class);
	  }

	public static void main(String[] args) {
		SpringApplication.run(PetBnBApplication.class, args);
	}

}
