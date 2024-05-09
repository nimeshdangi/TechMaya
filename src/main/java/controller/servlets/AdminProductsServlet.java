package controller.servlets;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
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
 * Servlet implementation class AdminProductsServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/AdminProductsServlet" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, //2MB //Chunks into max 2mb if size is bigger
maxFileSize = 1024 * 1024* 10, //10MB
maxRequestSize = 1024 * 1024 * 50 //50MB
)
public class AdminProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private DatabaseController databaseController = new DatabaseController();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Getting all products...");
		List<ProductModel> productsList = databaseController.getAllProducts();
		request.setAttribute("productsList",productsList);
		
		request.getRequestDispatcher("/pages/adminproducts.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("add-product-name");
		String description = request.getParameter("add-product-description");
		Double price = Double.parseDouble(request.getParameter("add-product-price"));
		int stock = Integer.parseInt(request.getParameter("add-product-stock"));
		String tag = request.getParameter("add-product-tag");
		Part imagePart = request.getPart("add-product-image");
		
		ProductModel product = new ProductModel(imagePart);
		product.setName(name);
		product.setDescription(description);
		product.setStock(stock);
		product.setPrice(price);
		product.setTag(tag);
		product.setUid(product.getRandomUid());
		
		String savePath = StringUtils.IMAGE_DIR_SAVE_PATH;
	    String fileName = product.getImageUrlFromPart();
	    if(!fileName.isEmpty() && fileName != null) {
	    	product.saveImg(savePath, fileName, imagePart);
	    }
	    //get image and convert to uid+png
		int result = databaseController.addProduct(product);
		//check here
		
		doGet(request, response);
	}

}
