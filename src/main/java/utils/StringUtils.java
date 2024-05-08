package utils;

import java.io.File;

public class StringUtils {
	public static final String USER_NAME = "username"; //also used in session
	public static final String FIRST_NAME = "first_name";
	public static final String LAST_NAME = "last_name";
	public static final String BIRTHDAY = "dob";
	public static final String GENDER = "gender";
	public static final String EMAIL = "email";
	public static final String PHONE_NUMBER = "phone";
	public static final String ADDRESS = "address";
	public static final String PASSWORD = "password";
	public static final String RETYPE_PASSWORD = "retypePassword";
		
	public static final String SUCCESS_LOGIN_MESSAGE = "Successfully logged in!";
	//Week 5
	public static final String ERROR_MESSAGE = "errorMessage";
	public static final String SUCCESS_MESSAGE = "successMessage";
	public static final String SUCCESS_REGISTER_MESSAGE = "Successfully Registered!";
	public static final String ERROR_REGISTER_MESSAGE = "Please correct the form data.";
	public static final String SERVER_ERROR_MESSAGE = "An unexpected server error occurred.";
	public static final String USERNAME_ERROR_MESSAGE = "Username is already regsitered.";
	public static final String EMAIL_ERROR_MESSAGE = "Email is already registered.";
	public static final String PHONE_NUMBER_ERROR_MESSAGE = "Phone number is already registered.";
	public static final String PASSWORD_UNMATCHED_ERROR_MESSAGE = "Password is not matched.";
	public static final String MESSAGE_ERROR_CREATE_ACCOUNT = "Account for this username is not registered! Please create a new account.";
	
	public static final String LOGIN_PAGE = "/pages/login.jsp";
    public static final String REGISTER_PAGE = "/pages/register.jsp";
    public static final String WELCOME_PAGE = "/pages/welcome.jsp";
    public static final String HOME_PAGE = "/pages/home.jsp";
    public static final String INDEX_PAGE = "/pages/index.jsp";
    
    public static final String LOGIN_URL = "/login.jsp";
    public static final String REGISTER_URL = "/register.jsp";
    
    public static final String LOGIN_SERVLET = "/LoginServlet";
    public static final String REGISTER_SERVLET = "/RegisterServlet";
    public static final String LOGOUT_SERVLET = "/LogoutServlet";
	
	public static final String INSERT_USER = "INSERT INTO users" +
			"(first_name, last_name, email, dob, gender, Phone_number, Address, Password, Registration_Date)" +
			"VALUES (?,?,?,?,?,?,?,?,NOW())";
	
	
	public static final String GET_LOGIN_USER_INFO = "SELECT * FROM users WHERE email = ?";
	
	public static final String GET_ALL_STUDENT_INFO = "SELECT * FROM student_management";
	
	//Wek 5
	public static final String GET_USERNAME = "SELECT COUNT(*) FROM users WHERE user_name = ?";
	public static final String GET_PHONE  = "SELECT COUNT(*) FROM users WHERE Phone_number = ?";
	public static final String GET_EMAIL = "SELECT COUNT(*) FROM users WHERE email = ?";
	
	public static final String LOGIN = "Login";
	public static final String LOGOUT = "Logout";

	public static final String IMAGE_DIR_USER = "EclipseJava\\TechMaya\\src\\main\\webapp\\resources\\images\\products\\";

	public static final String IMAGE_DIR_SAVE_PATH = "D:" + File.separator + IMAGE_DIR_USER;
}
