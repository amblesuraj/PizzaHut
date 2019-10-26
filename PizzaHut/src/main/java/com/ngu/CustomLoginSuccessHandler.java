package com.ngu;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import com.ngu.Model.CustomUserDetails;
import com.ngu.Model.User;


@Configuration
public class CustomLoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler implements AuthenticationSuccessHandler{


	@Override
	protected void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		
		
		
		String targetUrl= determineTargetUrl(authentication, request, response);
		if(response.isCommitted())
		{
			return;
		}
		RedirectStrategy strategy = new DefaultRedirectStrategy();
		strategy.sendRedirect(request, response, targetUrl);
		super.handle(request, response, authentication);
	}


	protected String determineTargetUrl(Authentication authentication,HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String url = "/dashboard/login?error";
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		List<String> roles= new ArrayList<>();
		
		for(GrantedAuthority authority : authorities)
		{
			roles.add(authority.getAuthority());
		}
		
		if(roles.contains("SUPERADMIN"))
		{
			url="/superadmin";
		}
		else if(roles.contains("ADMIN"))
		{
			url="/admin";
		}
		else if(roles.contains("EMPLOYEE") || roles.contains("USER"))
		{
			url="/index";
		//	response.sendRedirect(request.getHeader("referer"));
		
		}
		

		return url;
		
	}





		
			
	
	
		
 
	
	
	
	
	
	
}
