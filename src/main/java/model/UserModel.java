package model;

import java.io.Serializable;

/**
 * This is a model class for a user.
 * 
 * @author nimesh dangi (22068093)
 */
public class UserModel implements Serializable{

	private static final long serialVersionUID = 1L;
	private String firstName, lastName, gender, email, phoneNumber, address, password;
	
	public UserModel() {
		
	}
	
	public UserModel(String firstName, String lastName, String gender, String email, String phoneNumber, String address, String password) {
		super();
		this.setFirstName(firstName);
		this.setLastName(lastName);
		this.setGender(gender);
		this.setEmail(email);
		this.setPhoneNumber(phoneNumber);
		this.setAddress(address);
		this.setPassword(password);
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}

