/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import DAO.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Map;

/**
 *
 * @author ADMIN
 */
public class UpdateCategoryController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            String action = request.getParameter("action");
            CategoryDAO cateDAO = new CategoryDAO();
            if (action != null) {
                if (action.equals("createCategory")) {
                    String cateName = request.getParameter("cateName");
                    boolean check1 = cateDAO.insertNewCategory(cateName);
                    if (check1) {
                        Map<Integer, String> listCategories = (Map<Integer, String>) cateDAO.getAll();
                        session.setAttribute("listCategories", listCategories);
                        request.setAttribute("MSG_SUCCESS", "You have successfully create new category!");
                    } else {
                        request.setAttribute("MSG_ERROR", "You have failed to create new category!");
                    }
                } else if (action.equals("updateCategory")) {
                    int cateId = Integer.parseInt(request.getParameter("cateId"));
                    String cateName = request.getParameter("cateName");
                    boolean check1 = cateDAO.updateCategoryInfo(cateId, cateName);
                    if (check1) {
                        Map<Integer, String> listCategories = (Map<Integer, String>) cateDAO.getAll();
                        session.setAttribute("listCategories", listCategories);
                        request.setAttribute("MSG_SUCCESS", "You have successfully updated the category information!");
                    } else {
                        request.setAttribute("MSG_ERROR", "You have failed to update category information!");
                    }
                }
            } else {
                request.setAttribute("MSG_ERROR", "Oops, something went wrong! Try later!");
            }
        } catch (Exception e) {
            log("Error at UpdateCategoryController: " + e.toString());
        } finally {
            request.getRequestDispatcher("admin").forward(request, response);
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
