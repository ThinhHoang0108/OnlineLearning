/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import Base.Base;
import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import util.SendEmail;

/**
 *
 * @author ADMIN
 */
public class RegisterController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

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
        processRequest(request, response);
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
        String fullname = request.getParameter("fullname");
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        String email = request.getParameter("email");
        UserDAO dao = new UserDAO();
        User account = dao.checkUserExist(user);
        if (account == null) {
            String subject = "Verify your account";
            String message = "<!DOCTYPE html>\n"
                    + "<html lang=\"en\">\n"
                    + "<head></head>\n"
                    + "<body style=\"color:#000;\">\n"
                    + "    <h3>Welcome to join </h3>\n"
                    + "    <p>Please click here to verify your account</p>\n"
                    + "    \n"
                    + "    <form id=\"myForm\" method=\"POST\" action=" + Base.LINK_VERIFY + ">\n"
                    + "        <input type=\"hidden\" value=" + email + " id=\"email\" name=\"email\">\n"
                    + "        <input type=\"hidden\" value=" + fullname + " id=\"name\" name=\"fullname\">\n"
                    + "        <input type=\"text\" value=" + user + " id=\"username\" name=\"username\">\n"
                    + "        <input type=\"text\" value=" + pass + " id=\"password\" name=\"password\">\n"
                    + "        <input type=\"submit\" value=\"Verify\" \n"
                    + "            style=\"padding: 10px 15px;color: #fff;background-color: rgb(0, 149, 255);border-radius: 10px;border:none\"\n"
                    + "        >\n"
                    + "    </form>\n"
                    + "\n"
                    + "    <h4>Thank you very much</h4>\n"
                    + "</body>\n"
                    + "</html>";
            SendEmail.sendMail(email,subject,message, Base.USERNAME_EMAIL, Base.PASSWORD_EMAIL);
            request.setAttribute("msg", "Verification link has been sent to your email");
            System.out.println("user: " + user);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            // day ve login
            response.sendRedirect("register.jsp");
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
