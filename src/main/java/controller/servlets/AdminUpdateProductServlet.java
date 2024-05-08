package controller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.DatabaseController;
import model.ProductModel;

/**
 * Servlet implementation class AdminUpdateProductServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/AdminUpdateProductServlet" })
public class AdminUpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private final DatabaseController dbController;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdateProductServlet() {
    	this.dbController = new DatabaseController();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Only gets form...
		//String productId = request.getParameter("updateId");
		//Unncessary???
		String productId = (String)request.getAttribute("productId");
		System.out.println("AdminUpdateProductServlet productID: "+productId);
		ProductModel product = dbController.getProduct(productId);
		
		request.setAttribute("product",product);
		request.getRequestDispatcher("/pages/adminupdateproduct.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("update-product-name");
		String description = request.getParameter("update-product-desc");
		String id = request.getParameter("update-product-id");
		
		ProductModel product = new ProductModel(); //doing this since ID is added inside DatabaseController
		product.setId(Integer.parseInt(id)); //cannot parse null string re
		product.setName(name);
		product.setDescription(description);
		
		int result = dbController.updateProduct(product);
		response.sendRedirect(request.getContextPath() + "/AdminProductsServlet");
	}

}