/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.question;

import Base.Base;
import DAO.CourseDAO;
import DAO.LessonDAO;
import DAO.QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Course;
import model.Lesson;
import model.Question;
import model.QuestionDetail;

/**
 *
 * @author ADMIN
 */
public class SearchQuestionController extends HttpServlet {

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
            int lessonID = Integer.parseInt(request.getParameter("lessonID"));
            String keyword = request.getParameter("keyword");
            int page = 1;
            String pageIndex = request.getParameter("page");
            if (pageIndex != null) {
                page = Integer.parseInt(pageIndex);
            }
            int totalSearchItems = 0;
            int totalPage = 0;
            if (courseID == 0 && lessonID == 0) {
                totalSearchItems = new QuestionDAO().getTotalSearch2side(keyword);
                totalPage = totalSearchItems / Base.PAGE_SIZE;
                if (totalSearchItems % Base.PAGE_SIZE != 0) {
                    totalPage += 1;
                }
                ArrayList<QuestionDetail> listQuestionByPageing = new QuestionDAO().getAllQuestionByPageAndSearch(page, Base.PAGE_SIZE, keyword);
                request.setAttribute("page", page);
                request.setAttribute("totalPage", totalPage);
                request.getSession().setAttribute("listQuestion", listQuestionByPageing);
            } else if (courseID == 0 && lessonID != 0) {
                totalSearchItems = new QuestionDAO().getTotalSearchBylessonID(keyword, lessonID);
                totalPage = totalSearchItems / Base.PAGE_SIZE;
                if (totalSearchItems % Base.PAGE_SIZE != 0) {
                    totalPage += 1;
                }
                ArrayList<QuestionDetail> listQuestionByPageing = new QuestionDAO().getAllQuestionByPageAndSearchByLessonID(page, Base.PAGE_SIZE, keyword, lessonID);
                request.setAttribute("page", page);
                request.setAttribute("totalPage", totalPage);
                request.getSession().setAttribute("listQuestion", listQuestionByPageing);
            } else if (courseID != 0 && lessonID == 0) {
                totalSearchItems = new QuestionDAO().getTotalSearchByCourseID(keyword, courseID);
                totalPage = totalSearchItems / Base.PAGE_SIZE;
                if (totalSearchItems % Base.PAGE_SIZE != 0) {
                    totalPage += 1;
                }
                ArrayList<QuestionDetail> listQuestionByPageing = new QuestionDAO().getAllQuestionByPageAndSearchCourseID(page, Base.PAGE_SIZE, keyword, courseID);
                request.setAttribute("page", page);
                request.setAttribute("totalPage", totalPage);
                request.getSession().setAttribute("listQuestion", listQuestionByPageing);
            } else if (courseID != 0 && lessonID != 0) {
                totalSearchItems = new QuestionDAO().getTotalSearchByCourseIDandLevelID(keyword, courseID, lessonID);
                totalPage = totalSearchItems / Base.PAGE_SIZE;
                if (totalSearchItems % Base.PAGE_SIZE != 0) {
                    totalPage += 1;
                }
                ArrayList<QuestionDetail> listQuestionByPageing = new QuestionDAO().getAllQuestionByPageAndSearchCourseIDLevelID(page, Base.PAGE_SIZE, keyword, courseID, lessonID);
                request.setAttribute("page", page);
                request.setAttribute("totalPage", totalPage);
                request.getSession().setAttribute("listQuestion", listQuestionByPageing);
            }
            List<Course> listCourse = new CourseDAO().getAllcourse();
            List<Lesson> listLesson = new LessonDAO().getAll();
            request.setAttribute("lessonID", lessonID);
            request.setAttribute("courseID", courseID);
            request.setAttribute("keyword", keyword);
            request.getSession().setAttribute("listCourse", listCourse);
            request.getSession().setAttribute("listLesson", listLesson);
            request.setAttribute("pagination_url", "search-question?lessonID=" + lessonID + "&courseID=" + courseID + "&keyword=" + keyword + "&");
            request.getRequestDispatcher("managerQuestion.jsp").forward(request, response);
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
