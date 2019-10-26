package com.ngu.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ngu.Model.Cart;
import com.ngu.Model.CartLine;
@Repository
public interface CartRepository extends JpaRepository<Cart, Integer>{

	List<Cart> findAllById(int id);

}
