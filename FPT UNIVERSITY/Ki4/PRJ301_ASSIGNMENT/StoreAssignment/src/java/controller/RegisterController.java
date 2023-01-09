/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import util.SecurityUtils;

/**
 *
 * @author ADMIN
 */
public class RegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("account");
            if (acc == null) {
                response.sendRedirect("register.jsp");
            } else {
                if (acc.getRole() == 0) {
                    response.sendRedirect("user.jsp");
                } else if (acc.getRole() == 1) {
                    response.sendRedirect("admin.jsp");
                } else {
                    response.sendRedirect("HomeController");
                }
            }

        } catch (Exception e) {
            log("Error at RegistrationController: " + e.toString());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            AccountDAO dao = new AccountDAO();
            Account account = dao.getAccountInfoByUsername(username);
            if (account != null) {
                request.setAttribute("error", "The account already exists in the system! Please use another username to login.");
                request.setAttribute("username", username);
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else {
                String fullname = request.getParameter("name");
                String phone = request.getParameter("phone");
                String password = SecurityUtils.hashMd5(request.getParameter("password"));
                boolean check = dao.insertAccount(username, password, fullname, phone, 1, 0);
                if (check) {
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            log("Error at RegistrationController: " + e.toString());
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
