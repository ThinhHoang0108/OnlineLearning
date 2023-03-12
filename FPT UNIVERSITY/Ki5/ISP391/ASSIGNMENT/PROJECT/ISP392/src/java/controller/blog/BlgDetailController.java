/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.blog;

import Base.Base;
import DAO.BlogDAO;
import DAO.CommentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Blog;
import model.Comment;
import model.User;

/**
 *
 * @author ADMIN
 */
public class BlgDetailController extends HttpServlet {

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
            int blogID = Integer.parseInt(request.getParameter("blogID"));
            DAO.CommentDAO dao = new CommentDAO();
            HttpSession session = request.getSession();
            Blog blog = new BlogDAO().getBlogById(blogID);
            int totalComment = dao.getTotalComment(blogID);
            List<Comment> listComment = new CommentDAO().getCommentByBlogID(blogID);
            request.getSession().setAttribute("listComment", listComment);
            session.setAttribute("totalComment", totalComment);
            session.setAttribute("blog", blog);
            request.setAttribute("blogID", blogID);
            request.getRequestDispatcher("blog.jsp").forward(request, response);
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
        int blogID = Integer.parseInt(request.getParameter("blogID"));
        String content = request.getParameter("content");
        HttpSession session = request.getSession();
        User account = (User) session.getAttribute("account");
        int userID = account.getUserID();
        CommentDAO dao = new CommentDAO();
        dao.insertComment(userID, blogID, content);
        List<Comment> listComment = new CommentDAO().getCommentByBlogID(blogID);
        int totalComment = new CommentDAO().getTotalComment(blogID);
        session.setAttribute("listComment", listComment);
        session.setAttribute("totalComment", totalComment);
        request.setAttribute("blogID", blogID);
        request.getRequestDispatcher("blog.jsp").forward(request, response);
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
