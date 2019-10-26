package com.ngu.ServiceImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ngu.Model.Category;
import com.ngu.Repositories.CategoryRepository;
import com.ngu.Service.CategoryService;
@Service("categoryService")
@Transactional
public class CategoryServieImpl implements CategoryService{

	@Autowired
	CategoryRepository categoryRepository; 
	
	@Override
	public Category save(Category category) {
		
		return categoryRepository.save(category);
	}

	@Override
	public List<Category> ShowAllCategories() {
		
		return categoryRepository.findAll();
	}

	@Override
	public void deleteCategory(int id) {
		categoryRepository.deleteById(id);	
	}

}
