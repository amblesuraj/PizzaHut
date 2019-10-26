package com.ngu;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.test.context.junit4.SpringRunner;

import com.ngu.Model.Cart;
import com.ngu.Model.CartLine;
import com.ngu.Model.Pizza;
import com.ngu.Model.User;
import com.ngu.Service.CartLineService;
import com.ngu.Service.CartService;
import com.ngu.Service.PizzaService;
import com.ngu.ServiceImpl.UserServiceImpl;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SpringProjectApplicationTests {

	@Test
	public void contextLoads() {
	}
	
//
//	private static CartLineService cartLineService;
//	private static CartService cartService ;
//	private static PizzaService pizzaService;
//	private static UserServiceImpl userServiceImpl;
//
//
//	private Pizza pizza ;
//	private Cart cart ;
//	private CartLine cartLine ;
//	private User user ;
//
//	@Test
//	public void addNewCartline()
//	{
//
//
//		user = userServiceImpl.findByUsername("employee");
//
//		cart = user.getCart();
//
//		pizza = pizzaService.getById(4);
//
//		cartLine = new CartLine();
//
//		cartLine.setBuyingPrice(pizza.getpPrice());
//
//		cartLine.setPizzaCount(cartLine.getPizzaCount() + 1);
//
//		cartLine.setTotal(pizza.getpPrice() * cartLine.getPizzaCount());
//
//		cartLine.setAvailable(true);
//
//		cartLine.setCart(cart);
//
//		cartLine.setPizza(pizza);
//
//		assertEquals("failed to add to cartline",true, cartLineService.addCartLine(cartLine));
//
//
//		cart.setGrandTotal(cart.getGrandTotal() + cartLine.getTotal());
//		cart.setCartlines(cart.getCartlines() + 1);
//
//		assertEquals("failed to update the cart",true, cartService.UpdateCart(cart));
//
//	}
}

