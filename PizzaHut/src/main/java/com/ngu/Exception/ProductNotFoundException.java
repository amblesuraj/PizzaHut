package com.ngu.Exception;

import java.io.Serializable;

public class ProductNotFoundException extends RuntimeException implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String message;
	
	public ProductNotFoundException()
	{
		this("Product is not available");
	}
	
	public ProductNotFoundException(String message)
	{
		this.message = System.currentTimeMillis()+ " :"+message;
	}

	public String getMessage() {
		return message;
	}
	
	
}
