/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Course;

import DAO.CourseDAO;
import DAO.LessonDAO;
import DAO.QuizDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Course;
import model.Lesson;
import model.Quiz;

/**
 *
 * @author vuxua
 */
@WebServlet(name = "CourseDetail", urlPatterns = {"/coursedetail"})
public class CourseDetail extends HttpServlet {

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
            String method = request.getParameter("method");
            //Course course = new CourseDAO;
//            String xid = request.getParameter("id");
            int lessonID = 0;
            if (method.equalsIgnoreCase("get")) {
                DAO.CourseDAO dao = new CourseDAO();
                Course course = dao.getCourseById(courseID);
                LessonDAO dao1 = new LessonDAO();
                List<Lesson> listLesson = dao1.getAllLesson(courseID);
                request.getSession().setAttribute("course", course);
                request.getSession().setAttribute("listLesson", listLesson);
            } else if (method.equalsIgnoreCase("post")) {
                lessonID = Integer.parseInt(request.getParameter("lessonID"));
                Lesson lessonGetByLessonID = new LessonDAO().getLessonByLessonID(lessonID);
                List<Lesson> listLesson = new LessonDAO().getAllLesson(courseID);
                List<Quiz> listQuizByLessonID = new QuizDao().getAllQuizByLessonID(lessonID);
                request.getSession().setAttribute("listLesson", listLesson);
                request.getSession().setAttribute("lessonIDresult", lessonID);
                request.getSession().setAttribute("courseIDresult", courseID);
                request.setAttribute("lessonID", lessonID);
                request.setAttribute("courseID", courseID);
                request.setAttribute("listQuizByLessonId", listQuizByLessonID);
                request.setAttribute("lessonGetByLessonID", lessonGetByLessonID);
            }
            request.getRequestDispatcher("coursedetail.jsp").forward(request, response);
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
