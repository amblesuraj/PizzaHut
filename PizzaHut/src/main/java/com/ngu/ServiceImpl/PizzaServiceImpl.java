package com.ngu.ServiceImpl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ngu.Model.Pizza;
import com.ngu.Model.User;
import com.ngu.Repositories.PizzaRepository;
import com.ngu.Service.PizzaService;

@Service("pizzaService")
@Transactional
public class PizzaServiceImpl implements PizzaService{
	
	@Autowired
	PizzaRepository pizzaRepository;
	
	@Override
	public Pizza save(Pizza pizza) {

		return pizzaRepository.save(pizza);
	}

	@Override
	public Pizza Update(Pizza pizza) {

		return pizzaRepository.save(pizza);
	}

	

	@Override
	public Pizza getById(int id) {
		
		return pizzaRepository.getOne(id);
	}

	@Override
	public List<Pizza> getAllPizzas() {
		
		return pizzaRepository.findAll();
	}

	@Override
	public void saveMyPizza(Pizza pizza, MultipartFile pizzaimage) {
		String folder ="C:\\Users\\Reception\\Documents\\workspace-sts-3.9.7.RELEASE\\Pizzahut\\src\\main\\resources\\static\\PizzaImages\\";
		Path imgPath;
		try {
			byte[] bytes1 = pizzaimage.getBytes();
			imgPath = Paths.get(folder + pizzaimage.getOriginalFilename());
			Files.write(imgPath, bytes1);

			pizza.setPizzaimage(pizzaimage.getOriginalFilename());
		} catch (IOException e) {
			e.printStackTrace();
		}

		pizzaRepository.save(pizza);
		
	}

	@Override
	public List<Pizza> getAllPizzasByType(String pType) {

		return pizzaRepository.findByPType(pType);
	}

	@Override
	public void deletePizza(int id) {
		pizzaRepository.deleteById(id);
		
	}

	@Override
	public List<Map<String, Object>> pizzaDetailsReport() {


List<Map<String, Object>> result = new ArrayList<>();
		
		for(Pizza pizza :pizzaRepository.findAll())
		{
			Map<String, Object> item= new HashMap<String, Object>();
			
			
			item.put("id", pizza.getId());
			item.put("pName", pizza.getpName());
			item.put("pPrice",pizza.getpPrice());
			item.put("pType",pizza.getpType());
			item.put("discount", pizza.getDiscount());
			item.put("totalGst", pizza.getTotalGst());
			item.put("categoryName",pizza.getCategoryName());
			item.put("grandTotal",pizza.getGrandTotal() );
			
			result.add(item);
		}
		
		return result;
	
		
	}

	
}
