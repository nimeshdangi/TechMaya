package controller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.DatabaseController;
import model.ProductModel;
import utils.StringUtils;

/**
 * Servlet implementation class AdminUpdateProductsServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/AdminModifyProductsServlet" })
public class AdminModifyProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private final DatabaseController dbController;

	public AdminModifyProductsServlet() {
		this.dbController = new DatabaseController();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		//show form with specific product
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String updateId = request.getParameter("updateId");
		String deleteId = request.getParameter("deleteId");

		if (updateId != null && !updateId.isEmpty()) {
			doPut(request, response);
			/*
			System.out.println("AdminModifyServlet ProductID : "+updateId);
			request.setAttribute("productId", updateId);
			request.getRequestDispatcher("/AdminUpdateProductServlet").forward(request, response);
			*/
		}
		if (deleteId != null && !deleteId.isEmpty()) {
			doDelete(request, response);
		}

	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("put triggered");
		String productId = req.getParameter("updateId");
		ProductModel product = dbController.getProduct(productId);
		
		req.setAttribute("product",product);
		req.getRequestDispatcher("/pages/adminupdateproduct.jsp").forward(req, resp);
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("delete triggered");
		if (dbController.deleteProductInfo(req.getParameter("deleteId")) == 1) {
			//req.setAttribute(StringUtils.MESSAGE_SUCCESS, StringUtils.MESSAGE_SUCCESS_DELETE);
			resp.sendRedirect(req.getContextPath() + "/AdminProductsServlet");
		} else {
			//req.setAttribute(StringUtils.MESSAGE_ERROR, StringUtils.MESSAGE_ERROR_DELETE);
			resp.sendRedirect(req.getContextPath() + "/AdminProductsServlet");
		}
	}
}
