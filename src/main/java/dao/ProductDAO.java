package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

import utils.StringUtils;
import model.ProductModel;

public class ProductDAO {
	
	//Method start
	public Boolean addProduct(ProductModel product) throws SQLException {
		
		Connection con = DbConnection.getDbConnection();
		
		if(con != null) {
					
			String insertQuery = StringUtils.PRODUCT_INSERT_QUERY;
			
			PreparedStatement statement = con.prepareStatement(insertQuery);
			
			statement.setInt(1, product.getProduct_id());
			statement.setString(2,product.getName());
			statement.setFloat(3,product.getPrice());
			statement.setString(4, product.getDescription());
			statement.setInt(5,product.getStock_quantity());
			statement.setInt(6,product.getSupplier_id());
			statement.setString(7,product.getTags());
			statement.setString(8,product.getImages());

			int result = statement.executeUpdate();		
			
			con.close();
			
			if(result > 0) {
				return true;
			}
		}
		
		return false;
	}
	//Method end
	
	
	//Method start
	public Boolean deleteProduct(int productID) {
		
		Connection con = DbConnection.getDbConnection();
		
		if(con != null) {
			
			String deletQuery = StringUtils.PRODUCT_DELETE_QUERY;
			
			try {
				
				PreparedStatement statement = con.prepareStatement(deletQuery);
				
				statement.setInt(1, productID);
				
				int result = statement.executeUpdate();
				
				con.close();
				
				if(result > 0) {
					return true;
				}
				
			} catch (SQLException e) {
				
				
				return false;
			}

		}
		
		return false;
		
	}
	//Method end
	
	//Method start
	public Boolean updateProductDetails(ProductModel product) throws SQLException {
		
		Connection con = DbConnection.getDbConnection();
		
		String updateQuery = StringUtils.UPDATE_PRODUCT_DETAILS_QUERY;
		
		if(con != null) {
			
			PreparedStatement statement = con.prepareStatement(updateQuery);
			
			statement.setInt(1, product.getProduct_id());
			statement.setString(2,product.getName());
			statement.setFloat(3,product.getPrice());
			statement.setString(4, product.getDescription());
			statement.setInt(5,product.getStock_quantity());
			statement.setInt(6,product.getSupplier_id());
			statement.setString(7,product.getTags());
			statement.setString(8,product.getImages());
			
			int result = statement.executeUpdate();
			
			con.close();
			
			if(result > 0) {
				return true;
			}
			
		}
		
		return false;
	}
	//Method end
	
	
	//Method start
	public ProductModel getProductById(int productID) throws SQLException, IOException {
		
		Connection con = DbConnection.getDbConnection();
		
		ProductModel product = null;
		
		if(con != null) {
			
			String selectProduct = StringUtils.GET_PRODUCT_BY_ID_QUERY ;
			
			PreparedStatement statement = con.prepareStatement(selectProduct);
			
			statement.setInt(1, productID);
			
			ResultSet productFromDB = statement.executeQuery();
			
			while(productFromDB.next()) {
				
				product = new ProductModel();
				
				product.setProduct_id(productFromDB.getInt(1));
				product.setName(productFromDB.getString(2));
				product.setBrandName(productFromDB.getString(3));
				product.setProductCategory(productFromDB.getString(4));
				product.setProductImgUrl(productFromDB.getString(5));
				product.setProductPrice(productFromDB.getFloat(6));
				product.setProductRating(productFromDB.getFloat(7));
				product.setProductStock(productFromDB.getInt(8));
				
				
			}

		}
		
		con.close();
		
		return product;	
	}
	//Method end
	
	//Method start
	public static List<Product> getAllProducts(boolean filterProductUsingStock){
		
		//createing an arrray list
		
		List<Product> allProducts = new ArrayList<Product>();
		
		Connection con = DbConnection.getDbConnection();
	
		if(con != null) {
			
			try {
				
				PreparedStatement statement = con.prepareStatement(StringUtils.GET_All_PRODUCTS_QUERY);
				
				ResultSet productsFromDB = statement.executeQuery();
				
				while(productsFromDB.next()) {
					
					Product product = new Product();
					
					product.setProductID(productsFromDB.getInt(1));
					product.setProductName(productsFromDB.getString(2));
					product.setBrandName(productsFromDB.getString(3));
					product.setProductCategory(productsFromDB.getString(4));
					product.setProductImgUrl(productsFromDB.getString(5));
					product.setProductPrice(productsFromDB.getFloat(6));
					product.setProductRating(productsFromDB.getFloat(7));
					product.setProductStock(productsFromDB.getInt(8));
		            
		            /*
		             * To display in products in product page, we need to display the products with stock.
		             * If the request for all products is made from product page, the filterProductUsingStock will be true.
		             * and if the stock of product is not zero, then the product is added to array list
		             * Simultaneously, if the request is made from dashboard page, we need to display all the product whether 
		             * its quantity is zero or not.
		             * 
		             */
					if(filterProductUsingStock && product.getProductStock() != 0) {
						
						allProducts.add(product);
						
					} else if(!filterProductUsingStock) {
						
						allProducts.add(product);
						
					}
					
					
				}
				
				con.close();	
				
				return allProducts;
						
			} catch (SQLException e) {
				e.printStackTrace();
				return allProducts;
			}	
		}
		
		return allProducts;
	}
	//Method end
	
	//Method start
	public static int getProductStockByProductID(int productID) throws SQLException {
		
		Connection con = DbConnection.getDbConnection();
		
		String query = StringUtils.GET_PRODUCT_STOCK_QUERY;
		
		if(con != null) {
			
			PreparedStatement statement = con.prepareStatement(query);
			
			statement.setInt(1, productID);
			
			ResultSet queryResult = statement.executeQuery();
			
			while(queryResult.next()) {
				return queryResult.getInt(1);
			}
			
		}
		
		con.close();
		
		return 0;
		
	}
	//Method end
	
	
	//Method start
	public int manageProductStock(String stockOperation, int productID, int quantity) throws SQLException {
		
		Connection con = DbConnection.getDbConnection();
		
		String query = MyConstants.UPDATE_PRODUCT_STOCK_QUERY;
		
		if(con != null) {
			
			int productStock = getProductStockByProductID(productID);
			
			PreparedStatement statement = con.prepareStatement(query);
			
			//setting product id in query
			statement.setInt(2, productID);
						
			// Stock will increase if the user delete the item from cart before purchasing it
			if(stockOperation.equals("INCREASE STOCK")) {
				
				// setting stock in query
				statement.setInt(1, productStock + quantity);
				
			}
			// Stock will decrease if the user add or update the quantity of cart items
			else if(stockOperation.equals("DECREASE STOCK")) {
				
				// setting stock in query
				statement.setInt(1, productStock - quantity);
				
			}

			int queryResult = statement.executeUpdate();
			
			if(queryResult > 0) {
				return queryResult;
			}
			
		}
		
		return 0;
		
	}
	//Method end
	

	
}