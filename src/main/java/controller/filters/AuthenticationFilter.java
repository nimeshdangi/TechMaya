package controller.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.StringUtils;
@WebFilter("/*")
public class AuthenticationFilter implements Filter{
	
	public AuthenticationFilter() {
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		// Cast the request and response to HttpServletRequest and HttpServletResponse
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		// Get the requested URI
		String uri = req.getRequestURI();
		System.out.println("Running filter in "+uri);

		// Immediately allows requests for CSS files and the index page to pass
		// through without further checks.
		// If you want other files to directly open, include them in this
		// condition
		//if (uri.endsWith(".css") || uri.endsWith(StringUtils.INDEX_PAGE)) {
		if (uri.endsWith(".css") || uri.endsWith(".js") || uri.endsWith(".jpg") || uri.endsWith(".jpeg") || uri.endsWith(".jfif") ||
		        uri.endsWith(".png") || uri.endsWith(".gif") || uri.endsWith(".webp") || uri.endsWith("/index.jsp") || uri.endsWith("/productdetails.jsp") || uri.endsWith("/home.jsp") || uri.endsWith("/productspecificdetails.jsp")) {
			// it delegates control to the next filter in the chain, or if this filter is
			// the last one in the chain, to the servlet that services the incoming request.
			chain.doFilter(request, response);
			return;
		}

		// Check if the requested URI indicates a login page (e.g., /login.jsp) or a register page.
		boolean isLogin = uri.endsWith(StringUtils.LOGIN_URL);
		boolean isRegister = uri.endsWith(StringUtils.REGISTER_URL);

		boolean isAdminPanel = uri.endsWith("/adminpanel.jsp");
		boolean isWelcome = uri.endsWith("welcome.jsp");
		boolean isProduct = uri.contains("product");
		// Check if the requested URI indicates a login servlet (e.g., /login)
		boolean isLoginServlet = uri.endsWith(StringUtils.LOGIN_SERVLET);  //the value in urlPatterns, so /LoginServlet 

		// Check if the requested URI indicates a logout servlet (e.g., /logout)
		boolean isLogoutServlet = uri.endsWith(StringUtils.LOGOUT_SERVLET);
		
		// Check if the requested URI indicates a register servlet (e.g., /register)
		boolean isRegisterServlet = uri.endsWith(StringUtils.REGISTER_SERVLET);

		// Attempt to retrieve the current session associated with the request.
		// If 'false' is passed as an argument and no session exists, it returns null.
		HttpSession session = req.getSession(false); //ensuring that a new session is not created

		// Check if a session exists and if the 'USERNAME' attribute is set in the
		// session.
		// If both conditions are true, it indicates that the user is logged in.
		boolean isLoggedIn = session != null && session.getAttribute("name") != null;
		// to remove session
//		session.invalidate();

		// If the user is not logged in and the requested URI does not indicate an
		// attempt to access the login page or login servlet,
		// redirect the user to the login page to authenticate.
		/*
		if (!isLoggedIn && !(isLogin || isLoginServlet)) {
			res.sendRedirect(req.getContextPath() + StringUtils.LOGIN_PAGE);
		}
		*/
//		System.out.println("Session in server: " + session.getAttribute("email"));
		
		
		if (!isLoggedIn) {
			System.out.println("From 1st if condition");
			if (!isLogin && !isLoginServlet && !isRegister && !isRegisterServlet && !isProduct) {
				res.sendRedirect(req.getContextPath() + StringUtils.LOGIN_PAGE);
			} else {
				chain.doFilter(request, response);
				return;
			}
		}
		else if(isLoggedIn && !(!isRegister || isRegisterServlet)) {
			if(session.getAttribute("role") == "Admin") {
				System.out.println("User is admin. 1st");
				res.sendRedirect(req.getContextPath() + "/pages/adminpanel.jsp");
			} else {
				res.sendRedirect(req.getContextPath() + "/pages/home.jsp");
			}
		}
		// If the user is logged in and the requested URI does not indicate an attempt
		// to access the login page or logout servlet,
		// redirect the user to the home page to prevent access to login-related pages.
		else if (isLoggedIn && !(!isLogin || isLogoutServlet)) {
			if(session.getAttribute("role") == "Admin") {
				System.out.println("User is admin. 2nd");
				res.sendRedirect(req.getContextPath() + "/pages/adminpanel.jsp");
			} else {
				res.sendRedirect(req.getContextPath() + "/pages/home.jsp");
			}
		}
		else if (isLoggedIn) {
			System.out.println(session.getAttribute("role"));
			if(session.getAttribute("role") == null) {
				if(isAdminPanel) {
					res.sendRedirect(req.getContextPath() + "/pages/home.jsp");
				} else {
					chain.doFilter(request, response);
				}
			} else if(session.getAttribute("role") == "Admin") {
				System.out.println("From role null");
				if(isAdminPanel) {
					chain.doFilter(request, response);
				}
			} else {
				if (isAdminPanel) {
					res.sendRedirect(req.getContextPath() + "/pages/home.jsp");
				}else {
					chain.doFilter(request, response);
					return;
				}
			}
		}
		
//		 If none of the above conditions are met, allow the request to continue down
//		 the filter chain.
		else {
			chain.doFilter(request, response);
			return;
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}