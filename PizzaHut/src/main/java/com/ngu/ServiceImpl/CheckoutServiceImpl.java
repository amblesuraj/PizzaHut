package com.ngu.ServiceImpl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ngu.Model.Checkout;
import com.ngu.Repositories.CheckoutRepository;
import com.ngu.Service.CheckoutService;
@Service("checkoutService")
@Transactional
public class CheckoutServiceImpl implements CheckoutService {

	
	@Autowired
	private CheckoutRepository checkoutRepository;
	
	@Override
	public Checkout saveCheoutDetails(Checkout checkout) {

		return checkoutRepository.save(checkout);
	}

}
