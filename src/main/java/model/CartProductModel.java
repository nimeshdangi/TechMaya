package model;

/**
 * 
 * Extends thee product model because it needs product details, but cart also needs product quantity.
 */
public class CartProductModel extends ProductModel {

	private static final long serialVersionUID = 1L;
	
	private int quantity;
	
	public CartProductModel() {
		super();
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	

}
