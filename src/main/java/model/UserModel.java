package model;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.UUID;

import javax.servlet.http.Part;

/**
 * This is a model class for a user.
 * 
 * @author nimesh dangi (22068093)
 */
public class UserModel implements Serializable{

	private static final long serialVersionUID = 1L;
	private String userID;
	private String firstName, lastName, email, phoneNumber, address, password;
	private LocalDate dob;
	private String gender, role;
	private Part imagePart;
	private String image;
	
	public UserModel() {
		
	}
	
	
	
	public UserModel(String firstName, String lastName, String email, String phoneNumber, String address,
			String password, LocalDate dob, String gender, String role) {
		//The constructor for registering. This auto adds a unique ID.
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.password = password;
		this.dob = dob;
		this.gender = gender;
		this.setRole(role);
		UUID uid = UUID.randomUUID();
		this.userID = uid.toString();
	}



	public UserModel(String firstName, String lastName, String gender, String email, String phoneNumber, String address, String password, String image) {
		super();
		
		this.setFirstName(firstName);
		this.setLastName(lastName);
		this.setGender(gender);
		//this.setDob(dob);
		this.setEmail(email);
		this.setPhoneNumber(phoneNumber);
		this.setAddress(address);
		this.setPassword(password);
		this.setImage(image);
		
		
	}
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
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
	public LocalDate getDob() {
		return dob;
	}
	public void setDob(LocalDate dob) {
		this.dob = dob;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}



	public String getRole() {
		return role;
	}



	public void setRole(String role) {
		this.role = role;
	}
}

