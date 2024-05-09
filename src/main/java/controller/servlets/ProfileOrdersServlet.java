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
import model.CustomerOrderModel;
import model.UserModel;

/**
 * Servlet implementation class ProfileOrdersServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ProfileOrdersServlet" })
public class ProfileOrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DatabaseController databaseController = new DatabaseController();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileOrdersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession(false); //ensuring that a new session is not created
		
		String userId = (String) session.getAttribute("userId");
		List<CustomerOrderModel> customerOrders = databaseController.getCustomerOrders(userId);
		request.setAttribute("orders", customerOrders);
		for(CustomerOrderModel cus: customerOrders) {
			System.out.println(cus.getUid());
		}
		request.getRequestDispatcher("/pages/profileorders.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
