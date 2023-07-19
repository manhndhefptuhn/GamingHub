/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Public;

import DAL.CaseDAO;
import DAL.FeedbackDAO;
import DAL.FeedbackResponseDAO;
import DAL.PCDAO;
import DAL.ProductDAO;
import DAL.ProductImagesDAO;
import DAL.UserDAO;
import Model.Case;
import Model.Feedback;
import Model.FeedbackResponse;
import Model.Product;
import Model.Product_Images;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

/**
 *
 * @author Zarius
 */
public class ProductDetailController extends HttpServlet {

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
        response.setCharacterEncoding("UTF-8");
        try {
            int productID = Integer.parseInt(request.getParameter("productID"));
            ProductDAO pDAO = new ProductDAO();
            CaseDAO caseDAO = new CaseDAO();
            PCDAO pcDAO = new PCDAO();
            ProductImagesDAO primgDAO = new ProductImagesDAO();
            FeedbackDAO fDAO = new FeedbackDAO();
            UserDAO uDAO = new UserDAO();
            FeedbackResponseDAO fbrspDAO = new FeedbackResponseDAO();

            Map<String, String> specificationMap = pcDAO.getProductSpecification(productID);
            request.setAttribute("specification", specificationMap);

            Product p = pDAO.getProductByID(productID);
            request.setAttribute("product", p);

            int originalPrice = pDAO.getOriginalPriceByID(productID);
            request.setAttribute("originalPrice", originalPrice);

            int salePrice = pDAO.getSalePriceByID(productID);
            request.setAttribute("salePrice", salePrice);

            int rating = fDAO.getStarByProductID(productID);
            request.setAttribute("rating", rating);
            int totalFeedback = fDAO.getTotalFeedback(productID);
            request.setAttribute("totalFeedback", totalFeedback);

            //RelatedPC
            ArrayList<Product> listRelated = pDAO.getRelatedPCExceptCurrent(productID, p.getCategoryID());
            request.setAttribute("listRelated", listRelated);

            Map<Integer, Integer> listRelatedPCPrice = pDAO.getOriginalPriceByID(listRelated);
            request.setAttribute("listRelatedPCPrice", listRelatedPCPrice);

            Map<Integer, Integer> listSalePrice = pDAO.getSalePriceByID(listRelated);
            request.setAttribute("listSalePrice", listSalePrice);

            Map<Integer, Integer> listRelatedFeedback = fDAO.getStarByProductID(listRelated);
            request.setAttribute("listRelatedFeedback", listRelatedFeedback);

            //Product Images
            ArrayList<Product_Images> listImageOfProduct = primgDAO.getListImageOfProductByID(productID);
            request.setAttribute("listImageOfProduct", listImageOfProduct);

            //Related Images
            Map<Integer, Case> listImage = caseDAO.getCaseByCaseID();
            request.setAttribute("listImage", listImage);
            Map<Integer, Integer> listCaseID = pcDAO.getCaseIDByProductID();
            request.setAttribute("listCaseID", listCaseID);

            //Feedback
            ArrayList<Feedback> listFeedback = fDAO.getProductFeedback(productID);
            request.setAttribute("listFeedback", listFeedback);
            Map<Integer, FeedbackResponse> listResponse = fbrspDAO.getFeedbackResponse();
            request.setAttribute("listResponse", listResponse);

            Map<Integer, User> listUser = uDAO.getUserByUserID();
            request.setAttribute("listUser", listUser);

            request.getRequestDispatcher("productDetail.jsp").forward(request, response);
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
