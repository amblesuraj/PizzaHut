package com.ngu.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ngu.Model.Category;
@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer>{

}
