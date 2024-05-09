package model;

public class OrderProductModel extends CartProductModel{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//Cart already has quantity
	private double total;
	
	public OrderProductModel() {
		super();
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}
}
