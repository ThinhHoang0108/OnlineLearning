/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package filter;

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
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author ADMIN
 */
@WebFilter(filterName = "AuthorizeFilter", urlPatterns = {"/admin/*","/accept-statusOrder","/deleteAccount","/UpdateCategoryController","/cancel-statusOrder","/accept-statusOrder"})
public class AuthorizeFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request1 = (HttpServletRequest) request;
        HttpServletResponse response1 = (HttpServletResponse) response;
        //Kiem tra phai dang nhap
        HttpSession session = request1.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null && account.getRole() == 1) {
            //cho qua
            chain.doFilter(request, response);
            return;
        }
//        request1.setAttribute("error", "You are not permission to do this work");
//        request1.getRequestDispatcher("http://localhost:9999/StoreAssignment/login").forward(request, response);
        response1.sendRedirect("http://localhost:9999/StoreAssignment/login");

    }

    @Override
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    @Override
    public void init(FilterConfig filterConfig) {

    }

}
