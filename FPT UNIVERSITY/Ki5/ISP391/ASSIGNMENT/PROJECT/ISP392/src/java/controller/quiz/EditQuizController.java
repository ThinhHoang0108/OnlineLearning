/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.quiz;

import DAO.QuestionDAO;
import DAO.QuizDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Quiz;

/**
 *
 * @author ADMIN
 */
public class EditQuizController extends HttpServlet {

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
        HttpSession session = request.getSession();
        int quizzID = (int) session.getAttribute("quizzID");
        String quizName = request.getParameter("content");
        int levelID = Integer.parseInt(request.getParameter("levelID"));
        int courseID = Integer.parseInt(request.getParameter("courseID"));
        int lessonID = Integer.parseInt(request.getParameter("lessonID"));
        String start_time = request.getParameter("start_time");
        String end_time = request.getParameter("end_time");
        Float ratePass = Float.parseFloat(request.getParameter("ratePass"));
        int totalQuestion = Integer.parseInt(request.getParameter("totalQuestion"));
        int attempt = Integer.parseInt(request.getParameter("attempt"));
        int duration = Integer.parseInt(request.getParameter("duration"));
        String description = request.getParameter("description");
        Quiz quizByID = new QuizDao().getQuizByID(quizzID);
//        boolean checkDoQuiz = new QuizDao().checkDoQuizz(quizzID);
        int totalQuestionByQuizID = new QuestionDAO().getTotalQuestionByQuizID(quizzID);
        
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
