package com.ngu.controller;

import java.util.Map;
import java.util.Optional;
import java.util.UUID;

import javax.persistence.EntityNotFoundException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ngu.Model.Checkout;
import com.ngu.Model.Mail;
import com.ngu.Model.User;
import com.ngu.Service.CheckoutService;
import com.ngu.Service.EmailService;
import com.ngu.Service.PizzaService;
import com.ngu.ServiceImpl.UserServiceImpl;

@Controller
@RequestMapping("/user")
public class UserController {


	private static final Logger LOGGER= LoggerFactory.getLogger(UserController.class);


	@Autowired
	private UserServiceImpl userServiceImpl;
	
	@Autowired
	private CheckoutService checkoutService;

	@Autowired
	PizzaService pizzaService;

	@Autowired
	EmailService emailService;

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	@ModelAttribute("user")
	public User getUser()
	{
		return new User();
	}
	

	
	@RequestMapping(value="profile",method = RequestMethod.GET)
	public String AdminPrivate1(User user,HttpSession session,ModelMap modelMap,@RequestParam int id )
	{
		
		modelMap.put("userClickProfile",true);
		modelMap.put("user",userServiceImpl.getId(id));
		return "user/Profile";
		
	}
	
	@RequestMapping(value = "/update/{id}" , method = RequestMethod.GET)
	public ModelAndView ShowEditInfo(@PathVariable int id) throws EntityNotFoundException
	{
		ModelAndView mv = new ModelAndView("user/Profile");
		
		Optional<User> currentUser = userServiceImpl.findById(id);
		
		
		if(!currentUser.isPresent()) 
			throw new EntityNotFoundException();
		
		mv.addObject("user", currentUser);
		return mv;
	}
	
	
	@RequestMapping(value = "/update" , method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("user") User user,ModelMap modelMap)
	{
		
			
			userServiceImpl.update(user);	
			
			modelMap.put("msg","User Updated successfully");
			
			return "user/Profile";
			
	}

	@RequestMapping(value="pizza",method = RequestMethod.GET)
	public String PizzaPage(ModelMap modelMap )
	{
		modelMap.put("userClickPizza",true);
		modelMap.put("title","Pizza");
		return "index";
		
	}
	
	@RequestMapping(value="checkout",method = RequestMethod.GET)
	public String CheckoutPage(@RequestParam(name="payment",required=false) String payment,ModelMap modelMap )
	{
		modelMap.put("checkout",new Checkout());
		modelMap.put("userClickCheckout",true);
		modelMap.put("title","Checkout");
		
		if(payment!=null)
		{
			if(payment.equals("successful"))
			{
				modelMap.put("msg","Checkout done");
			}
		}
		
		return "index";
		
	}
	
	
	@RequestMapping(value="checkoutPayment",method = RequestMethod.POST)
	public String MakePayemnt(@ModelAttribute("checkout") Checkout checkout,BindingResult result,ModelMap modelMap )
	{
		if(result.hasErrors())
		{
			
			modelMap.put("userClickCheckout",true);
			return "index";
		}
		else
		{
			checkoutService.saveCheoutDetails(checkout);
			modelMap.put("msg","Payment has done successfully");
		}
		
		
		return "redirect:/user/checkout?payment=successful";
		
	}
	
	
	
	
	@RequestMapping(value="policy",method = RequestMethod.GET)
	public String PrivacyPolicy(ModelMap modelMap )
	{
		modelMap.put("userClickPrivacyPlicy",true);
		return "index";
		
	}
	
	@RequestMapping(value="terms",method = RequestMethod.GET)
	public String terms(ModelMap modelMap )
	{
		modelMap.put("userClickTerms",true);
		return "index";
		
	}
	
	@RequestMapping(value = "showPizza", method = RequestMethod.GET)
	public String ShowAllPizzaByTypeList(ModelMap modelMap) throws Exception {
		// index
		modelMap.put("title", "Show Pizza List");
		modelMap.put("userClickShowPizza", true);
		modelMap.put("Pizzas", pizzaService.getAllPizzasByType("supreme"));
		modelMap.put("FavouritePizzas", pizzaService.getAllPizzasByType("favourite"));
		modelMap.put("ClassicPizzas", pizzaService.getAllPizzasByType("classic"));
		modelMap.put("SignaturePizzas", pizzaService.getAllPizzasByType("signature"));
		return "index";

	}


	//forgot password
	@RequestMapping(value="forgotpass",method = RequestMethod.GET)
	public String forgotPass(ModelMap modelMap )
	{
		return "dashboard/forgotPass";

	}

//
//	@RequestMapping(value="/checkEmailAvail")
//	@ResponseBody
//	public boolean checkEmailAvailability(@RequestParam String email,ModelMap modelMap)
//	{
//
//		User existsEmail = userServiceImpl.findByEmail(email);
//		if(existsEmail!=null)
//		{
//			//"This Email is already exists"
//			return true;
//		}
//
//		else
//		{
//			//"Yo can take this email"
//			return false;
//		}
//	}

	@RequestMapping(value = "forgotPassword",method = RequestMethod.POST)
	public ModelAndView forgotPasswordForm(ModelAndView mv ,@RequestParam("email") String email, HttpServletRequest request)
	{

		Optional<User> optional = userServiceImpl.findUserByEmail(email);
		
		
		if(!optional.isPresent())
		{
			mv.addObject("errorMessage", "Account not found with the given Email ID...");
		}
		else
		{
			User user = optional.get();
			user.setResetToken(UUID.randomUUID().toString());
			userServiceImpl.update(user);

			String appUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();


//			SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
//			simpleMailMessage.setFrom("support@demo.com");
//			simpleMailMessage.setTo(user.getEmail());
//			simpleMailMessage.setSubject("Password Reset Request");
//			simpleMailMessage.setText("To reset your password, click the link below:\n"+appUrl+"/user/reset?token="+user.getResetToken());
//			emailService.SendEmail(simpleMailMessage);
			
			Mail mail = new Mail();
     		mail.setFrom("support@demo.com");
     		mail.setTo(user.getEmail());
     		mail.setSubject("Password Reset Request");
     		mail.setContent("To reset your password, click the link below:\n"+appUrl+"/user/reset?token="+user.getResetToken());

     		emailService.sendSimpleMessage(mail);
			
			mv.addObject("successMessage","password reset link has been sent to your email "+email);
			LOGGER.info("password reset link has been sent to your email "+email);
			
		}
		mv.setViewName("dashboard/forgotPass");
		return mv;
		
	}
	
	
	@RequestMapping(value = "/reset", method = RequestMethod.GET)
	public ModelAndView displayResetPasswordPage(ModelAndView modelAndView, @RequestParam("token") String token) {
		
		Optional<User> user = userServiceImpl.findByResetToken(token);

		if (user.isPresent()) { // Token found in DB
			modelAndView.addObject("resetToken", token);
			LOGGER.info("Token is ::::::::::::::::::::"+token);
		} else { // Token not found in DB
			modelAndView.addObject("errorMessage", "Oops!  This is an invalid password reset link.");
		}

		modelAndView.setViewName("dashboard/resetPassword");
		return modelAndView;
	}

	@RequestMapping(value = "/reset", method = RequestMethod.POST)
	public ModelAndView setNewPassword(ModelAndView modelAndView, @RequestParam Map<String, String> requestParams, RedirectAttributes redir,
			HttpServletRequest request) {

		// Find the user associated with the reset token
		Optional<User> user = userServiceImpl.findByResetToken(requestParams.get("token"));

		// This should always be non-null but we check just in case
		if (user.isPresent()) {
			
			User resetUser = user.get(); 
            
			// Set new password    
            resetUser.setPassword(bCryptPasswordEncoder.encode(requestParams.get("password")));
			//resetUser.setPassword(requestParams.get("password"));
			LOGGER.info("Reseted Password is :::::::::::::::\n"+requestParams.get("password"));
			// Set the reset token to null so it cannot be used again
			resetUser.setResetToken(null);

			// Save user
			userServiceImpl.update(resetUser);

			//SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
			//simpleMailMessage.setFrom("support@demo.com");
			//simpleMailMessage.setTo(resetUser.getEmail());
			//simpleMailMessage.setSubject("Password Reset Successfully");
			//simpleMailMessage.setText("You have successfully reseted your password:"+requestParams.get("password"));
			//emailService.SendEmail(simpleMailMessage);
			
			 Mail mail = new Mail();
        		mail.setFrom("support@demo.com");
        		mail.setTo(resetUser.getEmail());
        		mail.setSubject("Password Reset Successfully");
        		mail.setContent("You have successfully reseted your password:"+requestParams.get("password"));

        		emailService.sendSimpleMessage(mail);

			LOGGER.info("password reset link has been sent to your email "+resetUser.getEmail());
			
			// In order to set a model attribute on a redirect, we must use
			// RedirectAttributes
			redir.addFlashAttribute("msg", "You have successfully reset your password.  You may now login.");

			modelAndView.setViewName("redirect:/dashboard/login");
			return modelAndView;
			
		} else {
			modelAndView.addObject("errorMessage", "Oops!  This is an invalid password reset link.");
			modelAndView.setViewName("dashboard/resetPassword");	
		}
		
		return modelAndView;
   }

}
