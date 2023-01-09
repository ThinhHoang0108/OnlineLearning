/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.OrderDAO;
import DAO.OrderDetailDAO;
import DAO.ShippingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.LinkedHashMap;
import java.util.Map;
import model.Account;
import model.Cart;
import model.Order;
import model.Shipping;

/**
 *
 * @author ADMIN
 */
public class CheckOutController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
            if (carts == null) {
                carts = new LinkedHashMap<>();
            }
            //tinh tong tien
            int totalMoney = 0;
            for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
                Integer productId = entry.getKey();
                Cart cart = entry.getValue();
                totalMoney += cart.getQuantity() * cart.getGlasses().getPrice();
            }
            request.setAttribute("totalMoney", totalMoney);
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String name = request.getParameter("c_name");
        String address = request.getParameter("c_address");
        String phone = request.getParameter("c_phone");
        String note = request.getParameter("c_order_notes");
        if (note == null || note.isEmpty() || note.equals("")) {
            note = "No notes";
        }

        //Luu Shipping vao database
        Shipping shipping = Shipping.builder().name(name).address(address).phone(phone).build();
        int shippingId = new ShippingDAO().createReturnId(shipping);
        //Luu Order
        Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
        if (carts == null) {
            carts = new LinkedHashMap<>();
        }
        int totalMoney = 0;
        for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
            Integer productId = entry.getKey();
            Cart cart = entry.getValue();
            totalMoney += cart.getQuantity() * cart.getGlasses().getPrice();
        }
        Order order = Order.builder().accId(account.getAccId())
                .totalPrice(totalMoney)
                .shippingId(shippingId)
                .note(note)
                .status(1)
                .build();
        int orderId = new OrderDAO().createReturnId(order);
        //Luu OrderDetail
        new OrderDetailDAO().saveCart(orderId, carts);
        session.removeAttribute("carts");
        response.sendRedirect("thankyou.jsp");
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
