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
	private String uid;
	private String firstName, lastName, email, phoneNumber, address, password;
	private LocalDate dob;
	private String gender, role;
	private String imageUrlFromPart;
	
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
		this.uid = uid.toString();
	}

	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
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




	public String getRole() {
		return role;
	}



	public void setRole(String role) {
		this.role = role;
	}



	public String getImageUrlFromPart() {
		return imageUrlFromPart;
	}



	public void setImageUrlFromPart(String imageUrlFromPart) {
		this.imageUrlFromPart = imageUrlFromPart;
	}
}

