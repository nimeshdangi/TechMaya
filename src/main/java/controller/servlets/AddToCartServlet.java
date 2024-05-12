package controller.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.DatabaseController;
import model.CartProductModel;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/AddToCartServlet" })
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DatabaseController databaseController = new DatabaseController();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession(false); //ensuring that a new session is not created
		
		String userId = (String) session.getAttribute("userId");
		ArrayList<CartProductModel> cartProducts = databaseController.getCartProducts(userId);
		request.setAttribute("cartProducts",cartProducts);

		request.getRequestDispatcher("/pages/cart.jsp").forward(request, response);
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession(false); //ensuring that a new session is not created
		
		String productId = request.getParameter("id");
		int quantity = Integer.parseInt(request.getParameter("product-quantity"));
		String userId = (String) session.getAttribute("userId");
		
		databaseController.AddProductToCart(userId, productId, quantity);
		response.sendRedirect("/TechMaya/ProductsServlet");
		
	}

}
