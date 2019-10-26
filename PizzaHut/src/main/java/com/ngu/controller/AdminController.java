package com.ngu.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.JasperException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ngu.Exception.ProductNotFoundException;
import com.ngu.Model.Category;
import com.ngu.Model.Deal;
import com.ngu.Model.Pizza;
import com.ngu.Model.User;
import com.ngu.Service.CategoryService;
import com.ngu.Service.DealService;
import com.ngu.Service.PizzaService;
import com.ngu.ServiceImpl.UserServiceImpl;

import net.sf.jasperreports.engine.DefaultJasperReportsContext;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.export.HtmlExporter;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsMetadataExporter;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;
import net.sf.jasperreports.engine.util.JRSaver;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleHtmlExporterOutput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import net.sf.jasperreports.export.SimplePdfExporterConfiguration;
import net.sf.jasperreports.export.SimplePdfReportConfiguration;
import net.sf.jasperreports.export.SimpleXlsxReportConfiguration;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	UserServiceImpl userServiceImpl;

	@Autowired
	CategoryService categoryService;

	@Autowired
	PizzaService pizzaService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		// Dashboard
		modelMap.put("title", "Admin Dashboard");
		modelMap.put("AdminClickDashboard", true);
		modelMap.put("allPizzas", pizzaService.getAllPizzas());
		return "admin/admin";

	}

	@RequestMapping(value = "me", method = RequestMethod.GET)
	public String AdminMe(ModelMap modelMap) {
		// index
		modelMap.put("title", "Home");
		modelMap.put("AdminClickMe", true);
		return "index";

	}
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String AdminPrivate(ModelMap modelMap) {
		// index
		modelMap.put("title", "Home");
		modelMap.put("AdminClickHome", true);
		return "index";

	}

	@ModelAttribute("user")
	public User getUser() {
		return new User();
	}


	@RequestMapping(value = "AddPizza", method = RequestMethod.GET)
	public ModelAndView addPizza(@RequestParam(name = "success", required = false) String success) {
		ModelAndView mv = new ModelAndView("admin/admin");
		mv.addObject("title", "Pizza Details Insertion");
		mv.addObject("AdminClickpizzaInsert", true);
		return mv;
	}

	// Manage Pizza

	@ModelAttribute("categories")
	public List<Category> getCategories() {
		return categoryService.ShowAllCategories();
	}

	@ModelAttribute("category")
	public Category getCategory() {
		return new Category();
	}

	@ModelAttribute("pizza")
	public Pizza getPizza() {
		return new Pizza();
	}

	@PostMapping("/savePizza")
	public String uploadImage(@RequestParam("pizzaimage") MultipartFile pizzaimage, @ModelAttribute Pizza pizza,
			BindingResult bindingResult,RedirectAttributes redirectAttributes) {
		try {

				pizzaService.saveMyPizza(pizza, pizzaimage);

		} catch (Exception e) {
			e.printStackTrace();
		}
		redirectAttributes.addFlashAttribute("msg", "Pizza added Successfully");
		return "redirect:/admin/AddPizza?Pizza=added";
	}
	// for Update Pizza

	@RequestMapping(value = "/pizza/{id}/update", method = RequestMethod.GET)
	public ModelAndView ShowEditPizza(@PathVariable int id) throws ProductNotFoundException {
		// This will return admin.jsp page
		ModelAndView mv = new ModelAndView("admin/admin");
		mv.addObject("AdminClickpizzaInsert", true);
		// create another object of Employee
		Pizza currentPizza = pizzaService.getById(id);

		if (currentPizza == null)

			throw new ProductNotFoundException();

		// pass current employee to modelAttribute
		mv.addObject("pizza", currentPizza);
		return mv;
	}

	@RequestMapping(value = "/pizza/update", method = RequestMethod.POST)
	public String update(@ModelAttribute("pizza") Pizza pizza, BindingResult result, ModelMap modelMap)
			throws Exception {

		
		
		if (result.hasErrors()) {
			modelMap.put("AdminClickpizzaInsert", true);
			return "admin/admin";
		}

		if (pizza != null) {

			pizzaService.Update(pizza);
			return "redirect:/admin/AddPizza?updated=updated";
		}
		
		return "admin/admin";
	}

	// for save category

	@RequestMapping(value = "saveCategory", method = RequestMethod.POST)
	public String saveCategory(@ModelAttribute("category") Category category, ModelMap modelMap,RedirectAttributes redirectAttributes) {
		Category newCategory = categoryService.save(category);

		modelMap.put("newCategory", newCategory);
		redirectAttributes.addFlashAttribute("msg","Category Added Successfully");
		return "redirect:/admin/AddPizza?Category=added";
	}

	// delete category
	@RequestMapping(value = "deleteCategory/{id}", method = RequestMethod.GET)
	public String deleteCategory(@PathVariable int id, RedirectAttributes redirectAttributes) {
		Category category = new Category();
		categoryService.deleteCategory(id);
		redirectAttributes.addFlashAttribute("msg", "Category deleted Successfully");
		return "redirect:/admin/showAllCategories?category=deleted"+category.getId();
	}
	
	
	@RequestMapping(value = "deletepizza/{id}", method = RequestMethod.GET)
	public String deletepizza(@PathVariable int id, ModelMap modelMap,RedirectAttributes redirectAttributes) {

		pizzaService.deletePizza(id);
		redirectAttributes.addFlashAttribute("msg", "Pizza deleted Successfully");
		return "redirect:/admin/showAllCategories?Pizza=deleted";
	}
	
	// Show all categories
	@RequestMapping(value = "/showAllCategories", method = RequestMethod.GET)
	public String showAllCategories(ModelMap modelMap) {
		modelMap.put("AdminClickShowAllCategories", true);
		modelMap.put("PizzaCategories", categoryService.ShowAllCategories());
		return "admin/admin";
	}
	// Show All Users

	@RequestMapping(value = "/showAllUsers", method = RequestMethod.GET)
	public String showAllUsers(ModelMap modelMap) {
		modelMap.put("AdminClickShowAllUser", true);
		modelMap.put("users", userServiceImpl.findAllUsers());
		return "admin/admin";
	}
	
	//Generate html Report of all users
	@RequestMapping(value = "/userReports", method = RequestMethod.GET)
	public void report(HttpServletResponse response) throws Exception
	{
		response.setContentType("text/html");
		
		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(userServiceImpl.userDetailsReport());
		InputStream inputStream = this.getClass().getResourceAsStream("/reports/report.jrxml");
		JasperReport jasperReport = JasperCompileManager.compileReport(inputStream);
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,null,dataSource);
		HtmlExporter exporter = new HtmlExporter(DefaultJasperReportsContext.getInstance());
		
		exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
		exporter.setExporterOutput(new SimpleHtmlExporterOutput(response.getWriter()));
		exporter.exportReport();
	

	}
	@RequestMapping(value = "/pizzaReports", method = RequestMethod.GET)
	public void PizzaPdf(HttpServletResponse response) throws Exception,JasperException
	{
		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(pizzaService.pizzaDetailsReport());
		InputStream inputStream = this.getClass().getResourceAsStream("/reports/pizzaReport.jrxml");
		
//		JasperDesign jasperDesign = JRXmlLoader.load(inputStream);
		JasperReport jasperReport = JasperCompileManager.compileReport(inputStream);
		
//		To avoid compiling it every time, we can save it to a file:
//		JRSaver.saveObject(jasperReport, "pizzaReport.jasper");
				
				
		Map<String, Object> item= new HashMap<String, Object>();
		
		Pizza pizza = new Pizza(); 
		item.put("id", pizza.getId());
		item.put("pName", pizza.getpName());
		item.put("pPrice",pizza.getpPrice());
		item.put("pType",pizza.getpType());
		item.put("discount", pizza.getDiscount());
		item.put("totalGst", pizza.getTotalGst());
		item.put("categoryName",pizza.getCategoryName());
		item.put("grandTotal",pizza.getGrandTotal() );
		
		response.setContentType("application/pdf");
		 response.addHeader("content-disposition", "inline; filename=pizzaReport.pdf");
		
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,item,dataSource);

		OutputStream os = response.getOutputStream();
		
		
		
		JRPdfExporter exporter = new JRPdfExporter();
		 
		exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
		exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(os));
		
		
		SimplePdfReportConfiguration reportConfig = new SimplePdfReportConfiguration();
		
		reportConfig.setSizePageToContent(true);
		reportConfig.setForceLineBreakPolicy(false);
		 
		SimplePdfExporterConfiguration exportConfig = new SimplePdfExporterConfiguration();
		
		exportConfig.setMetadataAuthor("PizzaHut");
		exportConfig.setEncrypted(true);
		exportConfig.setCompressed(true);
		exportConfig.setAllowedPermissionsHint("PRINTING");
		 
		exporter.setConfiguration(reportConfig);
		exporter.setConfiguration(exportConfig);
		 
		exporter.exportReport();
		
	}
	
	
	@RequestMapping(value = "/pizzaExcel", method = RequestMethod.GET)
	public void PizzaExcel(HttpServletResponse response) throws Exception
	{
		
		try
		{

			JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(pizzaService.pizzaDetailsReport());
			
			InputStream inputStream = this.getClass().getResourceAsStream("/reports/pizzaReport.jrxml");
			JasperDesign jasperDesign = JRXmlLoader.load(inputStream);
			JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,null,dataSource);
			
			JRXlsxExporter exporter = new JRXlsxExporter();
			OutputStream os = response.getOutputStream();
			
			response.setContentType("application/x-xls");
			 response.setHeader("Content-Disposition", "attachment; filename=pizzaReport.xls");
	
			exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
		
			exporter.setExporterOutput(new SimpleOutputStreamExporterOutput("pizzaReport.xlsx"));
			exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(os));
		
			SimpleXlsxReportConfiguration reportConfig = new SimpleXlsxReportConfiguration();
			
			reportConfig.setSheetNames(new String[] { "Pizza Details" });
			reportConfig.setRemoveEmptySpaceBetweenRows(true);
			reportConfig.setRemoveEmptySpaceBetweenColumns(true);
			reportConfig.setWhitePageBackground(false);
			reportConfig.setOnePagePerSheet(true);
			reportConfig.setShrinkToFit(true);
			
			exporter.setConfiguration(reportConfig);
			exporter.exportReport();
		}
		catch(JRException e)
		{
			
		}
	}
	
	
	
	
	

	@RequestMapping(value = "/userPdf", method = RequestMethod.GET)
	public void report1(HttpServletResponse response) throws Exception
	{
		response.setContentType("application/pdf");
		 response.addHeader("content-disposition", "inline; filename=pizzaReport.pdf");

		
		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(userServiceImpl.userDetailsReport());
		InputStream inputStream = this.getClass().getResourceAsStream("/reports/userReport.jrxml");
		
		JasperDesign jasperDesign = JRXmlLoader.load(inputStream);
		JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
		
//		To avoid compiling it every time, we can save it to a file:
		JRSaver.saveObject(jasperReport, "userReport.jasper");
				
				
		Map<String, Object> item= new HashMap<String, Object>();
		
		User user = new User();
		item.put("id", user.getId());
		item.put("fname", user.getFname());
		item.put("lname",user.getLname());
		item.put("active",user.isActive());
		item.put("email",user.getEmail());
		item.put("username", user.getUsername());
		
	
		
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,item,dataSource);
		OutputStream os = response.getOutputStream();
		 
		
		JRPdfExporter exporter = new JRPdfExporter();
		 
		exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
		exporter.setExporterOutput(
		  new SimpleOutputStreamExporterOutput(os));
		 
		SimplePdfReportConfiguration reportConfig
		  = new SimplePdfReportConfiguration();
		reportConfig.setSizePageToContent(true);
		reportConfig.setForceLineBreakPolicy(false);
		
		
		SimplePdfExporterConfiguration exportConfig
		  = new SimplePdfExporterConfiguration();
		exportConfig.setMetadataAuthor("User Report");
		exportConfig.setUserPassword(exportConfig.getOwnerPassword());
		exportConfig.setMetadataTitle("User Details");
		exportConfig.setMetadataCreator("Suraj Amble");
		exportConfig.setEncrypted(true);
		exportConfig.setCompressed(true);
		
		exportConfig.setAllowedPermissionsHint("PRINTING");
		 
		exporter.setConfiguration(reportConfig);
		exporter.setConfiguration(exportConfig);
		 
		exporter.exportReport();
	}
	
	//userExcel 
	@RequestMapping(value = "/userXls", method = RequestMethod.GET)
	public void UserExel(HttpServletResponse response) throws Exception
	{
		
		try
		{

		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(userServiceImpl.userDetailsReport());
		
		InputStream inputStream = this.getClass().getResourceAsStream("/reports/userReport.jrxml");
		JasperDesign jasperDesign = JRXmlLoader.load(inputStream);
		JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,null,dataSource);
		
		JRXlsxExporter exporter = new JRXlsxExporter();
		OutputStream os = response.getOutputStream();
		
		response.setContentType("application/x-xls");
		 response.setHeader("Content-Disposition", "attachment; filename=userReport.xls");

		exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
	
		exporter.setExporterOutput(new SimpleOutputStreamExporterOutput("userReport.xlsx"));
		exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(os));
		SimpleXlsxReportConfiguration reportConfig
		  = new SimpleXlsxReportConfiguration();
		reportConfig.setSheetNames(new String[] { "User Details" });
		reportConfig.setRemoveEmptySpaceBetweenRows(true);
		reportConfig.setRemoveEmptySpaceBetweenColumns(true);
		reportConfig.setWhitePageBackground(false);
		reportConfig.setOnePagePerSheet(true);
		reportConfig.setShrinkToFit(true);
		
		exporter.setConfiguration(reportConfig);
		exporter.exportReport();
		}
		catch(JRException e)
		{
			
		}
	}
	
	

// show pizzza pages
//	@RequestMapping(value = "showAllPizza", method = RequestMethod.GET)
//	public String ShowPizzaList(ModelMap modelMap) throws Exception {
//		// index
//		modelMap.put("title", "Show Pizza List");
//		modelMap.put("AdminClickShowAllPizza", true);
//
//		return "index";
//
//	}
	

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

	// show admin profile
	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public String AdminPrivate1(ModelMap modelMap) {

		modelMap.put("user", new User());
		modelMap.put("title", "Profile");
		modelMap.put("AdminClickProfile", true);
		return "user/Profile";

	}

	// show Pie chart

	@RequestMapping(value = "pieChart", method = RequestMethod.GET)
	public String PieChart(ModelMap modelMap) {

		modelMap.put("user", new User());
		modelMap.put("title", "Pie Chart");
		modelMap.addAttribute("pass", 50);
		modelMap.addAttribute("fail", 50);
		modelMap.put("AdminClickPieChart", true);
		return "admin/admin";

	}

	/// For Deals

	@Autowired
	DealService dealService;

	@ModelAttribute("deal")
	public Deal getDeal() {
		return new Deal();
	}

	@PostMapping("/saveDeals")
	public String SaveDeals(@RequestParam("dealsImage") MultipartFile dealsImage, @ModelAttribute Deal deal,
			BindingResult result, RedirectAttributes redirectAttributes) {
		try {
					dealService.saveMyDeal(deal, dealsImage);	
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		redirectAttributes.addAttribute("deal",deal).addFlashAttribute("msg", "Deals added Successfully");
		return "redirect:/admin/AddDeals?successful/"+deal.getId();
	}

	// show AddDeals page

	@RequestMapping(value = "AddDeals", method = RequestMethod.GET)
	public ModelAndView addDeal(@RequestParam(name = "success2", required = false) String success2) {
		ModelAndView mv = new ModelAndView("admin/admin");
		mv.addObject("title", "Add New Deals");
		mv.addObject("AdminClickAddDeals", true);
		return mv;
	}

	@RequestMapping(value = "showAllDeals", method = RequestMethod.GET)
	public String ShowAddDeals(ModelMap modelMap) {
		// index
		modelMap.put("title", "Show All Deals");
		modelMap.put("AdminClickShowDeals", true);
		modelMap.put("Deals", dealService.ShowAllDeals());
					
						
				return "index";

	}

}
