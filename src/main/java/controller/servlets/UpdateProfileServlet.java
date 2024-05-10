package controller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import controller.DatabaseController;
import model.UserModel;
import utils.StringUtils;

/**
 * Servlet implementation class UpdateProfileServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/UpdateProfileServlet" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, //2MB //Chunks into max 2mb if size is bigger
maxFileSize = 1024 * 1024* 10, //10MB
maxRequestSize = 1024 * 1024 * 50 //50MB
)
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DatabaseController databaseController = new DatabaseController();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfileServlet() {
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
		UserModel user = databaseController.getUser(userId);
		request.setAttribute("user", user);
		request.getRequestDispatcher("/pages/profileupdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession(false); //ensuring that a new session is not created
		
		String userId = (String) session.getAttribute("userId");
		
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String phoneNumber = request.getParameter("phoneNumber");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		Part imagePart = request.getPart("photoUpload");
		
		UserModel user = null;
		if (!(imagePart==null)) {//if image has been uploaded
			user = new UserModel(imagePart);
		}{
			user = new UserModel();
		}
		
		user.setUid(userId);
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setPhoneNumber(phoneNumber);
		user.setEmail(email);
		user.setAddress(address);
		
		if(!(imagePart==null)) {
			System.out.println("ImagePart is not null");
			String savePath = StringUtils.IMAGE_DIR_SAVE_PATH_CUSTOMER;
			String fileName = user.getImageUrlFromPart();
			if(!fileName.isEmpty() && fileName != null) {
				user.saveImg(savePath, fileName, imagePart);
			}
		}
		
		int result = databaseController.updateUser(user);
		response.sendRedirect(request.getContextPath() + "/ProfileServlet");
		
		
	}

}
