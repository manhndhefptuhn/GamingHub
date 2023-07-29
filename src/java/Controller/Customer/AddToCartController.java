/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Customer;

import DAO.CartDAO;
import DAO.ProductDAO;
import Model.Cart;
import Model.Product;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

/**
 * s
 *
 * @author Zarius
 */
public class AddToCartController extends HttpServlet {

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
        HttpSession session = request.getSession();
        try {
            CartDAO cartDAO = new CartDAO();
            ProductDAO pDAO = new ProductDAO();

            int productID = Integer.parseInt(request.getParameter("productID"));
            User u = (User) session.getAttribute("user");
            Product p = pDAO.getProductByID(productID);
            //if quantity is not out of stock
            if (p.getQuantity() != 0) {
                //if user is customer
                if (u != null && u.getRole_ID() == 1) {
                    //check if in cart already has product
                    Cart cart = cartDAO.getCart(u.getUser_ID(), productID);
                    int row, totalCartProduct, originalPrice, salePrice, totalCost, quantity, price;
                    //if not have
                    if (cart == null) {
                        //if is normal, new product
                        if (p.getProductStatusID() == 0 || p.getProductStatusID() == 1) {
                            originalPrice = pDAO.getOriginalPriceByID(productID);
                            totalCost = originalPrice * 1;
                            row = cartDAO.addToCart(u.getUser_ID(), productID, originalPrice, 1, totalCost);
                            if (row >= 1) {
                                session.setAttribute("notification", "Add to cart successfully");
                                totalCartProduct = cartDAO.getTotalCartProduct(u.getUser_ID());
                                session.setAttribute("totalCartProduct", totalCartProduct);
                                response.sendRedirect(extractPath(request.getHeader("Referer")));
                            } else {
                                throw new Exception();
                            }
                            //if product is sale price
                        } else if (p.getProductStatusID() == 2) {
                            salePrice = pDAO.getSalePriceByID(productID);
                            totalCost = salePrice * 1;
                            row = cartDAO.addToCart(u.getUser_ID(), productID, salePrice, 1, totalCost);
                            if (row >= 1) {
                                session.setAttribute("notification", "Add to cart successfully");
                                totalCartProduct = cartDAO.getTotalCartProduct(u.getUser_ID());
                                session.setAttribute("totalCartProduct", totalCartProduct);
                                response.sendRedirect(extractPath(request.getHeader("Referer")));
                            } else {
                                throw new Exception();
                            }
                        }
                        //if there is a product in cart with the same id
                    } else {
                        price = cart.getProductPrice();
                        quantity = cartDAO.getQuantityOfProduct(u.getUser_ID(), productID);
                        totalCost = (price * (quantity + 1));
                        if (quantity >= p.getQuantity()) {
                            session.setAttribute("wrongNotification", "Cannot add more. Product's quantity reached maximum");
                            response.sendRedirect(extractPath(request.getHeader("Referer")));
                        } else {
                            row = cartDAO.updateCartIfExist(price, quantity + 1, totalCost, u.getUser_ID(), productID);
                            if (row >= 1) {
                                session.setAttribute("notification", "There is a product in cart, updating the quantity in cart");
                                totalCartProduct = cartDAO.getTotalCartProduct(u.getUser_ID());
                                session.setAttribute("totalCartProduct", totalCartProduct);
                                response.sendRedirect(extractPath(request.getHeader("Referer")));
                            } else {
                                throw new Exception();
                            }
                        }
                    }
                } else {
                    session.setAttribute("wrongNotification", "You must login as customer or register to buy this product");
                    response.sendRedirect(extractPath(request.getHeader("Referer")));
                }
            } else {
                session.setAttribute("wrongNotification", "Product is out of stock");
                response.sendRedirect(extractPath(request.getHeader("Referer")));
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("wrongNotification", "An error occurred. Please try again.");
            response.sendRedirect(extractPath(request.getHeader("Referer")));
        }
    }

    private String extractPath(String url) {
        try {
            URI uri = new URI(url);
            String path = uri.getPath() + (uri.getQuery() != null ? "?" + uri.getQuery() : "");
            if (path.substring(path.lastIndexOf('/') + 1).equals("login")) {
                return "home";
            } else {
                return path.substring(path.lastIndexOf('/') + 1); // Remove the preceding slash

            }
        } catch (URISyntaxException e) {
            e.printStackTrace();
            return null;
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
