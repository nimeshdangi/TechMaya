package model;

import java.io.File;
import java.io.Serializable;

import javax.servlet.http.Part;

import utils.StringUtils;

public class ProductModel implements Serializable{

	private static final long serialVersionUID = 1L;
	private int id;
	private String name, description, imageUrlFromPart;
	
	public ProductModel(Part imagePart) { //look at AdminProductServlet's doPost() for info
		this.imageUrlFromPart = this.getImageUrl(imagePart);
	}
	
	public ProductModel() {
		
	}
	
	public ProductModel(int id, String name, String description, Part imagePart) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.imageUrlFromPart = this.getImageUrl(imagePart);
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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

}
