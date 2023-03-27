/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.quiz;

import DAO.AnswerDAO;
import DAO.QuestionDAO;
import DAO.QuizDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import model.Answer;
import model.Question;
import model.Quiz;
import model.User;

/**
 *
 * @author ADMIN
 */
public class ReviewQuizController extends HttpServlet {

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
            //ThinhHoanh0108
            //123123123123
            //ThinhHoang0108
            //Tuan01082002
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
        int quizzID = Integer.parseInt(request.getParameter("quizzID"));
        int courseID = Integer.parseInt(request.getParameter("courseID"));
        int attempt = Integer.parseInt(request.getParameter("attempt"));
        HttpSession session = request.getSession();
        User account = (User) session.getAttribute("account");
        boolean checkDoQuizz = new QuizDao().checkDoQuizz(account.getUserID(), quizzID);
        if (checkDoQuizz) {
            HashMap<Question, List<Answer>> quizz = new HashMap<>();
            List<Question> listQuestion = new QuestionDAO().getAllQuestionByQuestionID(quizzID);
            for (Question question : listQuestion) {
                List<Answer> listAnswer = new AnswerDAO().getAllAnswerByAnswerID(question.getQuestionID());
                for (Answer answer : listAnswer) {
                    if (new QuizDao().checkUserIsChoosen(answer.getAnswerID(), quizzID, account.getUserID(), attempt)) {
                        answer.setUserCheckQuestion(true);
                    }
                }
                quizz.put(question, listAnswer);
            }
            Quiz quiz = new QuizDao().getQuizByID(quizzID);
            quiz.setTotalQuestion(quizz.size());
            session.setAttribute("REVIEW_QUIZZ", quizz);
            request.setAttribute("quizzID", quizzID);
            request.setAttribute("courseID", courseID);
            request.getRequestDispatcher("quizReview.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("coursedetail?courseID=" + courseID + "&method=get").forward(request, response);
        }
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
