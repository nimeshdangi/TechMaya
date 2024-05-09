package controller.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.DatabaseController;
import model.ProductModel;

/**
 * Servlet implementation class ProductsServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ProductsServlet" })
public class ProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DatabaseController databaseController = new DatabaseController();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductsServlet() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Getting all products...");

		List<ArrayList<ProductModel>> productsList = databaseController.getAllProductsList();
		request.setAttribute("productsListList",productsList);
		
		request.getRequestDispatcher("/pages/products.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
