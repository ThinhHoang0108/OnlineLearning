/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.lesson;

import Base.Base;
import DAO.CourseDAO;
import DAO.LessonDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Course;
import model.Lesson;

/**
 *
 * @author vuxua
 */
@WebServlet(name = "manageLesson", urlPatterns = {"/managelesson"})
public class manageLesson extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
        DAO.LessonDAO dao = new LessonDAO();
        int totalLesson = dao.getTotalLesson();
        int totalPage = totalLesson / Base.PAGE_SIZE;
        if (totalLesson % Base.PAGE_SIZE != 0) {
            totalPage += 1;
        }
        DAO.CourseDAO daocourse = new CourseDAO();
        List<Course> listCourse = daocourse.getAllcourse();
        request.getSession().setAttribute("listCourse", listCourse);
        List<Lesson> listLesson = dao.getAll();
        request.getSession().setAttribute("listLesson", listLesson);
        List<Lesson> listLessonByPageing = dao.getAlllessonByPage(page, Base.PAGE_SIZE);
        request.getSession().setAttribute("listLessonByPageing", listLessonByPageing);
        request.setAttribute("page", page);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("pagination_url", "managelesson?");
        request.getRequestDispatcher("managelesson.jsp").forward(request, response);
        
    } 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
