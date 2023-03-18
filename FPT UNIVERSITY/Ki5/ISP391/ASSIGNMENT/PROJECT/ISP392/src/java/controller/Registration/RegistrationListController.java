/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Registration;

import Base.Base;
import DAO.RegisterDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Register;
import model.User;

/**
 *
 * @author ADMIN
 */
public class RegistrationListController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            User account = (User) session.getAttribute("account");
            int page = 1;
            String pageIndex = request.getParameter("page");
            if (pageIndex != null) {
                page = Integer.parseInt(pageIndex);
            }
            RegisterDAO dao = new RegisterDAO();
            int totalRegister = dao.getTotalRegister();
            int totalPage = totalRegister / Base.PAGE_SIZE;
            if (totalRegister % Base.PAGE_SIZE != 0) {
                totalPage += 1;
            }
            List<Register> listRegister = new RegisterDAO().getAllRegistration(account.getUserID());
            request.getSession().setAttribute("listRegister", listRegister);
            List<Register> listRegisterByPageing = dao.getAllRegisterByPage(page, Base.PAGE_SIZE, account.getUserID());
            request.getSession().setAttribute("listRegisterByPageing", listRegisterByPageing);
            request.setAttribute("page", page);
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("pagination_url", "registration-list?");
            request.getRequestDispatcher("myRegistration.jsp").forward(request, response);

        }
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
        processRequest(request, response);
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
