/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.quiz;

import Base.Base;
import DAO.QuizDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class SearchQuizController extends HttpServlet {

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
            int courseID = Integer.parseInt(request.getParameter("courseID"));
            int levelID = Integer.parseInt(request.getParameter("levelID"));
            String keyword = request.getParameter("keyword");
            int page = 1;
            String pageIndex = request.getParameter("page");
            if (pageIndex != null) {
                page = Integer.parseInt(pageIndex);
            }
//            int totalQuiz = dao.getTotalQuiz();
//            int totalPage = totalQuiz / Base.PAGE_SIZE;
//            if (totalQuiz % Base.PAGE_SIZE != 0) {
//                totalPage += 1;
//            }
            int totalSearchItems = 0;
            int totalPage = 0;
            if (courseID == 0 && levelID == 0) {
                totalSearchItems = new QuizDao().getTotalSearch2side(keyword);
                totalPage = totalSearchItems / Base.PAGE_SIZE;
                if (totalSearchItems % Base.PAGE_SIZE != 0) {
//                totalPage += 1;
                }
            }else if (courseID == 0 && levelID != 0) {
                totalSearchItems = new QuizDao().getTotalSearchByLevelID(keyword,levelID);
                
            }
            request.setAttribute("keyword", keyword);
            request.getRequestDispatcher("managerQuiz.jsp").forward(request, response);

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
