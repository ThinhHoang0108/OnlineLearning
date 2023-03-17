/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.question;

import DAO.AnswerDAO;
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
public class UpdateAnswerController extends HttpServlet {

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
            int questionID = Integer.parseInt(request.getParameter("questionID"));
            AnswerDAO answerDAO = new AnswerDAO();
            if (action.equals("Add")) {
                //Add answer
                String content = request.getParameter("answerContent");
                answerDAO.insertAnswer(questionID, content, Boolean.valueOf(request.getParameter("isCorrect")));
                response.sendRedirect("question-detailAD?questionID=" + questionID);
            } else if (action.equals("Update")) {
                int answerID = Integer.parseInt(request.getParameter("answerID"));
                String content = request.getParameter("answerContent");
                boolean correct = false;
                if (request.getParameter("isCorrect").equals("true")) {
                    correct = true;
                } else {
                    correct = false;
                }
                answerDAO.updateAnswer(answerID, content, correct);
                response.sendRedirect("question-detailAD?questionID=" + questionID);
            } else if (action.equals("Delete")) {
                int answerID = Integer.parseInt(request.getParameter("answerID"));
                answerDAO.deleteAnswer(answerID);
                response.sendRedirect("question-detailAD?questionID=" + questionID);
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
