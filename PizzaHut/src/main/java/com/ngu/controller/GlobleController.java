//package com.ngu.controller;
//
//import java.util.ArrayList;
//import java.util.Collection;
//import java.util.List;
//import java.util.Set;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.web.bind.annotation.ControllerAdvice;
//import org.springframework.web.bind.annotation.ModelAttribute;
//
//import com.ngu.Model.Role;
//import com.ngu.Model.User;
//import com.ngu.Model.UserModel;
//import com.ngu.ServiceImpl.UserServiceImpl;
//
//@ControllerAdvice
//public class GlobleController {
//
//
//	@Autowired
//	private HttpSession session;
//	
//	@Autowired
//	private UserServiceImpl userServiceImpl;
//	
//
//	private UserModel userModel = null;
//	private User user = null;	
//	
//	
//	@ModelAttribute("userModel")
//	public UserModel getUserModel()
// 	{		
//		if(session.getAttribute("userModel")==null)
//		 {
//			// get the authentication object
//			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//			
//			
//			if(!authentication.getPrincipal().equals("anonymousUser"))
//			{
//				// get the user from the database
//				user = userServiceImpl.findByUsername(authentication.getName());
//				
//				if(user!=null)
//				 {
//					// create a new model
//					userModel = new UserModel();
//					// set the name and the id
//					userModel.setId(user.getId());
//					userModel.setFname(user.getFname());
//					userModel.setLname(user.getLname());
//					userModel.setFullName(user.getFname() + " " + user.getLname());
//					userModel.setEmail(user.getEmail());
//					userModel.setUsername(user.getUsername());
//					userModel.setRoles(user.getRoles());
//					userModel.setPhone(user.getPhone());
//					userModel.setUser(user);
//					userModel.setCart(user.getCart());
//					
//					session.setAttribute("userModel", userModel);
//					return userModel;
//				}			
//			}
//		}
//		
//		return (UserModel) session.getAttribute("userModel");		
//	}
//	
//}


package com.ngu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.ngu.Model.User;
import com.ngu.Model.UserModel;
import com.ngu.ServiceImpl.UserServiceImpl;

@ControllerAdvice
public class GlobleController {


	
	@Autowired
	private UserServiceImpl userServiceImpl;
	

	private UserModel userModel = null;
	private User user = null;	
	
	
	@ModelAttribute("userModel")
	public UserModel getUserModel(Model model)
 	{		
			// get the authentication object
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			
			
			if(!(authentication instanceof AnonymousAuthenticationToken))
			{
				// get the user from the database
				user = userServiceImpl.findByUsername(authentication.getName());
				
				if(user!=null)
				 {
					// create a new model
					userModel = new UserModel();
					// set the name and the id
					userModel.setId(user.getId());
					userModel.setFname(user.getFname());
					userModel.setLname(user.getLname());
					userModel.setFullName(user.getFname() + " " + user.getLname());
					userModel.setEmail(user.getEmail());
					userModel.setUsername(user.getUsername());
					userModel.setRoles(user.getRoles());
					userModel.setPhone(user.getPhone());
					userModel.setUser(user);
					userModel.setCart(user.getCart());
					
				 }
			}
			model.addAttribute("userModel", userModel);
			return userModel; 
		 
 	}
	
}
