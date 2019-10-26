package com.ngu.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ngu.Model.CartLine;
@Repository
public interface CartLineRepository extends JpaRepository<CartLine, Integer>{

	
	

	List<CartLine> findByCartIdAndAvailable(int cartId, boolean b);

	CartLine findByCartIdAndPizza(int cartId, int pizzaId);

	CartLine findCartLineByCart_IdAndPizza_Id(int cartId,int pizzaId);


}
