package com.ngu.ServiceImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ngu.Model.CartLine;
import com.ngu.Repositories.CartLineRepository;
import com.ngu.Repositories.CartRepository;
import com.ngu.Service.CartLineService;
@Service
@Transactional
public class CartLineServiceImpl implements CartLineService {

	
	@Autowired
	CartLineRepository cartLineRepository;
	
	@Override
	public CartLine updateCartLine(CartLine cartLine) {
		
		return cartLineRepository.save(cartLine);
	}

	@Override
	public void deleteCartLine(CartLine cartLine) {
		cartLineRepository.delete(cartLine);

	}

	@Override
	public List<CartLine> listCartLines() {

		return cartLineRepository.findAll();
	}

	@Override
	public CartLine getCartlineById(int id) {
	
		return cartLineRepository.getOne(id);
	}

	@Override
	public CartLine getByCartAndProduct(int cartId, int pizzaId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CartLine> findAvailable(int cartId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean addCartLine(CartLine cartLine) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String addCartLineToCart(int pizzaId) {
		// TODO Auto-generated method stub
		return null;
	}

}
