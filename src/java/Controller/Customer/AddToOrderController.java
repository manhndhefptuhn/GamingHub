/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Customer;

import DAL.CartDAO;
import DAL.OrderDAO;
import DAL.OrderDetailDAO;
import DAL.UserDAO;
import Model.Cart;
import Model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author Zarius
 */
public class AddToOrderController extends HttpServlet {

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
        System.out.println("Testing why merge fail");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String note = request.getParameter("note");
        int totalCost = Integer.parseInt(request.getParameter("totalCost"));
        String selectedMethod = request.getParameter("paymentMethod");

        CartDAO cartDAO = new CartDAO();
        OrderDAO oDAO = new OrderDAO();
        OrderDetailDAO ordtDAO = new OrderDetailDAO();
        UserDAO uDAO = new UserDAO();

        int saleID = uDAO.getRandomSaler();
        User u = (User) session.getAttribute("user");
        ArrayList<Cart> listCart = cartDAO.getAllCartItemByUserID(u.getUser_ID());
        int orderID = oDAO.addNewORder(u.getUser_ID(), fullName, address, phone, totalCost, selectedMethod, saleID, note);
        ordtDAO.addCartToOrder(listCart, orderID);
        
        if (selectedMethod.equalsIgnoreCase("VNPay")) {
            request.getRequestDispatcher("checkout?orderID=" + orderID + "&totalCost="+totalCost+"").forward(request, response);
        }else if(selectedMethod.equalsIgnoreCase("COD")){
            request.getRequestDispatcher("successful?payment=COD").forward(request, response);
        }
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
