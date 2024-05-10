package controller;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import model.CartProductModel;
import model.CustomerOrderModel;
import model.MonthlyOrdersModel;
import model.MostSoldItemModel;
import model.OrderModel;
import model.OrderProductModel;
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
	
	/**
	 * This method gets all products from the products table.
	 * @return products - an arraylist of ProductModel
	 */
	public ArrayList<ProductModel> getAllProducts() {
		try {
			PreparedStatement stmt = getConnection()
					.prepareStatement("SELECT * FROM products");
			
			ResultSet result = stmt.executeQuery();
			
			ArrayList<ProductModel> products = new ArrayList<ProductModel>();
			
			while(result.next()) {
				ProductModel product = new ProductModel();
				product.setUid(result.getString("id"));
				product.setName(result.getString("name"));
				product.setPrice(result.getDouble("price"));
				product.setDescription(result.getString("description"));
				product.setTag(result.getString("tag"));
				product.setStock(result.getInt("stock"));				
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
	
	/**
	 * This method gets all list of products (list made based on tag) from the products table.
	 * @return productsList - an arraylist of arraylist of  ProductModel
	 */
	public ArrayList<ArrayList<ProductModel>> getAllProductsList() {
		try {
			ArrayList<ArrayList<ProductModel>> productsList = new ArrayList<ArrayList<ProductModel>>();
			for(String tag:StringUtils.PRODUCT_TAGS) { //gets a list of products with a specific tag, looping
				PreparedStatement stmt = getConnection()
						.prepareStatement("SELECT * FROM products WHERE tag=?");
				stmt.setString(1, tag);
				
				ResultSet result = stmt.executeQuery();
				
				ArrayList<ProductModel> products = new ArrayList<ProductModel>();
				
				while(result.next()) {
					ProductModel product = new ProductModel();
					product.setUid(result.getString("id"));
					product.setName(result.getString("name"));
					product.setPrice(result.getDouble("price"));
					product.setDescription(result.getString("description"));
					product.setTag(result.getString("tag"));
					product.setStock(result.getInt("stock"));				
					product.setImageUrlFromPart(result.getString("image"));
					products.add(product);
				}
				productsList.add(products);
			}
			return productsList;
			
		}
		catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	
	/**
	 * This method adds a product into the products table.
	 * @param product - An instance of ProductModel class.
	 * @return result - an integer specifying whether the insertion was successful or not.
	 * 
	 */
	public int addProduct(ProductModel product) {
		try(Connection con = getConnection()){
			int total = this.getAllProducts().size()+1;
			System.out.println("DB currently has "+String.valueOf(total)+ "items.");
			PreparedStatement st = con.prepareStatement("INSERT INTO products VALUES (?,?,?,?,?,?,?)");
			st.setString(1, product.getUid());
			st.setString(2, product.getName());
			st.setDouble(3, product.getPrice());
			st.setString(4, product.getDescription());
			st.setInt(5, product.getStock());
			st.setString(6,product.getTag());
			String img = product.getImageUrlFromPart();
			st.setString(7, img);
			System.out.println("tag is: "+product.getTag());
			System.out.println("Saving to database...");
			
			int result = st.executeUpdate();
			return result > 0 ? 1 : 0;
		}
		catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return -1;
		}
	}
	/**
	 * This method gets a product from the product table.
	 * @param id - A String representing a product id.
	 * @return product - A product model of the specified product.
	 * 
	 */
	public ProductModel getProduct(String id) {
		try {
		PreparedStatement stmt = getConnection()
				.prepareStatement("SELECT * FROM products WHERE id=?");
		stmt.setString(1, id);
		ResultSet result = stmt.executeQuery();
		if(result.next()) {
			ProductModel product = new ProductModel();
			//product.setUid((result.getString("id")));
			product.setUid(id);
			product.setName(result.getString("name"));
			product.setDescription(result.getString("description"));
			product.setPrice(result.getDouble("price"));
			product.setStock(result.getInt("stock"));
			product.setImageUrlFromPart(result.getString("image"));
			product.setTag(result.getString("tag"));
			
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
	
	/**
	 * This method gets a list product from the product table based on tags, excluding the given uid.
	 * This is done to get similar products.
	 * @param tag - A String representing a product tag.
	 * @param uid - A string representing a product id.
	 * @return products - A list of product model.
	 * 
	 */
	public ArrayList<ProductModel> getProductByTagExcludingId(String tag, String uid) {
		try {
		PreparedStatement stmt = getConnection()
				.prepareStatement("SELECT * FROM products WHERE tag=? AND NOT id=?");
		stmt.setString(1, tag);
		stmt.setString(2, uid);
		ResultSet result = stmt.executeQuery();
		
		ArrayList<ProductModel> products = new ArrayList<ProductModel>();
		
		while(result.next()) {
			ProductModel product = new ProductModel();
			product.setUid(result.getString("id"));
			product.setName(result.getString("name"));
			product.setPrice(result.getDouble("price"));
			product.setDescription(result.getString("description"));
			product.setTag(result.getString("tag"));
			product.setStock(result.getInt("stock"));				
			product.setImageUrlFromPart(result.getString("image"));
			products.add(product);
		}
		return products;
			
		}
		catch(SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	
	/**
	 * This method updates a product in the products table.
	 * @param product - An instance of ProductModel class.
	 * @return result - an integer specifying whether the insertion was successful or not.
	 * 
	 */
	public int updateProduct(ProductModel product) {
		try {
			//IGNORING IMAGE FOR NOW
			PreparedStatement st = getConnection()
					.prepareStatement("UPDATE products SET name=?, description=?, price=?,stock=?,tag=? WHERE id=?");
			st.setString(1, product.getName());
			st.setString(2, product.getDescription());
			st.setDouble(3, product.getPrice());
			st.setInt(4, product.getStock());
			st.setString(5,product.getTag()); //no need to update img as uid does not change
			st.setString(6,product.getUid());
			
			int result = st.executeUpdate();
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
			
			st.setString(1, userModel.getUid());
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
				user.setUid(rs.getString("id"));
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
	
	//Cart Functionalities
	public int AddProductToCart(String userId, String productId, int quantity) {
		try(Connection con = getConnection()){

			if (this.productExistsInCart(userId, productId)) {
				System.out.println("Item already exists in cart!!!");
				this.UpdateProductInCart(userId, productId, quantity); //quantity is 1 in products page
				return 1;
			}
			
			PreparedStatement st = con.prepareStatement("INSERT INTO cart VALUES (?,?,?)");
			st.setString(1, userId);
			st.setString(2, productId);
			st.setInt(3, quantity);
			int result = st.executeUpdate();
			return result > 0 ? 1 : 0;
		}
		catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return -1;
		}
		
	}
	
	public int UpdateProductInCart(String userId, String productId, int quantity) {
		try(Connection con = getConnection()){
			
			PreparedStatement st = con.prepareStatement("UPDATE cart SET quantity=? WHERE customer_id = ? AND product_id = ?");
			st.setInt(1, quantity);
			st.setString(2, userId);
			st.setString(3, productId);
			int result = st.executeUpdate();
			return result > 0 ? 1 : 0;
		}
		catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return -1;
		}
		
	}
	
	public boolean productExistsInCart(String userId, String productId) {
		try(Connection con = getConnection()){
			PreparedStatement st = con.prepareStatement("SELECT COUNT(*) FROM cart WHERE customer_id = ? AND product_id = ?");
			st.setString(1, userId);
			st.setString(2, productId);

			ResultSet result = st.executeQuery();
			result.next();
			if(result.getInt(1)>0) {
				return true; //product exists
			} else {
				return false;
			}
		}
		catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	private int getQuantityinCart(String userId, String productId) {
		try(Connection con = getConnection()){
			PreparedStatement st = con.prepareStatement("SELECT quantity FROM cart WHERE customer_id = ? AND product_id = ?");
			st.setString(1, userId);
			st.setString(2, productId);

			ResultSet result = st.executeQuery();
			if(result.next()) {
				return result.getInt("quantity");
			} else {
				return 0;
			}
		}
		catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return 0;
		}
	}
	
	public ArrayList<CartProductModel> getCartProducts(String userId) {
		try(Connection con = getConnection()){
			PreparedStatement st = con.prepareStatement(
					"SELECT products.id uid, products.name productName, products.stock productStock, products.price productPrice, cart.quantity productQuantity "
					+ "FROM products, cart "
					+ "WHERE customer_id=?"
					+ "AND products.id=cart.product_id"
					);
			st.setString(1, userId);
			ArrayList<CartProductModel> cartProducts = new ArrayList<CartProductModel>();
			
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				CartProductModel cartProduct = new CartProductModel();
				cartProduct.setUid(rs.getString("uid"));
				cartProduct.setName(rs.getString("productName"));
				cartProduct.setStock(rs.getInt("productStock"));
				cartProduct.setPrice(rs.getDouble("productPrice"));
				cartProduct.setQuantity(rs.getInt("productQuantity"));
				cartProducts.add(cartProduct);
				
				System.out.println(cartProduct.getUid());
			}
			return cartProducts;
		}
		catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	public int addOrder(OrderModel order) {
		try(Connection con = getConnection()){
			PreparedStatement st = con.prepareStatement("INSERT INTO orders VALUES (?,?,?,?,?)");
			st.setString(1, order.getUid());
			st.setString(2, order.getUserId());
			st.setDouble(3,order.getGrandTotal());
			st.setDate(4, Date.valueOf(LocalDate.now()));
			st.setString(5, order.getStatus());
			int result = st.executeUpdate();
			return result > 0 ? 1 : 0;
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return -1;
		}
	}
	
	public int addOrderDetails(String orderId, String userId) {
		try(Connection con = getConnection()){
			int result = 0;
			ArrayList<CartProductModel> cartProducts = this.getCartProducts(userId);
			for(CartProductModel cartProduct: cartProducts) {
				PreparedStatement st = con.prepareStatement("INSERT INTO order_details VALUES (?,?,?,?)");
				st.setString(1, orderId);
				st.setString(2, cartProduct.getUid());
				st.setInt(3,cartProduct.getQuantity());
				st.setDouble(4,cartProduct.getPrice() * cartProduct.getQuantity());
				result = st.executeUpdate();
				result = result > 0 ? 1 : 0;
			}
			return result;
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return -1;
		}
		
	}
	
	public int getProductStock(String productId) {
		try(Connection con = getConnection()){
			PreparedStatement st = con.prepareStatement("SELECT stock FROM products WHERE id = ?");
			st.setString(1, productId);

			ResultSet result = st.executeQuery();
			if(result.next()) {
				return result.getInt("stock");
			} else {
				return 0;
			}
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return -1;
		}
	}
	
	public int decreaseQuantity(String userId) {
		try(Connection con = getConnection()){
			int result = 0;
			ArrayList<CartProductModel> cartProducts = this.getCartProducts(userId);
			for(CartProductModel cartProduct: cartProducts) {
				PreparedStatement st = con.prepareStatement("UPDATE products SET stock=? WHERE id=?");
				int productStock = this.getProductStock(cartProduct.getUid()); //need to ensure set quantity < stock
				System.out.println("For id:"+cartProduct.getUid()+"\nproductStock is "+productStock);
				st.setInt(1, productStock - cartProduct.getQuantity());
				st.setString(2, cartProduct.getUid());
				result = st.executeUpdate();
				result = result > 0 ? 1 : 0;
			}
			return result;
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return -1;
		}
	}
	
	public int clearCart(String userId) {
		try(Connection con = getConnection()){
			PreparedStatement st = con.prepareStatement("DELETE FROM cart WHERE customer_id=?");
			st.setString(1, userId);
			int result = st.executeUpdate();
			return result > 0 ? 1: 0;
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return -1;
		}
	}
	
	public int deleteFromCart(String userId, String productId) {
		try(Connection con = getConnection()){
			PreparedStatement st = con.prepareStatement("DELETE FROM cart WHERE customer_id=? AND product_id=?");
			st.setString(1, userId);
			st.setString(2, productId);
			int result = st.executeUpdate();
			return result > 0 ? 1: 0;
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return -1;
		}
	}
	
	public UserModel getUser(String userId) {
		try(Connection con = getConnection()){
			PreparedStatement st = con.prepareStatement("SELECT * FROM users WHERE id = ?");
			st.setString(1, userId);

			ResultSet result = st.executeQuery();
			UserModel user = new UserModel();
			if(result.next()) {
				user.setUid(userId);
				user.setFirstName(result.getString("first_name"));
				user.setLastName(result.getString("last_name"));
				user.setEmail(result.getString("email"));
				user.setPhoneNumber(result.getString("phone_number"));
				user.setAddress(result.getString("address"));
			}
			return user;
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	public ArrayList<CustomerOrderModel> getCustomerOrders(String userId) {
		//for an individual customer 
		try(Connection con = getConnection()){
			PreparedStatement st = con.prepareStatement("SELECT o.id, o.grand_total, o.date, o.status "
					+ "FROM users u, orders o WHERE u.id=? AND u.id = o.customer_id");
			st.setString(1, userId);

			ResultSet result = st.executeQuery();
			ArrayList<CustomerOrderModel> customerOrders = new ArrayList<CustomerOrderModel>();
			while(result.next()) {
				CustomerOrderModel customerOrder = new CustomerOrderModel();
				customerOrder.setUid(result.getString("id"));
				customerOrder.setGrandTotal(result.getDouble("grand_total"));
				customerOrder.setDate(result.getDate("date").toLocalDate());
				customerOrder.setStatus(result.getString("status"));
				customerOrder.setOrderProducts(this.getOrderProducts(customerOrder.getUid())); //order-id
				customerOrders.add(customerOrder);
			}
			return customerOrders;
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	public ArrayList<OrderProductModel> getOrderProducts(String orderId){
		try {
			PreparedStatement stmt = getConnection()
					.prepareStatement("SELECT p.name, od.product_id, od.total, od.quantity"
							+ " FROM products p, order_details od WHERE od.order_id=? AND p.id = od.product_id");
			stmt.setString(1, orderId);
			ResultSet result = stmt.executeQuery();
			
			ArrayList<OrderProductModel> orderProducts = new ArrayList<OrderProductModel>();
			
			while(result.next()) {
				OrderProductModel orderProduct = new OrderProductModel();
				orderProduct.setUid(result.getString("product_id")); //product-id
				orderProduct.setTotal(result.getDouble("total"));
				orderProduct.setQuantity(result.getInt("quantity"));
				orderProduct.setName(result.getString("name"));
				orderProducts.add(orderProduct);
			}
			return orderProducts;
		}
		catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	/**
	 * This method gets all orders in the orders table.
	 * @return orders - an arraylist of OrderModel instances.
	 * 
	 */
	public ArrayList<CustomerOrderModel> getAllCustomerOrders() {
		try {
			PreparedStatement stmt = getConnection()
					.prepareStatement("SELECT u.first_name, u.last_name, o.id, o.grand_total, o.date, o.status"
							+ " FROM users u, orders o WHERE u.id = o.customer_id");
			ResultSet result = stmt.executeQuery();
			
			ArrayList<CustomerOrderModel> customerOrders = new ArrayList<CustomerOrderModel>();
			
			while(result.next()) {
				CustomerOrderModel customerOrder = new CustomerOrderModel();
				customerOrder.setUid(result.getString("id"));
				customerOrder.setUserFirstName(result.getString("first_name"));
				customerOrder.setUserLastName(result.getString("last_name"));
				customerOrder.setGrandTotal(result.getDouble("grand_total"));
				customerOrder.setDate(result.getDate("date").toLocalDate());
				customerOrder.setStatus(result.getString("status"));
				customerOrders.add(customerOrder);
			}
			return customerOrders;
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
			stmt.setString(2, order.getUid());
	
			int result = stmt.executeUpdate();
			return result > 0 ? 1 : 0;
			}
			catch(SQLException | ClassNotFoundException ex) {
				ex.printStackTrace();
				return -1;
			}
	}
	
	public ArrayList<ProductModel> getFilteredProducts(String name, int minPrice, int MaxPrice){
		try {
			PreparedStatement stmt = getConnection()
					.prepareStatement("SELECT * FROM products WHERE LOWER(name) LIKE LOWER(?) AND price > ? AND price < ?");
			stmt.setString(1, "%" + name.toLowerCase() + "%");
			stmt.setInt(2, minPrice);
			stmt.setInt(3, MaxPrice);
			ResultSet result = stmt.executeQuery();
			
			ArrayList<ProductModel> products = new ArrayList<ProductModel>();
			
			while(result.next()) {
				ProductModel product = this.productFromResultSet(result);
				products.add(product);
			}
			return products;
				
			}
			catch(SQLException | ClassNotFoundException ex) {
				ex.printStackTrace();
				return null;
			}
	}
		
	private ProductModel productFromResultSet(ResultSet result) {
		try {
		ProductModel product = new ProductModel();
		product.setUid(result.getString("id"));
		product.setName(result.getString("name"));
		product.setPrice(result.getDouble("price"));
		product.setDescription(result.getString("description"));
		product.setTag(result.getString("tag"));
		product.setStock(result.getInt("stock"));				
		product.setImageUrlFromPart(result.getString("image"));
		return product;
		
		}catch(SQLException ex) {
			ex.printStackTrace();
			return null;
		}
	}

	public int updateUser(UserModel user) {
		try {
			PreparedStatement st = getConnection()
					.prepareStatement("UPDATE users SET first_name=?, last_name=?, email=?,address=?,phone_number=? WHERE id=?");
			st.setString(1, user.getFirstName());
			st.setString(2, user.getLastName());
			st.setString(3, user.getEmail());
			st.setString(4, user.getAddress());
			st.setString(5,user.getPhoneNumber()); 
			st.setString(6,user.getUid());
			
			int result = st.executeUpdate();
			return result > 0 ? 1 : 0;
			}
			catch(SQLException | ClassNotFoundException ex) {
				ex.printStackTrace();
				return -1;
			}
	}
	
	//Admin Dashboard
	public double highestSale() {
		try {
			PreparedStatement st = getConnection()
					.prepareStatement("SELECT grand_total FROM `orders` where MONTH(date)=MONTH(now()) GROUP BY grand_total desc LIMIT 1");
			ResultSet result = st.executeQuery();
			if (result.next()) {
				return result.getDouble("grand_total");
			} else {
				return 0;
			}
			}
			catch(SQLException | ClassNotFoundException ex) {
				ex.printStackTrace();
				return -1;
			}
	}
	
	public double totalSale() {
		try {
			PreparedStatement st = getConnection()
					.prepareStatement("SELECT SUM(grand_total) sum FROM `orders` where MONTH(date)=MONTH(now())");
			ResultSet result = st.executeQuery();
			if (result.next()) {
				return result.getDouble("sum");
			} else {
				return 0;
			}
			}
			catch(SQLException | ClassNotFoundException ex) {
				ex.printStackTrace();
				return -1;
			}
	}
	
	public MostSoldItemModel mostSoldItem() {
		try {
			PreparedStatement st = getConnection()
					.prepareStatement("SELECT p.name name, SUM(od.quantity) sum FROM order_details od, orders o, products p where MONTH(o.date)=MONTH(now()) AND o.id=od.order_id AND p.id = od.product_id GROUP BY od.product_id ASC LIMIT 1");
			ResultSet result = st.executeQuery();
			if (result.next()) {
				return new MostSoldItemModel(result.getInt("sum"), result.getString("name"));
			} else {
				return new MostSoldItemModel(0,"");
			}
			}
			catch(SQLException | ClassNotFoundException ex) {
				ex.printStackTrace();
				return new MostSoldItemModel(0,"");
			}
	}
	
	public MonthlyOrdersModel monthlyOrders() {
		try {
			PreparedStatement st = getConnection()
					.prepareStatement("SELECT COUNT(*) total, (SELECT COUNT(*) FROM orders WHERE orders.status='Completed') completed, (SELECT COUNT(*) FROM orders WHERE orders.status='Failed') failed,(SELECT COUNT(*) FROM orders WHERE orders.status='Pending') pending FROM orders");
			ResultSet result = st.executeQuery();
			if (result.next()) {
				int total = result.getInt("total");
				int completed = result.getInt("completed");
				int failed = result.getInt("failed");
				int pending = result.getInt("pending");
				
				return new MonthlyOrdersModel(total,completed,failed,pending);
			} else {
				return new MonthlyOrdersModel(0,0,0,0);
			}
			}
			catch(SQLException | ClassNotFoundException ex) {
				ex.printStackTrace();
				return new MonthlyOrdersModel(0,0,0,0);
			}
	}
	
	
	
}
