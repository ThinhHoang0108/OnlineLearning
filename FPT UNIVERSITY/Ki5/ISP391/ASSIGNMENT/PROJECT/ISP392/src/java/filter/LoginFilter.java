/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package filter;

import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author ADMIN
 */
public class LoginFilter implements Filter {

    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;

    public LoginFilter() {
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request1 = (HttpServletRequest) request;
        HttpServletResponse response1 = (HttpServletResponse) response;
        //Kiem tra phai dang nhap
        HttpSession session = request1.getSession();
        User user = (User) session.getAttribute("account");
        if (user != null) {
            //chap thuan cho request qua
            chain.doFilter(request, response);
        } else {
            //kiểm tra cookie
            Cookie[] cookies = request1.getCookies();
            String username = null;
            String password = null;
            for (Cookie c : cookies) {
                if (c.getName().equals("username")) {
                    username = c.getValue();
                }
                if (c.getName().equals("password")) {
                    password = c.getValue();
                }
                if (username != null && password != null) {
                    break;
                }
            }

            if (username != null && password != null) {
                User userLogin = new UserDAO().login(username, password);
                if (userLogin != null) { //cookie hợp lệ
                    session.setAttribute("account", userLogin);
                    chain.doFilter(request, response);
                    return;
                }
            }
            response1.sendRedirect("http://localhost:9999/ISP392/login.jsp");
        }
    }

    @Override
    public void destroy() {
    }

    /**
     * Init method for this filter
     *
     * @param filterConfig
     */
    @Override
    public void init(FilterConfig filterConfig) {

    }

}
