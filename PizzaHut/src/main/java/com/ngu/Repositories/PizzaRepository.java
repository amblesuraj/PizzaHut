package com.ngu.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ngu.Model.Pizza;
@Repository
public interface PizzaRepository extends JpaRepository<Pizza, Integer>{

	List<Pizza> findByPType(String pType);
	
	

}
