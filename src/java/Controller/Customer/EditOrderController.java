/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Customer;

import DAL.OrderDAO;
import DAL.OrderDetailDAO;
import Model.OrderDetail;
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
public class EditOrderController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        HttpSession session = request.getSession();
        int row, row1;
        try {
            if (request.getParameter("cancel") != null) {
                OrderDAO odDAO = new OrderDAO();
                OrderDetailDAO ordtDAO = new OrderDetailDAO();
                ArrayList<OrderDetail> listOrderDetail = ordtDAO.getDetailAllOrder(orderID);
                row = odDAO.updateOrderStatus(orderID, 6);
                if (row >= 1) {
                    row1 = ordtDAO.returnQuantityProduct(listOrderDetail);
                    if (row1 >= 1) {
                        session.setAttribute("notification", "Cancel order succesfully");
                        request.getRequestDispatcher("orderDetail?id=" + orderID + "").forward(request, response);
                    } else {
                        throw new Exception();
                    }
                }
            } else if (request.getParameter("save") != null) {
                OrderDAO odDAO = new OrderDAO();
                String note = request.getParameter("note");
                row = odDAO.updateNote(orderID, note);
                if (row >= 1) {
                    session.setAttribute("notification", "Add note to order succesfully");
                    request.getRequestDispatcher("orderDetail?id=" + orderID + "").forward(request, response);
                } else {
                    throw new Exception();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("wrongNotification", "Something's wrong, please try again");
            request.getRequestDispatcher("orderDetail?id=" + orderID + "").forward(request, response);
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
