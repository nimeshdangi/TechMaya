package model;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.UUID;

public class OrderModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String uid;
	private LocalDate date;
	private Double grandTotal;
	private String userId,status;
	
	
	public OrderModel() {
		
	}
	
	public OrderModel(Double grandTotal, String userId, String status) {
		//used when uid is to be auto generated
		//need to set date in dbController
		super();
		this.uid = this.getRandomUid();
		this.grandTotal = grandTotal;
		this.userId = userId;
		this.status = status;
	}
	
	public OrderModel(String uid, LocalDate date, Double grandTotal, String userId, String status) {
		super();
		this.uid = uid;
		this.date = date;
		this.grandTotal = grandTotal;
		this.userId = userId;
		this.status = status;
	}

	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}


	public Double getGrandTotal() {
		return grandTotal;
	}


	public void setGrandTotal(Double grandTotal) {
		this.grandTotal = grandTotal;
	}
	
	private String getRandomUid() {
		UUID uid = UUID.randomUUID();
		return uid.toString();
	}
	

}
