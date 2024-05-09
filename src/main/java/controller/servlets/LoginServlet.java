package controller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;

import controller.DatabaseController;
import model.UserModel;
import utils.StringUtils;

/**
 * This is a servlet that manages login features.
 * 
 * @author Nimesh Dangi
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/LoginServlet" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DatabaseController dbController = new DatabaseController();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter(StringUtils.EMAIL);
		String password = request.getParameter(StringUtils.PASSWORD);
		
		int loginResult = dbController.getUserLoginInfo(email, password);
		System.out.println("Login Result: " + loginResult);
		
		if (loginResult == 1) {
			//Successfully login
			UserModel user = dbController.getUidAndName(email);
			String uid = user.getUid();
			String name = user.getFirstName();
			HttpSession userSession = request.getSession();
			userSession.setAttribute("userId", uid);
			userSession.setAttribute("name", name);
			userSession.setAttribute("role", "User");
			userSession.setMaxInactiveInterval(60);
						

			//String successRegisterMessage = "Successfully Registered!";
			//request.setAttribute("firstName", successRegisterMessage);
			request.setAttribute(StringUtils.SUCCESS_MESSAGE, StringUtils.SUCCESS_LOGIN_MESSAGE);
			response.sendRedirect(request.getContextPath() + StringUtils.WELCOME_PAGE);
		} else if (loginResult == 2) {
			//Successfully login
			UserModel user = dbController.getUidAndName(email);
			String name = user.getFirstName();
			String uid = user.getUid();
			
			HttpSession userSession = request.getSession();
			userSession.setAttribute("userId", uid);
			userSession.setAttribute("name", name);
			userSession.setAttribute("role", "Admin");
			userSession.setMaxInactiveInterval(60*3);

			//String successRegisterMessage = "Successfully Registered!";
			//request.setAttribute("firstName", successRegisterMessage);
			request.setAttribute(StringUtils.SUCCESS_MESSAGE, StringUtils.SUCCESS_LOGIN_MESSAGE);
			response.sendRedirect(request.getContextPath() + "/pages/adminpanel.jsp");
		} else if (loginResult ==-3) {
			//Redirect to the same register page with form data mistake
			String errorMessage = "User does not exist.";
			request.setAttribute("errorMessage", errorMessage);
			request.getRequestDispatcher(StringUtils.LOGIN_PAGE).forward(request, response);
		} else if (loginResult ==-2) {
			//Redirect to the same register page with form data mistake
			String errorMessage = "Password does not match.";
			request.setAttribute("errorMessage", errorMessage);
			request.getRequestDispatcher(StringUtils.LOGIN_PAGE).forward(request, response);
		} else if (loginResult == -1) {
            // Username not found
            request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.MESSAGE_ERROR_CREATE_ACCOUNT);
            request.getRequestDispatcher(StringUtils.LOGIN_PAGE).forward(request, response);
		} else {
			//Redirect to the same register page with server error
			String errorMessage = "An unexpected server error occurred.";
			request.setAttribute("errorMessage", errorMessage);
			request.getRequestDispatcher(StringUtils.LOGIN_PAGE).forward(request, response);
					
		}
	}

}
