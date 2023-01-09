/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.CategoryDAO;
import DAO.GlassesDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Category;
import model.Glasses;

/**
 *
 * @author ADMIN
 */
public class CategoryController extends HttpServlet {

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
        final int PAGE_SIZE = 8;
        String sortType = request.getParameter("sortType");
        List<Category> listCategories = new CategoryDAO().getAll();
        HttpSession session = request.getSession();
        session.setAttribute("listCategories", listCategories);

        int page = 1;
        String pageStr = request.getParameter("page");
        if (pageStr != null) {
            page = Integer.parseInt(pageStr);
        }

        GlassesDAO GlassesDAO = new GlassesDAO();
        
        List<Glasses> listGlasses = GlassesDAO.getGlassesWithPagging(page, PAGE_SIZE);
        int totalGlasses = GlassesDAO.getTotalGlasses();
        int totalPage = totalGlasses / PAGE_SIZE;
        if (totalGlasses % PAGE_SIZE != 0) {
            totalPage += 1;
        }
        
        request.setAttribute("page", page);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("listGlasses", listGlasses);
        session.setAttribute("urlHistory", "category");
        request.getRequestDispatcher("shop.jsp").forward(request, response);
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
