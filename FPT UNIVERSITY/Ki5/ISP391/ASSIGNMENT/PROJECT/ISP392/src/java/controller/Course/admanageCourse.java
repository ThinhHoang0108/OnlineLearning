/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Course;

import Base.Base;
import DAO.CategoryDAO;
import DAO.CourseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Category;
import model.Course;

/**
 *
 * @author vuxua
 */
@WebServlet(name = "admanageCourse", urlPatterns = {"/editcourse"})
public class admanageCourse extends HttpServlet {

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
        int page = 1;
        String pageIndex = request.getParameter("page");
        if (pageIndex != null) {
            page = Integer.parseInt(pageIndex);
        }
        DAO.CourseDAO dao = new CourseDAO();
        int totalCourse = dao.getTotalCourse();
        int totalPage = totalCourse / Base.PAGE_SIZE;
        if (totalCourse % Base.PAGE_SIZE != 0) {
            totalPage += 1;
        }
        DAO.CategoryDAO daocate = new CategoryDAO();
        List<Category> listCategories = daocate.getAllCategory();
        request.getSession().setAttribute("listCategories", listCategories);
        List<Course> listCourse = dao.getAllcourse();
        request.getSession().setAttribute("listCourse", listCourse);
        List<Course> listCourseByPageing = dao.getAllcourseByPage(page, Base.PAGE_SIZE);
        request.getSession().setAttribute("listCoursebyPageing", listCourseByPageing);
        request.setAttribute("page", page);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("pagination_url", "editcourse?");
        request.getRequestDispatcher("editcourse.jsp").forward(request, response);
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
