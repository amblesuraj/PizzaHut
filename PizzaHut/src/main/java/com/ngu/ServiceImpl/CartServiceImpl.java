package com.ngu.ServiceImpl;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ngu.Model.Cart;
import com.ngu.Model.UserModel;
import com.ngu.Repositories.CartRepository;
import com.ngu.Service.CartService;
@Service
@Transactional
public class CartServiceImpl implements CartService {

	@Autowired
	HttpSession session;
	
	@Autowired
	CartRepository cartRepository;
	
	@Override
	public Cart getCart() {
		
		return ((UserModel)session.getAttribute("userModel")).getCart();
	}

	@Override
	public boolean UpdateCart(Cart cart) {
	
		cartRepository.save(cart);
		
		return true;
	}

}
