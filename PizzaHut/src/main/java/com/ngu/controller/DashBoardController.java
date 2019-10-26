package com.ngu.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ngu.Model.CustomUserDetails;
import com.ngu.Model.User;
import com.ngu.Model.UserModel;
import com.ngu.ServiceImpl.UserServiceImpl;

@Controller
@RequestMapping(value="/dashboard")

public class DashBoardController<retutn> {

	@Autowired
	UserServiceImpl userServiceImpl;

	
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error,
			User user,@RequestParam(value = "logout", required = false)String logout,ModelMap modelMap
			){
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (!(auth instanceof AnonymousAuthenticationToken)) {
		    return "redirect:/index";
		}
		if (error != null) 
		{
			modelMap.put("error", "Invalid Username and Password.");
			modelMap.put("title","Error");
			return "dashboard/login";	
		}
		
		else if (logout != null)
		{
				modelMap.put("logout", "You have been successfully logged out.");
				modelMap.put("title","Home");
				return "index";
			
		}
		else {
			return "dashboard/login";	
		}
	
		

	}

	
	
	@ModelAttribute("user")
	public User getUser()
	{
		return new User();
	}
	
	public void Auth(ModelMap modelMap) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		CustomUserDetails CustomUser = (CustomUserDetails) auth.getPrincipal();
		
		modelMap.addAttribute("fullName", CustomUser.getFname() + " "+CustomUser.getLname());
		modelMap.addAttribute("email", CustomUser.getEmail());
		modelMap.addAttribute("lname", CustomUser.getLname());
		modelMap.addAttribute("username", CustomUser.getUsername());
	}
	
	@RequestMapping(value = "welcome", method = RequestMethod.GET)
	public String welcome(ModelMap modelMap) {
		
	
		
		modelMap.put("userClickWelcome",true);
		modelMap.put("title","Welcome");
		return "index";
	}

	@RequestMapping(value = "accessDenied", method = RequestMethod.GET)
	public String accessDenied(ModelMap modelMap) {
		modelMap.put("title","Access Denied");
		return "dashboard/accessDenied";
	}

	
	
	@RequestMapping(value = "register")
	public String register(ModelMap modelMap) {
		
		return "dashboard/register";
		
	}

	
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String createUser(@Valid @ModelAttribute User user, BindingResult result, ModelMap modelMap,
			@RequestParam(name = "username", required = false) String username,RedirectAttributes redirectAttributes) {
		
//		,@RequestParam(name="g-recaptcha-response")String captchaResponse
//		String url = "https://www.google.com/recaptcha/api/siteverify";
//		 			 
//		String param = "?secret=6Ldf9ZwUAAAAAGpDAoEN0LCW3658fY4TLl58JWeR&response"+captchaResponse;
//		
//		
//		ReCaptcha captcha = restTemplate.exchange(url+param, HttpMethod.POST,null,ReCaptcha.class).getBody();
		
		if (result.hasErrors()) {
			
			modelMap.put("error", "Something went wrong");
			return "dashboard/register";
		} else if(user.getId() == 0){
			User newUser = new User();
			userServiceImpl.save(user);
			redirectAttributes.addAttribute("newUser", newUser).addFlashAttribute("msg","user has been registered successfully");
			
			return "redirect:login?AccountCreated/"+user.getId();
			
		}
		return null;
	}

	
	
		@RequestMapping(value="checkUsernameAvail" , method = RequestMethod.POST)
		@ResponseBody    //we are sending json data cause ajax access data in jason format
		public boolean CheckUsernameExists(@RequestParam String username)
		{
			User usernameExists = userServiceImpl.findByUsername(username);
			
			if(usernameExists == null)
			{
				//Username already exists    cause remote function gives false for form.valid function instead of true
				return true;
			}
			else
			{
				return false;
			}
		}
		
		
		@RequestMapping(value="checkEmailAvail" , method = RequestMethod.POST)
		@ResponseBody    //we are sending json data cause ajax access data in jason format
		public boolean CheckEmailExists(@RequestParam String email)
		{
			User emailExists = userServiceImpl.findByEmail(email);
			
			if(emailExists == null)
			{
				//Username already exists    cause remote function gives false for form.valid function instead of true
				return true;
			}
			else
			{
				return false;
			}
		}
	
//		private UserModel userModel =null;
//		
//		@ModelAttribute("userModel")
//		public UserModel getUserModel(Model model)
//	 	{		
//				// get the authentication object
//				Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//				
//				
//				if(!authentication.getPrincipal().equals("anonymousUser"))
//				{
//					// get the user from the database
//					User user = userServiceImpl.findByUsername(authentication.getName());
//					
//					if(user!=null)
//					 {
//						// create a new model
//						userModel = new UserModel();
//						// set the name and the id
//						userModel.setId(user.getId());
//						userModel.setFname(user.getFname());
//						userModel.setLname(user.getLname());
//						userModel.setFullName(user.getFname() + " " + user.getLname());
//						userModel.setEmail(user.getEmail());
//						userModel.setUsername(user.getUsername());
//						userModel.setRoles(user.getRoles());
//						userModel.setPhone(user.getPhone());
//						userModel.setUser(user);
//						userModel.setCart(user.getCart());
//						
//					 }
//				}
//				model.addAttribute("userModel", userModel);
//				return userModel; 
//			 
//	 	}
	
}





