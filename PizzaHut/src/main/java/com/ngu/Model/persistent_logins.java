package com.ngu.Model;

import java.sql.Timestamp;

import javax.persistence.*;

@Entity
@Table(name="persistent_logins")
public class persistent_logins {

	private String username;
	@Id
	private String series;
	private String token;
	private Timestamp last_used;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSeries() {
		return series;
	}
	public void setSeries(String series) {
		this.series = series;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public Timestamp getLast_used() {
		return last_used;
	}
	public void setLast_used(Timestamp last_used) {
		this.last_used = last_used;
	}
	
	
	
}
