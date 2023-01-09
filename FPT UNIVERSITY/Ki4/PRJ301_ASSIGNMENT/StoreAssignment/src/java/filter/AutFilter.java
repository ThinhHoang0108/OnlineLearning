/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package filter;

import DAO.AccountDAO;
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
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author ADMIN
 */
@WebFilter(filterName = "AutFilter", urlPatterns = {"/carts","/delete-cart","/checkout","/update-quantity"})
public class AutFilter implements Filter {
    
  
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)//chain la thang gac cong co cho qua hay la khong
            throws IOException, ServletException {
        HttpServletRequest request1 = (HttpServletRequest) request;
        HttpServletResponse response1 = (HttpServletResponse) response;
        //Kiem tra phai dang nhap
        HttpSession session = request1.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            //chap thuan cho request qua
            chain.doFilter(request, response);
        }else{
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
            Account accountLogin = new AccountDAO().login(username, password);
            if (account != null) { //cookie hợp lệ
                session.setAttribute("account", account);
                chain.doFilter(request, response);
                return;
            }
        }
        response1.sendRedirect("http://localhost:9999/StoreAssignment/login");
        }
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
