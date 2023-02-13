/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author dell
 */
@WebServlet(name = "ChangePasswordController", urlPatterns = {"/ChangePasswordController"})


public class ChangePasswordController extends HttpServlet {

        private static final UserDAO DAO = new UserDAO();

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if(action.equals("reset")){
            String email = request.getParameter("email");
            request.setAttribute("email", email);
            request.getRequestDispatcher("reset.jsp").forward(request, response);
        }
        else{
            HttpSession session = request.getSession();
            User account = (User)session.getAttribute("account");
            String email = "";
            
//            request.setAttribute("email", account.getUsername());
            if(request.getParameter("email") != null && !request.getParameter("email").equals(""))
                email = request.getParameter("email");
            request.setAttribute("email", email);
            request.getRequestDispatcher("change.jsp").forward(request, response);  
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //String oldPassword = request.getParameter("oldPassword");       
        String password = request.getParameter("password");
        String twicePassword = request.getParameter("twicePassword");
        String action = request.getParameter("action");
        String email = request.getParameter("email");
        
        if(action.equals("reset")){
            
            if(!password.equals(twicePassword))
                request.setAttribute("msg", "<div style=\"color:red;text-align:center\">New password need to match reset password</div>");
            else{
                DAO.updatePassword(email, password);
                request.setAttribute("msg", "<div style=\"color:green;text-align:center\">Reset successfully,click <a href=\"http://localhost:8080/ISP392/home.jsp\" > here </a>to home page</div>");
                
            }
                request.getRequestDispatcher("reset.jsp").forward(request, response);
        }else{
            String oldPassword = request.getParameter("oldPassword");
            String passwordOfEmail = DAO.getPasswordOfEmail(email);
            if(!password.equals(twicePassword))
                request.setAttribute("msg", "<div style=\"color:red;text-align:center\">New password need to match reset password</div>");
            if(!oldPassword.equals(passwordOfEmail))
                request.setAttribute("msg", "<div style=\"color:red;text-align:center\">Wrong password</div>");
            if(password.equals(twicePassword) && oldPassword.equals(passwordOfEmail)){
                DAO.updatePassword(email, password);
                request.setAttribute("msg", "<div style=\"color:green;text-align:center\">Change successfully,click <a href=\"http://localhost:8080/ISP392/home.jsp\" > here </a>to home page</div>");
            }
            
            request.getRequestDispatcher("change.jsp").forward(request, response);
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
