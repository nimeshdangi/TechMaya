package controller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.DatabaseController;
import model.ProductModel;
import utils.StringUtils;

/**
 * Servlet implementation class AdminUpdateProductServlet
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
@WebServlet(asyncSupported = true, urlPatterns = { "/AdminUpdateProductServlet" })
public class AdminUpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private final DatabaseController dbController;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdateProductServlet() {
    	this.dbController = new DatabaseController();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Only gets form...
		//String productId = request.getParameter("updateId");
		//Unncessary???
		String productId = (String)request.getAttribute("productId");
		System.out.println("AdminUpdateProductServlet productID: "+productId);
		ProductModel product = dbController.getProduct(productId);
		
		request.setAttribute("product",product);
		request.getRequestDispatcher("/pages/adminupdateproduct.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("update-product-name");
		String description = request.getParameter("update-product-desc");
		String id = request.getParameter("update-product-id");
		Double price = Double.parseDouble(request.getParameter("update-product-price"));
		int stock = Integer.parseInt(request.getParameter("update-product-stock"));
		String tag = request.getParameter("update-product-tag");
		Part imagePart = request.getPart("update-product-image");
		
		ProductModel product = null;
		if (!(imagePart==null)) {//if image has been uploaded
			product = new ProductModel(imagePart);
		} else {
			product = new ProductModel();
		}
		
		product.setUid(id);
		product.setName(name);
		product.setDescription(description);
		product.setStock(stock);
		product.setPrice(price);
		product.setTag(tag);
		
		if (!(imagePart==null)){ //if image has been uploaded
			String savePath = StringUtils.IMAGE_DIR_SAVE_PATH;
		    String fileName = product.getImageUrlFromPart();
		    if(!fileName.isEmpty() && fileName != null) {
		    	product.saveImg(savePath, fileName, imagePart);
		    }
		}
		
		int result = dbController.updateProduct(product);
		response.sendRedirect(request.getContextPath() + "/AdminProductsServlet");
	}

}