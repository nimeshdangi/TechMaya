package controller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.DatabaseController;

/**
 * Servlet implementation class AdminDashboardServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/AdminDashboardServlet" })
public class AdminDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DatabaseController databaseController = new DatabaseController();  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDashboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("mostSoldItem", databaseController.mostSoldItem());
		request.setAttribute("highestRevenue", databaseController.highestSale());
		request.setAttribute("revenue", databaseController.totalSale());
		request.setAttribute("monthlyOrders", databaseController.monthlyOrders());
		request.getRequestDispatcher("/pages/adminpanel.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
