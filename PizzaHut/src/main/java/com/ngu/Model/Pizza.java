package com.ngu.Model;


import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="pizza")
public class Pizza implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String pName;
	private String pType;
	private String pizzaimage;
	private double pPrice;
	private int quantity;
	private double total;
	private double cGst;
	private double sGst;
	private double totalGst;
	private double discount;
	private double TotalAfterdiscount;
	private double grandTotal;
	private String pizzaDescription;
	private String categoryName;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getPizzaimage() {
		return pizzaimage;
	}
	public void setPizzaimage(String pizzaimage) {
		this.pizzaimage = pizzaimage;
	}
	
	

	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpType() {
		return pType;
	}
	public void setpType(String pType) {
		this.pType = pType;
	}
	public double getpPrice() {
		return pPrice;
	}
	public void setpPrice(double pPrice) {
		this.pPrice = pPrice;
	}
	public int getQuantity() {
		return quantity;
	}
	
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public double getcGst() {
		return cGst;
	}
	public void setcGst(double cGst) {
		this.cGst = cGst;
	}
	public double getsGst() {
		return sGst;
	}
	public void setsGst(double sGst) {
		this.sGst = sGst;
	}
	public double getTotalGst() {
		return totalGst;
	}
	public void setTotalGst(double totalGst) {
		this.totalGst = totalGst;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public double getTotalAfterdiscount() {
		return TotalAfterdiscount;
	}
	public void setTotalAfterdiscount(double totalAfterdiscount) {
		TotalAfterdiscount = totalAfterdiscount;
	}
	public double getGrandTotal() {
		return grandTotal;
	}
	public void setGrandTotal(double grandTotal) {
		this.grandTotal = grandTotal;
	}
	public String getPizzaDescription() {
		return pizzaDescription;
	}
	public void setPizzaDescription(String pizzaDescription) {
		this.pizzaDescription = pizzaDescription;
	}
	public String getCategoryName() {
		return categoryName;
	}
	
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
		
}
