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
import model.AnswerDetail;
import model.Question;
import model.Quiz;
import model.QuizPoint;
import model.User;

/**
 *
 * @author ADMIN
 */
public class DoQuizController extends HttpServlet {

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
            String method = request.getParameter("method");
            if (method.equals("get")) {
                doGet(request, response);
            } else {
                doPost(request, response);
            }
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
        HttpSession session = request.getSession();
        User account = (User) session.getAttribute("account");
        Quiz quiz = new QuizDao().getQuizByID(quizzID);
        //Lay ra QuizPoint cuoi cung duoc add vao
        QuizPoint lastQuizPoint = new QuizDao().getQuizPointLast(account.getUserID(), quizzID);
        //So lan toi da khi lam quiz
        int maxAttempt = quiz.getAttempt();
        int lastAttempt = 0;
        if (lastQuizPoint != null) {
            lastAttempt = lastQuizPoint.getAttempt(); //get The number user have been Attempt
        }
        if (lastAttempt < maxAttempt) {
            int questionTime = new QuizDao().getQuizByID(quizzID).getDuration();
            HashMap<Question, List<Answer>> quizz = new HashMap<>();
            List<Question> listQuestion = new QuestionDAO().getAllQuestionByQuestionID(quizzID);
            for (Question question : listQuestion) {
                quizz.put(question, new AnswerDAO().getAllAnswerByAnswerID(question.getQuestionID()));
            }
            session.setMaxInactiveInterval(questionTime * 60);
            session.setAttribute("TIMER", questionTime);
            session.setAttribute("DOING_QUIZZ", quizz);
            request.setAttribute("quizzID", quizzID);
            quiz.setTotalQuestion(quizz.size());
            request.setAttribute("QUIZZ", quiz);
            request.setAttribute("attempt", lastAttempt);
            request.setAttribute("courseID", courseID);
            request.getRequestDispatcher("quizz.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "You have reach on maxattemp this quiz");
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
        int answerCorrect = 0;
        String[] questionIDarr = request.getParameterValues("questionID");
        int quizID = Integer.parseInt(request.getParameter("quizzID"));
        int courseID = Integer.parseInt(request.getParameter("courseID"));
        int attempt = Integer.parseInt(request.getParameter("attempt"));
        //Moi khi lam bai thi cong 1 so lan lam
        attempt++;
        HttpSession session = request.getSession();
        User account = (User) session.getAttribute("account");
        //check da lam Quiz hay chua 
        boolean checkDoQuizz = new QuizDao().checkDoQuizz(account.getUserID(), quizID);
        float pointEachQuestion = (float) 10 / questionIDarr.length;
        float multipleScore = 0;
        //TH1: Question 1 cau tra loi
        //TH2: Question co nhieu  cau tra loi
        for (String questionID : questionIDarr) {
            if (new QuestionDAO().getQuestionByID(Integer.parseInt(questionID)).isIsMultipleChoice()) {
                if (request.getParameter("answer_" + questionID) != null) {
                    String[] answerIDarr = request.getParameterValues("answer_" + questionID);
                    int totalCorrectAnswer = new AnswerDAO().getAllCorrectAns(Integer.parseInt(questionID));
                    float pointIfMultiple = pointEachQuestion / totalCorrectAnswer;
                    int multipleCorrect = 0;
                    for (String answerID : answerIDarr) {
                        //insert Answer Detail
                        new QuizDao().insertAnswerDetail(Integer.parseInt(questionID), Integer.parseInt(answerID), account.getUserID(), quizID, attempt);
                        if (answerIDarr.length < totalCorrectAnswer) {
                            if (new AnswerDAO().checkAnswerIsCorrect(Integer.parseInt(answerID))) {
                                multipleCorrect++;
                                multipleScore += pointIfMultiple * multipleCorrect;
                            }
                        }
                    }
                }
            } else {//Neu no la ko phai cau multiple choice 
                if (request.getParameter("answer_" + questionID) != null) {
                    //insert Answer Detail
                    new QuizDao().insertAnswerDetail(Integer.parseInt(questionID), Integer.parseInt(request.getParameter("answer_" + questionID)), account.getUserID(), quizID, attempt);
                    if (new AnswerDAO().checkAnswerIsCorrect(Integer.parseInt(request.getParameter("answer_" + questionID)))) {
                        answerCorrect++;
                    }
                }
            }
        }
        //Tinh diem 
        float point = pointEachQuestion * answerCorrect;
        point += multipleScore;
        float pointPercent = point * 10;
        float numQuestionTrueF = (point / 10) * questionIDarr.length;
        int numQuesTrue = 0;
        if (numQuestionTrueF % 1 == 0) {
            numQuesTrue = (int) numQuestionTrueF;
        } else {
            numQuesTrue = (int) (numQuestionTrueF / 1);
        }
        //Neu lam xong roi thi luu lich su ket qua vao Quiz_POINT 
        if (checkDoQuizz) {
            new QuizDao().insertQuizPoint(account.getUserID(), quizID, point, attempt, pointPercent, numQuesTrue);
        } else {
            new QuizDao().insertQuizPoint(account.getUserID(), quizID, point, attempt, pointPercent, numQuesTrue);
        }
        request.setAttribute("SCORE", point);
        request.setAttribute("attempt", attempt);
        request.setAttribute("courseID", courseID);
        request.setAttribute("quizzID", quizID);
        request.getRequestDispatcher("scoreQuiz.jsp").forward(request, response);
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
