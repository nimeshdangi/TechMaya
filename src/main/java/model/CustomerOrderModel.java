package model;

import java.util.ArrayList;

public class CustomerOrderModel extends OrderModel{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userFirstName, userLastName;
	private ArrayList<OrderProductModel> orderProducts;
	
	public CustomerOrderModel() {
		super();
	}

	public String getUserLastName() {
		return userLastName;
	}

	public void setUserLastName(String userLastName) {
		this.userLastName = userLastName;
	}

	public String getUserFirstName() {
		return userFirstName;
	}

	public void setUserFirstName(String userFirstName) {
		this.userFirstName = userFirstName;
	}

	public ArrayList<OrderProductModel> getOrderProducts() {
		return orderProducts;
	}

	public void setOrderProducts(ArrayList<OrderProductModel> orderProducts) {
		this.orderProducts = orderProducts;
	}
}
