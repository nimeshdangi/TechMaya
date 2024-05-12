package model;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.Part;

import utils.StringUtils;

public class ProductModel implements Serializable{

	private static final long serialVersionUID = 1L;
	private String uid;
	private String name, description, imageUrlFromPart, tag;
	private double price;
	private int stock;
	
	public ProductModel(Part imagePart) { //look at AdminProductServlet's doPost() for info
		this.imageUrlFromPart = this.getImageUrl(imagePart);
	}



	public ProductModel(String name, String description, String imageUrlFromPart, double price, int stock, String tag) {
		super();
		//while adding product
		this.name = name;
		this.description = description;	
		this.imageUrlFromPart = imageUrlFromPart;
		this.price = price;
		this.stock = stock;
		this.uid = this.getRandomUid();
		this.setTag(tag);
	}

	public ProductModel(String uid, String name, String description, String imageUrlFromPart, double price, int stock, String tag) {
		//while updating product
		super();
		this.uid = uid;
		this.name = name;
		this.description = description;
		this.imageUrlFromPart = imageUrlFromPart;
		this.price = price;
		this.stock = stock;
		this.setTag(tag);
	}



	public ProductModel() {
		
	}
	
	public ProductModel(String uid, String name, String description, Part imagePart) {
		super();
		this.uid = uid;
		this.name = name;
		this.description = description;
		this.imageUrlFromPart = this.getImageUrl(imagePart);
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	private String getImageUrl(Part part) {
		File fileSaveDir = new File(StringUtils.IMAGE_DIR_SAVE_PATH);
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

	public String getImageUrlFromPart() {
		return imageUrlFromPart;
	}

	public void setImageUrlFromPart(String imageUrlFromPart) {
		this.imageUrlFromPart = imageUrlFromPart;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}



	public String getTag() {
		return tag;
	}



	public void setTag(String tag) {
		this.tag = tag;
	}
	
	public String getRandomUid() {
		UUID uid = UUID.randomUUID();
		return uid.toString();
	}
	
	public void saveImg(String savePath, String fileName, Part imagePart)  throws ServletException, IOException {
		String fullFilePath = savePath + fileName;
		imagePart.write(fullFilePath); //writes original file to disk
		System.out.println("Saving...");
		File fullFile = new File(fullFilePath);
    	BufferedImage productImage = ImageIO.read(fullFile); //reads original file as buffered image. cannot read webp
    	File pngImage = new File(savePath+this.getUid()+".png"); //creates an empty file as png
    	if(productImage==null) {return;} //return if imagePart was empty ->productImage
    	ImageIO.write(productImage, "png", pngImage); //transcodes the file as png
    	System.out.println("Saving to png");
    	fullFile.delete(); //deletes the original file
    	System.out.println("Deleting original img.");
    	this.setImageUrlFromPart(this.getUid()+".png"); //setting for database
	}

}
