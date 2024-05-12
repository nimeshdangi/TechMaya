package controller.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.DatabaseController;
import model.CustomerOrderModel;
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
		List<CustomerOrderModel> ordersList = databaseController.getAllCustomerOrders();
		request.setAttribute("ordersList",ordersList);
		System.out.println("Forwarding request...");
		
		request.getRequestDispatcher("/pages/adminorders.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Updates order status
		String status = request.getParameter("status");
		String id = request.getParameter("id");
		
		OrderModel order = new OrderModel();
		order.setStatus(status);
		order.setUid(id);
		int result = databaseController.updateOrderStatus(order);
		doGet(request, response);
	}

}
