package controller.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.DatabaseController;
import model.OrderModel;

/**
 * Servlet implementation class AdminOrdersServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/AdminOrdersServlet" })
public class AdminOrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DatabaseController databaseController = new DatabaseController();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrdersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Getting all orders...");
		List<OrderModel> ordersList = databaseController.getAllOrders();
		request.setAttribute("ordersList",ordersList);
		System.out.println("Forwarding request...");
		
		request.getRequestDispatcher("/pages/adminorders.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
