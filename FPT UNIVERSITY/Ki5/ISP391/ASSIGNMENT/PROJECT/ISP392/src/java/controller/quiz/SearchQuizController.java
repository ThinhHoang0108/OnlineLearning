/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.quiz;

import Base.Base;
import DAO.CourseDAO;
import DAO.QuizDao;
import DAO.QuizLevelDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Course;
import model.Quiz;
import model.QuizLevel;

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
            int totalSearchItems = 0;
            int totalPage = 0;
            if (courseID == 0 && levelID == 0) {
                totalSearchItems = new QuizDao().getTotalSearch2side(keyword);
                totalPage = totalSearchItems / Base.PAGE_SIZE;
                if (totalSearchItems % Base.PAGE_SIZE != 0) {
                    totalPage += 1;
                }
                List<Quiz> listQuizByPageing = new QuizDao().getAllQuizByPageAndSearch(page, Base.PAGE_SIZE, keyword);
                request.setAttribute("page", page);
                request.setAttribute("totalPage", totalPage);
                request.getSession().setAttribute("listQuizByPageing", listQuizByPageing);
            } else if (courseID == 0 && levelID != 0) {
                totalSearchItems = new QuizDao().getTotalSearchByLevelID(keyword, levelID);
                totalPage = totalSearchItems / Base.PAGE_SIZE;
                if (totalSearchItems % Base.PAGE_SIZE != 0) {
                    totalPage += 1;
                }
                List<Quiz> listQuizByPageing = new QuizDao().getAllQuizByPageAndSearchLevelID(page, Base.PAGE_SIZE,keyword, levelID);
                request.setAttribute("page", page);
                request.setAttribute("totalPage", totalPage);
                request.getSession().setAttribute("listQuizByPageing", listQuizByPageing);
            } else if (courseID != 0 && levelID == 0) {
                totalSearchItems = new QuizDao().getTotalSearchByCourseID(keyword, courseID);
                totalPage = totalSearchItems / Base.PAGE_SIZE;
                if (totalSearchItems % Base.PAGE_SIZE != 0) {
                    totalPage += 1;
                }
                List<Quiz> listQuizByPageing = new QuizDao().getAllQuizByPageAndSearchCourseID(page, Base.PAGE_SIZE, keyword,courseID);
                request.setAttribute("page", page);
                request.setAttribute("totalPage", totalPage);
                request.getSession().setAttribute("listQuizByPageing", listQuizByPageing);
            } else if (courseID != 0 && levelID != 0) {
                totalSearchItems = new QuizDao().getTotalSearchByCourseIDandLevelID(keyword, courseID, levelID);
                totalPage = totalSearchItems / Base.PAGE_SIZE;
                if (totalSearchItems % Base.PAGE_SIZE != 0) {
                    totalPage += 1;
                }
                List<Quiz> listQuizByPageing = new QuizDao().getAllQuizByPageAndSearchCourseIDLevelID(page, Base.PAGE_SIZE, keyword, courseID, levelID);
                request.setAttribute("page", page);
                request.setAttribute("totalPage", totalPage);
                request.getSession().setAttribute("listQuizByPageing", listQuizByPageing);
            }
            List<Course> listCourse = new CourseDAO().getAllcourse();
            List<QuizLevel> listQuizLevel = new QuizLevelDAO().getAllQuizLevel();
            request.setAttribute("levelID", levelID);
            request.setAttribute("courseID", courseID);
            request.setAttribute("keyword", keyword);
            request.setAttribute("listCourse", listCourse);
            request.setAttribute("listQuizLevel", listQuizLevel);
            request.setAttribute("pagination_url", "search-quiz?levelID=" + levelID + "&courseID=" + courseID + "&keyword=" + keyword + "&");
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
