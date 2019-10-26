package com.ngu.controller;

import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ngu.helper.CodeHelper;
@Controller
@RequestMapping("/employee")
public class EmployeeController {

		
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap)
	{
		modelMap.put("userClickEmployee",true);
		return "employee/index"; 
	}
	
	
	@RequestMapping(value = "/qrCode/{p_Name}" ,method =RequestMethod.GET)
	public void QrCode(@PathVariable String p_Name, HttpServletResponse response) throws Exception
	{
		response.setContentType("Image/png");
		OutputStream outputStream = response.getOutputStream();
		outputStream.write(CodeHelper.getQRCodeImage(p_Name, 200, 200));
		outputStream.flush();
		outputStream.close();
		
	}
	
	//I have given pathvariable as "Username" and In success page I gave the url as /barcode/${employee.phone} it is showing
	
	@RequestMapping(value = "/barcode/{p_Name}" ,method=RequestMethod.GET)
	public void Barcode(@PathVariable String p_Name, HttpServletResponse response) throws Exception
	{
		response.setContentType("Image/png");
		OutputStream outputStream = response.getOutputStream();
		outputStream.write(CodeHelper.getBarcodeImage(p_Name, 200, 200));
		outputStream.flush();
		outputStream.close();
		
	}
	
}
