package com.ngu.Service;

import java.util.List;

import com.ngu.Model.Category;


public interface CategoryService {

	public Category save(Category category);
	
	public List<Category> ShowAllCategories();
	
	void deleteCategory(int id);
	
}
