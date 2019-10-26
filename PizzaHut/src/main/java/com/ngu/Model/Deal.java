package com.ngu.Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="deal")
public class Deal {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String d_Name;
	
	private String dealsImage;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getD_Name() {
		return d_Name;
	}

	public void setD_Name(String d_Name) {
		this.d_Name = d_Name;
	}

	public String getDealsImage() {
		return dealsImage;
	}

	public void setDealsImage(String dealsImage) {
		this.dealsImage = dealsImage;
	}
	
	
}
