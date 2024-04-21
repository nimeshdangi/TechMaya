package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.ProductModel;
import utils.StringUtils;

public class DatabaseController {
	public Connection getConnection() throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/techmaya";
		String user = "root";
		String pass = "";
		return DriverManager.getConnection(url, user, pass);
	}
	
	public ArrayList<ProductModel> getAllProducts() {
		try {
			PreparedStatement stmt = getConnection()
					.prepareStatement("SELECT * FROM products");
			ResultSet result = stmt.executeQuery();
			
			ArrayList<ProductModel> products = new ArrayList<ProductModel>();
			
			while(result.next()) {
				ProductModel product = new ProductModel();
				product.setId(Integer.parseInt(result.getString("id")));
				product.setName(result.getString("name"));
				product.setDescription(result.getString("description"));
				product.setImageUrlFromPart(result.getString("image"));
				products.add(product);
			}
			return products;
		}
		catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	public int addProduct(ProductModel product) {
		try(Connection con = getConnection()){
			int id = this.getAllProducts().size()+1;
			
			PreparedStatement st = con.prepareStatement("INSERT INTO products VALUES (?,?,?,?)");
			st.setString(1, String.valueOf(id));
			st.setString(2, product.getName());
			st.setString(3, product.getDescription());
			String location = "/resources/images/products/" + product.getImageUrlFromPart();
			st.setString(4, location);
			
			int result = st.executeUpdate();
			return result > 0 ? 1 : 0;
		}
		catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return -1;
		}
	}
}
