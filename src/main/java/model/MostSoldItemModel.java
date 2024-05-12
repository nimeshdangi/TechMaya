package model;

import java.io.Serializable;

public class MostSoldItemModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int sum;
	private String name;
	
	
	
	public MostSoldItemModel(int sum, String name) {
		super();
		this.sum = sum;
		this.name = name;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
