package controller;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.PasswordEncryptionWithAes;
import model.UserModel;
import utils.StringUtils;

public class DatabaseController {
	public Connection getConnection() throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/techmaya";
		String user = "root";
		String pass = "";
		return DriverManager.getConnection(url, user, pass);
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
			
			PreparedStatement st = con.prepareStatement(StringUtils.INSERT_USER);
			
			st.setString(1, userModel.getFirstName());
			st.setString(2, userModel.getLastName());
			st.setString(3, userModel.getEmail());
			st.setDate(4, Date.valueOf(userModel.getDob()));
			st.setString(5, userModel.getGender());
			st.setString(6, userModel.getPhoneNumber());
			st.setString(7, userModel.getAddress());
			st.setString(8, PasswordEncryptionWithAes.encrypt(userModel.getEmail(), userModel.getPassword()));
			
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
	
	
	
}
