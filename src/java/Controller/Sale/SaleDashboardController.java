/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Sale;

import DAL.OrderDAO;
import DAL.OrderStatusDAO;
import Model.OrderStatus;
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
public class SaleDashboardController extends HttpServlet {

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
//        HttpSession session = request.getSession();
//        User u = (User) session.getAttribute("user");
//        int saleID = u.getUser_ID();

        OrderStatusDAO orstDAO = new OrderStatusDAO();
//        OrderDAO oDAO = new OrderDAO();
        ArrayList<OrderStatus> listOrderStatus = orstDAO.getAllOrderStatus();

//        int totalOrder = oDAO.getTotalOrder(saleID, start, end);
//        int totalPending = oDAO.getTotalOrderType(saleID, start, end, 1);
//        int totalProcessing = oDAO.getTotalOrderType(saleID, start, end, 2);
//        int totalCompleted = oDAO.getTotalOrderType(saleID, start, end, 3);
//        int totalCanceled = oDAO.getTotalOrderType(saleID, start, end, 4);

        request.setAttribute("listOrderStatus", listOrderStatus);
        request.getRequestDispatcher("SaleDashboard.jsp").forward(request, response);
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
