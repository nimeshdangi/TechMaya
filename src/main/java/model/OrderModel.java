package model;

import java.io.Serializable;
import java.time.LocalDate;

public class OrderModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private LocalDate date;
	private String user,status;
	
	
	public OrderModel() {
		
	}
	
	public OrderModel(int id, LocalDate date, String user, String status) {
		super();
		this.id = id;
		this.date = date;
		this.user = user;
		this.status = status;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	

}
