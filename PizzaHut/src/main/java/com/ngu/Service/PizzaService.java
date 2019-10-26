package com.ngu.Service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.ngu.Model.Pizza;

public interface PizzaService {
	
	
	public Pizza save(Pizza pizza);
	
	public Pizza Update(Pizza pizza);

	public void deletePizza(int id);

	public Pizza getById(int id);

	public List<Pizza> getAllPizzas();

	public void saveMyPizza(Pizza pizza, MultipartFile pizzaimage);
	

	public List<Pizza> getAllPizzasByType(String pType);

	public List<Map<String, Object>> pizzaDetailsReport();
	
	
//	@Query("select * from Pizza where discount > 0 and discount < 40")
//	public List<Pizza> getAllPizzasWithDiscount();
	
	
	
}
