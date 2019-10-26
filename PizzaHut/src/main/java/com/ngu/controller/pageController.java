package com.ngu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ngu.Model.User;

@Controller
public class pageController {

	
	
	
	@ModelAttribute("user")
	public User getUser()
	{
		return new User();
	}


	@RequestMapping(value = { "","/", "index","home"}, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("title","Home");
		modelMap.put("userClickHome",true);
		return "index";
	}
	
//	
//	@RequestMapping(value="logout")
//	public String logout(@RequestParam(value = "logout", required = false)String logout,ModelMap modelMap)
//	{
//		if (logout != null)
//		{
//				modelMap.put("logout", "You have been successfully logged out.");
//			
//			
//		}
//		return "index";
//	}
	
}
