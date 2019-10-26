package com.ngu;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
@Configuration
public class CustomLogoutHandler implements LogoutSuccessHandler{

	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
	
			response.setStatus(HttpServletResponse.SC_OK);
			HttpSession session = request.getSession();
			
					response.sendRedirect("/dashboard/login?logout");
				
					session.removeAttribute("userModel");
					
					
			if(authentication == null)
			{
				response.sendRedirect("index");
			}
			
//			 response.setHeader("Cache-Control","no-cache");
//			  response.setHeader("Cache-Control","no-store");
//			  response.setHeader("Pragma","no-cache");
//			  response.setDateHeader ("Expires", 0);

			
	}

}
