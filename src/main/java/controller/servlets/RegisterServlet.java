package controller.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.DatabaseController;
import model.UserModel;
import utils.StringUtils;

/**
 * Servlet implementation class MyFirstServlet
 */
@WebServlet(asyncSupported = true, description = "my first servlet", urlPatterns = { "/RegisterServlet" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	DatabaseController dbController = new DatabaseController();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter printOut = response.getWriter();
		response.setContentType("text/html");
		response.sendRedirect(request.getContextPath() + StringUtils.REGISTER_PAGE);
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String firstName = request.getParameter(StringUtils.FIRST_NAME);
		String lastName = request.getParameter(StringUtils.LAST_NAME);
		String gender = request.getParameter(StringUtils.GENDER);
		String email = request.getParameter(StringUtils.EMAIL);
		String dobString = request.getParameter(StringUtils.BIRTHDAY);
		LocalDate dob = LocalDate.parse(dobString);
		String phoneNumber = request.getParameter(StringUtils.PHONE_NUMBER);
		String address = request.getParameter(StringUtils.ADDRESS);
		String password = request.getParameter(StringUtils.PASSWORD);
		String retypePassword = request.getParameter(StringUtils.RETYPE_PASSWORD);
		
		if(!hasOnlyAlphabets(firstName)) {
			request.setAttribute(StringUtils.ERROR_MESSAGE, "First Name must contain alphabets only");
			request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
			return;
		}
		
		if(!hasOnlyAlphabets(lastName)) {
			request.setAttribute(StringUtils.ERROR_MESSAGE, "Last Name must contain alphabets only");
			request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
			return;
		}
		
		if(!isValidNepaliPhoneNumber(phoneNumber)) {
			request.setAttribute(StringUtils.ERROR_MESSAGE, "Invalid Phone Number");
			request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
			return;
		}
		
		if(!isDateBeforeToday(dob)) {
			request.setAttribute(StringUtils.ERROR_MESSAGE, "Date must be before current date");
			request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
			return;
		}
		
		if(!hasSecurePassword(password)) {
			request.setAttribute(StringUtils.ERROR_MESSAGE, "Password is not secure");
			request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
			return;
		}
		
		UserModel userModel = new UserModel(firstName, lastName,
				gender, dob, email, phoneNumber, address, password, );
		
		int result = dbController.registerUser(userModel);
		
		
		if(this.passwordMatch(password, retypePassword)) {
			System.out.println("Query Result:" + result);
			if(result == 1) {
				request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.SUCCESS_REGISTER_MESSAGE);
				response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE);
			}
			else if(result == 0) {
				request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.ERROR_REGISTER_MESSAGE);
				request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
			}
			else if(result == -1) {
				request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.SERVER_ERROR_MESSAGE);
				request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
			}
			else if(result == -2) {
				request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.USERNAME_ERROR_MESSAGE);
				request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
			}
			else if(result == -3) {
				request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.EMAIL_ERROR_MESSAGE);
				request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
			}
			else if(result == -4) {
				request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.PHONE_NUMBER_ERROR_MESSAGE);
				request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
			}
			else {
				request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.SERVER_ERROR_MESSAGE);
				request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
			}
		} else {
			request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.PASSWORD_UNMATCHED_ERROR_MESSAGE);
			request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
		}
		/*
		if(result ==1) {
			//if succesfully added to db
			String successRegisterMessage = "Successfully Registered!";
			request.setAttribute("errorMessage", successRegisterMessage);
			response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
		} else if (result ==0) {
			//Redirect to the same register page with form data mistake
			String errorMessage = "Please correct the form data.";
			request.setAttribute("errorMessage", errorMessage);
			request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
		} else {
			//Redirect to the same register page with server error
			String errorMessage = "An unexpected server error occurred.";
			request.setAttribute("errorMessage", errorMessage);
			request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
					
		}
		*/
		
		
	}
	
	private boolean hasOnlyAlphabets(String data) {
	    Pattern pattern = Pattern.compile("[^a-zA-Z]"); // Corrected pattern
	    // If finds only alphabets, find() returns false, which we inverse
	    return !pattern.matcher(data).find();
	}
	
	private boolean hasProperUsername(String username) {
		if (username.length() < 6){return false;}
		Pattern pattern = Pattern.compile("[^a-zA-z0-9]");
		//If finds only alphanumbers, find() returns false, which we inverse
		return !pattern.matcher(username).find();
	}
	
	private boolean isValidNepaliPhoneNumber(String phoneNumber) {
        // Regex to check valid Nepali mobile number.
        // Starts with 98 followed by 8 other digits (total 10 digits)
        String regex = "^98\\d{8}$";

        // Compile the ReGex
        Pattern p = Pattern.compile(regex);

        // If the phone number is empty return false
        if (phoneNumber == null) {
            return false;
        }

        // Pattern class contains matcher() method to find matching between given phone number and regular expression.
        return p.matcher(phoneNumber).matches();
    }
	
	private boolean hasSecurePassword(String password) {
		if (password.length() < 6){return false;}
		Pattern pattern = Pattern.compile("[^a-zA-z0-9]");
		//If finds only alphanumerics, find() returns false
		//we need to find more than alphanumerics
		return pattern.matcher(password).find();
	}
	
	private boolean isDateBeforeToday(LocalDate date) {
        // Get the current date
        LocalDate today = LocalDate.now();
        
        // Check if the provided date is before today
        return date.isBefore(today);
    }
	
	private boolean passwordMatch(String password, String repassword) {
		if (password.equals(repassword)){
			return true;
		} else {
			return false;
		}
	}

}