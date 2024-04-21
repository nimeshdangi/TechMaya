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

/**
 * This is a servlet that manages authentication checks, currently for all servlets.
 * 
 * @author Sujal Khatiwada (np01cp4a220106@islingtoncollege.edu.np)
 */
@WebFilter(asyncSupported = true, urlPatterns="/*")
public class AuthenticationFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AuthenticationFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//Cast the request and response to HttpServlet counterparts.
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		/*
		 * //The URI requested String uri = req.getRequestURI();
		 * 
		 * //Allow all requests for CSS files //possibly add in for images later. if
		 * (uri.endsWith(".css")) { chain.doFilter(request, response); return; }
		 * 
		 * boolean isLogin = uri.endsWith("login.jsp"); boolean isRegister =
		 * uri.endsWith("register.jsp"); boolean isAdmin =
		 * uri.endsWith("adminpanel.jsp");
		 * 
		 * boolean isLoginServlet = uri.endsWith("LoginServlet"); boolean
		 * isRegisterServlet = uri.endsWith("RegisterServlet");
		 * 
		 * //False so that a new session is not created. HttpSession session =
		 * req.getSession(false);
		 * 
		 * //Check if the user has logged-in boolean isLoggedIn = session != null &&
		 * session.getAttribute("username") != null;
		 * 
		 * //Check if user is an admin boolean isLoggedAsAdmin = isLoggedIn &&
		 * session.getAttribute("role") == "admin";
		 * 
		 * if (!isLoggedIn) { //if user is not logged in, redirect to different page }
		 * else { //user is logged in if(!isLoggedAsAdmin) { //if user is user } else {
		 * //if user is admin } // pass the request along the filter chain
		 * chain.doFilter(request, response); }
		 */
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
