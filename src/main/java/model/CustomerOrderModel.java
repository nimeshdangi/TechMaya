package model;

public class CustomerOrderModel extends OrderModel{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userFirstName, userLastName;
	
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
}
