package controller.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.DatabaseController;
import model.ProductModel;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ProductServlet" })
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DatabaseController databaseController = new DatabaseController();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Getting product...");
		String uid = request.getParameter("id"); //from query param
		ProductModel product = databaseController.getProduct(uid);
		request.setAttribute("product",product);
		
		List<ProductModel> products = databaseController.getProductByTagExcludingId(product.getTag(), uid);
		request.setAttribute("similarProducts", products);
		
		request.getRequestDispatcher("/pages/productdetails.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response); //needed for ?query=param
	}
}
