/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import Base.Base;
import DAO.CourseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Course;

/**
 *
 * @author ADMIN
 */
public class ListCourseByCate extends HttpServlet {

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
            int cateID = Integer.parseInt(request.getParameter("categoryID"));
            String cateName = request.getParameter("cateName");
            int page = 1;
            String pageIndex = request.getParameter("page");
            if (pageIndex != null) {
                page = Integer.parseInt(pageIndex);
            }
            DAO.CourseDAO dao = new CourseDAO();
            int totalCourse = dao.getTotalCourse(cateID);
            int totalPage = totalCourse / Base.PAGE_SIZE;
            if (totalCourse % Base.PAGE_SIZE != 0) {
                totalPage += 1;
            }
            List<Course> listCourseByPageing = dao.getAllcourseByPageAndCateID(page, Base.PAGE_SIZE, cateID);
            request.getSession().setAttribute("listCoursebyPageing", listCourseByPageing);
            request.setAttribute("page", page);
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("pagination_url", "listCourseByCate?categoryID=" + cateID + "&cateName=" + cateName + "&");
            request.setAttribute("cateName", cateName);
            request.getRequestDispatcher("courselist.jsp").forward(request, response);

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
