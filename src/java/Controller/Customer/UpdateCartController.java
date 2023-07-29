/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Customer;

import DAO.CartDAO;
import DAO.ProductDAO;
import Model.Product;
import Model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Zarius
 */
public class UpdateCartController extends HttpServlet {

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
        try {
            CartDAO cartDAO = new CartDAO();
            String action = request.getParameter("action");
            User u = (User) session.getAttribute("user");
            if (action != null && action.equals("removeAll")) {
                cartDAO.removeAllCartByUserID(u.getUser_ID());
                int totalCartProduct = cartDAO.getTotalCartProduct(u.getUser_ID());
                session.setAttribute("totalCartProduct", totalCartProduct);
                session.setAttribute("notification", "Remove all from cart successfully");
            } else {
                int row, totalCost, productPrice, productID, quantity;
                String[] productIDs = request.getParameterValues("productID");
                String[] quantities = request.getParameterValues("quantity");
                for (int i = 0; i < productIDs.length; i++) {
                    productID = Integer.parseInt(productIDs[i]);
                    quantity = Integer.parseInt(quantities[i]);
                    Product p = new ProductDAO().getProductByID(productID);
                    if (p.getProductStatusID() == 0 || p.getProductStatusID() == 1) {
                        productPrice = new ProductDAO().getOriginalPriceByID(productID);
                    } else {
                        productPrice = new ProductDAO().getSalePriceByID(productID);
                    }
                    totalCost = productPrice * quantity;
                    row = cartDAO.updateCartIfExist(productPrice, quantity, totalCost, u.getUser_ID(), productID);
                    if (row >= 1) {
                        session.setAttribute("notification", "Update cart successfully");
                    } else {
                        session.setAttribute("wrongNotification", "There's something wrong, please try again");
                    }
                }
            }
        } catch (Exception e) {
            session.setAttribute("wrongNotification", "There's something wrong, please try again");
        }
        request.getRequestDispatcher("cart").forward(request, response);
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
