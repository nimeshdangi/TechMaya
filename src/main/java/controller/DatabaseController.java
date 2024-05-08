package controller;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import model.OrderModel;
import model.ProductModel;
import model.PasswordEncryptionWithAes;
import model.UserModel;
import utils.StringUtils;

public class DatabaseController {
	public Connection getConnection() throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		String url = utils.Secrets.url;
		String user = utils.Secrets.user;
		String pass = utils.Secrets.pass;
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
			String location = product.getImageUrlFromPart();
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
	
	public int updateOrderStatus(OrderModel order) {
		try {
			PreparedStatement stmt = getConnection()
					.prepareStatement("UPDATE orders SET status=? WHERE id=?");
			stmt.setString(1, order.getStatus());
			stmt.setString(2, String.valueOf(order.getId()));
	
			int result = stmt.executeUpdate();
			return result > 0 ? 1 : 0;
			}
			catch(SQLException | ClassNotFoundException ex) {
				ex.printStackTrace();
				return -1;
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
	public int registerUser(UserModel userModel) {
		try(Connection con = getConnection()){
			
			PreparedStatement checkEmailSt = con.prepareStatement(StringUtils.GET_EMAIL);
			checkEmailSt.setString(1, userModel.getEmail());
			ResultSet checkEmailRs = checkEmailSt.executeQuery();
			checkEmailRs.next();
			if (checkEmailRs.getInt(1) > 0) {
				return -3; //Email already exists.
			}
			
			PreparedStatement checkPhoneSt = con.prepareStatement(StringUtils.GET_PHONE);
			checkPhoneSt.setString(1, userModel.getPhoneNumber());
			ResultSet checkPhoneRs = checkPhoneSt.executeQuery();
			checkPhoneRs.next();
			if (checkPhoneRs.getInt(1) > 0) {
				return -4; //Phone already exists.
			}
			
			PreparedStatement st = con.prepareStatement(StringUtils.INSERT_CUSTOMER);
			
			st.setString(1, userModel.getUserID());
			st.setString(2, userModel.getFirstName());
			st.setString(3, userModel.getLastName());
			st.setString(4, userModel.getEmail());
			st.setString(5, userModel.getPhoneNumber());
			st.setString(6, userModel.getAddress());
			st.setString(7, PasswordEncryptionWithAes.encrypt(userModel.getEmail(), userModel.getPassword()));
			st.setDate(8, Date.valueOf(userModel.getDob()));
			st.setString(9, userModel.getGender());
			st.setString(10, userModel.getRole());
			st.setDate(11, Date.valueOf(LocalDate.now()));
			
			int result = st.executeUpdate();
			return result > 0 ? 1 : 0;
			
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return -1;
		}
	}
	
	public int getUserLoginInfo(String email, String password) {
		try(Connection con = getConnection()){
			PreparedStatement st = con.prepareStatement(StringUtils.GET_LOGIN_USER_INFO);
			
			st.setString(1, email);
			//st.setString(2, password);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				//User name and password match in the database
				String emailDb = rs.getString("email");
				String passwordDb = rs.getString("password");
				String roleDb = rs.getString("role");
				String decryptedPwd = PasswordEncryptionWithAes.decrypt(passwordDb, email);
				System.out.println("Trying to match password");
				
				if (decryptedPwd != null && emailDb.equals(email) && decryptedPwd.equals(password) && roleDb.equals("Admin")) {
					System.out.println("Password Matched for admin");
					return 2;
				} else if (decryptedPwd != null && emailDb.equals(email) && decryptedPwd.equals(password)) {
					System.out.println("Password Matched for user");
					return 1;
				} else {
					System.out.println("Password did not match");
					return -2;
				
				}
			} else {
				System.out.println("User not available");
				return -3;
			}
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return -1;
		}
	}
	
	public UserModel getUidAndName(String email) {
		try(Connection con = getConnection()){
			PreparedStatement st = con.prepareStatement("SELECT id,first_name FROM users WHERE email=?");
			
			st.setString(1, email);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				UserModel user = new UserModel();
				user.setUserID(rs.getString("id"));
				user.setFirstName(rs.getString("first_name"));
				return user;
			} else {
				return null;
			}
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	
	
}
