package com.ngu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ngu.Model.User;
import com.ngu.Service.CartLineService;

@Controller
@RequestMapping("/cart")
public class CartController {

	
//	@Autowired
//	private CartLineService cartLineService;
//	
//	@ModelAttribute("user")
//	public User getUsers()
//	{
//		return new User();
//	}
//	
//	@RequestMapping(value = "/show",method= RequestMethod.GET)
//	public ModelAndView showCart(@RequestParam(value = "result",required= false)String result,Model model)
//	{
//		ModelAndView mv= new ModelAndView("index");
//		
//		mv.addObject("UserClickShowCart",true);	
//		mv.addObject("title", "User cart");
//		
//		
//		if(result!= null)
//		{
//
//			switch (result)
//			{
//				case "added":
//								mv.addObject("msg", "Pizza has been successfully added inside cart!");	
//								break;
//			}
//		}
//		
//		mv.addObject("cartLines",cartLineService.listCartLines());
//		return mv;
//	}
//	
//	
//	@GetMapping(value="/{pizzaId}/add")
//	public String addCart(@PathVariable("pizzaId") int pizzaId)
//	{
//		String response = cartLineService.addCartLineToCart(pizzaId);
//		
//		return "redirect:/cart/show"+response;
//	}
	
}
