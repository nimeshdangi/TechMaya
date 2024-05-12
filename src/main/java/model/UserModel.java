package model;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.Part;

import utils.StringUtils;

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
	
	public UserModel(Part imagePart) {
		this.imageUrlFromPart = this.getImageUrl(imagePart);
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
	
	private String getImageUrl(Part part) {
		File fileSaveDir = new File(StringUtils.IMAGE_DIR_SAVE_PATH_CUSTOMER);
		String imageUrlFromPart = null;
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdirs();
		}
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				imageUrlFromPart = s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		if (imageUrlFromPart == null || imageUrlFromPart.isEmpty()) {
			imageUrlFromPart = "download.jpg";
		}
		
		return imageUrlFromPart;
	}
	
	public void saveImg(String savePath, String fileName, Part imagePart)  throws ServletException, IOException {
		String fullFilePath = savePath + fileName;
		imagePart.write(fullFilePath); //writes original file to disk
		System.out.println("Saving...");
		File fullFile = new File(fullFilePath);
    	BufferedImage userImage = ImageIO.read(fullFile); //reads original file as buffered image. cannot read webp
    	File pngImage = new File(savePath+this.getUid()+".png"); //creates an empty file as png
    	if(userImage==null) {return;} //return if imagePart was empty ->productImage
    	ImageIO.write(userImage, "png", pngImage); //transcodes the file as png
    	System.out.println("Saving to png");
    	fullFile.delete(); //deletes the original file
    	System.out.println("Deleting original img.");
    	this.setImageUrlFromPart(this.getUid()+".png"); //setting for database
	}
}

