package com.ngu;

import java.io.IOException;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

public class LogoutFilter implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		 HttpServletResponse response=(HttpServletResponse)res; 
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate,max-age=0,post-check=0,pre-check=0");
		response.setHeader("Last-Modified", new Date().toString());
		 response.setHeader("Pragma", "no-cache");
//	        response.setDateHeader("Expires", -1); 
	        response.setHeader("Expires", "Tue, 03 Jul 2001 06:00:00 GMT");
	        chain.doFilter(req, res);
		
	}


}
