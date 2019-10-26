package com.ngu.Service;

import java.util.List;

import com.ngu.Model.CartLine;

public interface CartLineService {
	
	public CartLine updateCartLine(CartLine cartLine);
	
	public void deleteCartLine(CartLine cartLine);
	
	
	public List<CartLine> listCartLines();
	
	
	
	
	
	public CartLine getCartlineById(int id);

	CartLine getByCartAndProduct(int cartId, int pizzaId);
	
	List<CartLine> findAvailable(int cartId);

	boolean addCartLine(CartLine cartLine);
	
	public String addCartLineToCart(int pizzaId);

}
