package com.ngu.Exception;

import java.io.PrintWriter;
import java.io.StringWriter;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GlobleException{

	
	@ExceptionHandler(value=NoHandlerFoundException.class)
	@ResponseStatus(value=HttpStatus.NOT_FOUND)
	public ModelAndView NoHandlerFoundException(NoHandlerFoundException ex)
	{
		ModelAndView mv= new ModelAndView("common/error");
		
		mv.addObject("errorTitle", "This page is not constructed");
		mv.addObject("title", "404 Error Page");
		mv.addObject("errorDescription", "The Page you are looking for is not available now !");
		mv.addObject("NoHandlerFound", true);
		mv.addObject("errorMessage", ex.getMessage());
		mv.addObject("url", ex.getRequestURL());
		return mv;
				
	}
	
	@ExceptionHandler(RuntimeException.class)
	public ModelAndView RunTimeExceptionException(Exception ex)
	{
		ModelAndView mv= new ModelAndView("common/error");
		
		mv.addObject("errorTitle", "This page is not constructed");
		mv.addObject("title", "404 Error Page");
		mv.addObject("errorDescription", "The Page you are looking for is not available now !");
		mv.addObject("errorMessage", ex.getMessage());
		return mv;
				
	}
	
	@ExceptionHandler(Exception.class )
	public ModelAndView ProductNotFoundException(Exception ex)
	{
		ModelAndView mv= new ModelAndView("common/error");
		
		mv.addObject("errorTitle", "Contact Your Administrator");
		mv.addObject("title", "404 Error Found");
		StringWriter sWriter = new StringWriter();
		PrintWriter pWriter = new PrintWriter(sWriter);
		ex.printStackTrace(pWriter);
		mv.addObject("errorDescription", "The Page you are looking for is not available now!");
		mv.addObject("errorMessage", sWriter.toString());
		return mv;
				
	}
	
	@ExceptionHandler(javax.persistence.EntityNotFoundException.class)
	public ModelAndView EntityNotFoundException(Exception ex)
	{
		ModelAndView mv= new ModelAndView("common/error");
		
		mv.addObject("errorTitle", "Contact Your Administrator");
		mv.addObject("title", "Product Unavailable");
		mv.addObject("errorDescription", "The Product you are looking for is not available now!");
		mv.addObject("errorMessage", ex.getMessage());
		return mv;
				
	}

	
	
}
