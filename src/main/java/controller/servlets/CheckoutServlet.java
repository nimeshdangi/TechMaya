package controller.servlets;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.DatabaseController;
import model.OrderModel;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/CheckoutServlet" })
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DatabaseController databaseController = new DatabaseController();
    public CheckoutServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession(false); //ensuring that a new session is not created
		
		String userId = (String) session.getAttribute("userId");
		Double total = Double.parseDouble(request.getParameter("product-total"));
		
		OrderModel order = new OrderModel(total, userId, "Pending");
		int addOrder = databaseController.addOrder(order);
		int addOrderDetails = databaseController.addOrderDetails(order.getUid(), userId);
		int decreaseProducts = databaseController.decreaseQuantity(userId);
		int clearCart = databaseController.clearCart(userId);
		System.out.println(""+addOrder+"  "+addOrderDetails+"  "+decreaseProducts+"  "+clearCart);
		System.out.println("Redirecting to products");
		
		response.sendRedirect("/TechMaya/ProductsServlet");
		
		//2 steps
		//fill orders (total is total)
		//fill individual order_details
		//clear cart
		
	}

}
