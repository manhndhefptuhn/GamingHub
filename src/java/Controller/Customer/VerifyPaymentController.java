/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Customer;

import DAL.CartDAO;
import DAL.OrderDAO;
import DAL.OrderDetailDAO;
import Model.Cart;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
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
public class VerifyPaymentController extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String vnpTxnRef = request.getParameter("vnp_TxnRef");
        String vnpBankTranNo = request.getParameter("vnp_BankTranNo");
        String vnpTransactionNo = request.getParameter("vnp_TransactionNo");
        String vnpResponseCode = request.getParameter("vnp_ResponseCode");
        int orderID = Integer.parseInt(vnpTxnRef);
        if (vnpTxnRef != null && Integer.parseInt(vnpTxnRef) > 0
                && vnpBankTranNo != null && vnpResponseCode != null && vnpResponseCode.equals("00")
                && vnpTransactionNo != null && Integer.parseInt(vnpTransactionNo) > 0) {
            CartDAO cartDAO = new CartDAO();
            OrderDetailDAO ordtDAO = new OrderDetailDAO();
            HttpSession session = request.getSession();
            User u = (User) session.getAttribute("user");
            ArrayList<Cart> listCart = cartDAO.getAllCartItemByUserID(u.getUser_ID());
            ordtDAO.addCartToOrder(listCart, orderID);
            ordtDAO.updateQuantityProduct(listCart);
            cartDAO.removeAllCartByUserID(u.getUser_ID());
            int totalCartProduct = cartDAO.getTotalCartProduct(u.getUser_ID());
            session.setAttribute("totalCartProduct", totalCartProduct);
            response.sendRedirect("successful?payment=" + "VNPay" + "&orderID=" + orderID + "");
        } else {
            CartDAO cartDAO = new CartDAO();
            OrderDetailDAO ordtDAO = new OrderDetailDAO();
            HttpSession session = request.getSession();
            User u = (User) session.getAttribute("user");
            ArrayList<Cart> listCart = cartDAO.getAllCartItemByUserID(u.getUser_ID());
            ordtDAO.addCartToOrder(listCart, orderID);
            response.sendRedirect("errorCheckout?orderID=" + orderID + "");
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
