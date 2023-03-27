/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.slider;

import DAO.CourseDAO;
import DAO.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Course;
import model.Slider;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "UpdateSliderController", urlPatterns = {"/updateSlider"})
public class UpdateSliderController extends HttpServlet {

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
            int slideId = Integer.parseInt(request.getParameter("slideID"));
            Slider slide = new SliderDAO().getSliderById(slideId);
            List<Course> listCourse = new CourseDAO().getAllcourse();
            request.setAttribute("listCourse", listCourse);
            request.setAttribute("slide", slide);
            request.getRequestDispatcher("SliderUpdate.jsp").forward(request, response);
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
        /* TODO output your page here. You may use following sample code. */
        int slideId = Integer.parseInt(request.getParameter("sliderID"));
        String sliderUrl_raw = request.getParameter("sliderUrl");
        String title_raw = request.getParameter("title");
        String content_raw = request.getParameter("content");
        String notes_raw = request.getParameter("notes");
        int courseID = Integer.parseInt(request.getParameter("course"));
        SliderDAO s = new SliderDAO();
        s.updateSlider(sliderUrl_raw, true, title_raw, content_raw, notes_raw, courseID, slideId);
        SliderDAO d = new SliderDAO();
        List<Slider> listSliders = new SliderDAO().getAllSlider();
        request.getSession().setAttribute("listSliders", listSliders);
        response.sendRedirect("SliderList.jsp");

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
