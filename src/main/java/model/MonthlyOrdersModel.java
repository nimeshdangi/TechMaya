package model;

import java.io.Serializable;

public class MonthlyOrdersModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int totalOrders, completedOrders, failedOrders, pendingOrders;
	
	
	public MonthlyOrdersModel(int totalOrders, int completedOrders, int failedOrders, int pendingOrders) {
		super();
		this.totalOrders = totalOrders;
		this.completedOrders = completedOrders;
		this.failedOrders = failedOrders;
		this.pendingOrders = pendingOrders;
	}

	public int getTotalOrders() {
		return totalOrders;
	}

	public void setTotalOrders(int totalOrders) {
		this.totalOrders = totalOrders;
	}

	public int getCompletedOrders() {
		return completedOrders;
	}

	public void setCompletedOrders(int completedOrders) {
		this.completedOrders = completedOrders;
	}

	public int getFailedOrders() {
		return failedOrders;
	}

	public void setFailedOrders(int failedOrders) {
		this.failedOrders = failedOrders;
	}

	public int getPendingOrders() {
		return pendingOrders;
	}

	public void setPendingOrders(int pendingOrders) {
		this.pendingOrders = pendingOrders;
	}

	

}
