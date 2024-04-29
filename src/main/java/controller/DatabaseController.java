package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.OrderModel;
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
			System.out.println("DB currently has "+String.valueOf(id)+ "items.");
			PreparedStatement st = con.prepareStatement("INSERT INTO products VALUES (?,?,?,?)");
			st.setString(1, String.valueOf(id));
			st.setString(2, product.getName());
			st.setString(3, product.getDescription());
			String location = "/resources/images/products/" + product.getImageUrlFromPart();
			//add ^ ////to changeee
			st.setString(4, location);
			
			System.out.println("Saving to database...");
			
			int result = st.executeUpdate();
			return result > 0 ? 1 : 0;
		}
		catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return -1;
		}
	}
	
	public ProductModel getProduct(String id) {
		try {
		PreparedStatement stmt = getConnection()
				.prepareStatement("SELECT * FROM products WHERE id=?");
		stmt.setString(1, id);
		ResultSet result = stmt.executeQuery();
		if(result.next()) {
			ProductModel product = new ProductModel();
			product.setId(Integer.parseInt(result.getString("id")));
			product.setName(result.getString("name"));
			product.setDescription(result.getString("description"));
			product.setImageUrlFromPart(result.getString("image"));
			return product;
			
		} else {
			return null;
		}
		}
		catch(SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	public int updateProduct(ProductModel product) {
		try {
			//IGNORING IMAGE FOR NOW
			PreparedStatement stmt = getConnection()
					.prepareStatement("UPDATE products SET name=?, description=? WHERE id=?");
			stmt.setString(1, product.getName());
			stmt.setString(2, product.getDescription());
			stmt.setString(3,String.valueOf(product.getId()));
			
			int result = stmt.executeUpdate();
			return result > 0 ? 1 : 0;
			}
			catch(SQLException | ClassNotFoundException ex) {
				ex.printStackTrace();
				return -1;
			}
	}
	
	public ArrayList<OrderModel> getAllOrders() {
		try {
			PreparedStatement stmt = getConnection()
					.prepareStatement("SELECT * FROM orders");
			ResultSet result = stmt.executeQuery();
			
			ArrayList<OrderModel> orders = new ArrayList<OrderModel>();
			
			while(result.next()) {
				OrderModel order = new OrderModel();
				order.setId(Integer.parseInt(result.getString("id")));
				order.setDate(result.getDate("date").toLocalDate());
				
				order.setUser(result.getString("user"));
				order.setStatus(result.getString("status"));
				orders.add(order);
			}
			return orders;
		}
		catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return null;
		}
	}

	public int deleteProductInfo(String id) {
		try (Connection con = getConnection()) {
			PreparedStatement st = con.prepareStatement("DELETE FROM products WHERE id = ?");
			st.setString(1, id);
			return st.executeUpdate();
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace(); // Log the exception for debugging
			return -1;
		}
	}
}
