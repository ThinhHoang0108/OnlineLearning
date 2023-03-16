/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.quiz;

import DAO.CourseDAO;
import DAO.LessonDAO;
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
import model.Lesson;
import model.Quiz;
import model.QuizLevel;

/**
 *
 * @author ADMIN
 */
public class QuizDetailController extends HttpServlet {

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
            String action = request.getParameter("action");
            int message = Integer.parseInt(request.getParameter("message"));
            switch (action) {
                case "AddNewQuizz":
                    request.getSession().setAttribute("action", action);
                    break;
                case "EditQuizController":
                    int quizzID = Integer.parseInt(request.getParameter("quizzID"));
                    Quiz quizByID = new QuizDao().getQuizByID(quizzID);
                    request.setAttribute("quizByID", quizByID);
                    request.getSession().setAttribute("quizzID", quizzID);
                    request.getSession().setAttribute("action", action);
                    break;
            }
            if (message == 0) {
                request.getSession().setAttribute("messageError", "");
            }
            List<Course> listCourse = new CourseDAO().getAllcourse();
            List<QuizLevel> listQuizLevel = new QuizLevelDAO().getAllQuizLevel();
            List<Lesson> listLesson = new LessonDAO().getAll();
            request.setAttribute("listCourse", listCourse);
            request.setAttribute("listQuizLevel", listQuizLevel);
            request.setAttribute("listLesson", listLesson);

            request.getRequestDispatcher("addNewQuiz.jsp").forward(request, response);

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
