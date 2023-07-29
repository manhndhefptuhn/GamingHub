/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Customer;

import DAO.CaseDAO;
import DAO.PCDAO;
import DAO.ProductDAO;
import DAO.WishlistDAO;
import Model.Case;
import Model.User;
import Model.Wishlist;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Zarius
 */
public class WishListController extends HttpServlet {

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
            WishlistDAO wlDAO = new WishlistDAO();
            CaseDAO caseDAO = new CaseDAO();
            PCDAO pcDAO = new PCDAO();
            ProductDAO pDAO = new ProductDAO();
            int productPrice, productSalePrice;

            User u = (User) session.getAttribute("user");
            
            //get list wishlist of user
            ArrayList<Wishlist> listWishList = wlDAO.getAllWishItemByUserID(u.getUser_ID());
            request.setAttribute("listWishList", listWishList);

            //get image of each product
            Map<Integer, Case> listImage = caseDAO.getCaseByCaseID();
            request.setAttribute("listImage", listImage);
            Map<Integer, Integer> listCaseID = pcDAO.getCaseIDByProductID();
            request.setAttribute("listCaseID", listCaseID);
            
            //get wishlist product name
            Map<Integer, String> listWishlistProductName = pDAO.getWishlistProductNameByProductID(listWishList);
            request.setAttribute("listWishlistProductName", listWishlistProductName);
            //get wishlist product status (new, sale, normal)
            Map<Integer, Integer> listWishlistProductStatus = pDAO.getProductStatusByProductID(listWishList);
            request.setAttribute("listWishlistProductStatus", listWishlistProductStatus);

            //Map to get original Price and sale price of product
            Map<Integer, Integer> listWishlistProductPrice = new HashMap<>();
            for (Wishlist wishlist : listWishList) {
                productPrice = pDAO.getOriginalPriceByID(wishlist.getProductID());
                listWishlistProductPrice.put(wishlist.getProductID(), productPrice);
            }

            Map<Integer, Integer> listWishlistSalePrice = new HashMap<>();
            for (Wishlist wishlist : listWishList) {
                productSalePrice = pDAO.getSalePriceByID(wishlist.getProductID());
                listWishlistSalePrice.put(wishlist.getProductID(), productSalePrice);
            }
            request.setAttribute("listWishlistProductPrice", listWishlistProductPrice);
            request.setAttribute("listWishlistSalePrice", listWishlistSalePrice);

            request.getRequestDispatcher("wishlist.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("404.jsp").forward(request, response);
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
