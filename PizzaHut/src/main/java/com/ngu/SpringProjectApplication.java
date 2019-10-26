package com.ngu;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@EnableJpaRepositories(basePackages = "com.ngu.Repositories")
@EntityScan("com.ngu.Model")
@SpringBootApplication(scanBasePackages = {"com.ngu"})
public class SpringProjectApplication {
		private static final Logger LOGGER = LoggerFactory.getLogger(SpringProjectApplication.class);

	
	public static void main(String[] args){
		SpringApplication.run(SpringProjectApplication.class, args);

	}

	
	

	
	
}

