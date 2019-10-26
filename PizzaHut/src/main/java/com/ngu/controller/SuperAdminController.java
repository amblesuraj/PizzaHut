package com.ngu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/superadmin")
public class SuperAdminController {

		
		@RequestMapping(method = RequestMethod.GET)
		public String index(ModelMap modelMap)
		{
			modelMap.put("userClickSuperAdmin",true);
			return "superadmin/index"; 
		}
		

}
