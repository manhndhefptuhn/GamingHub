/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Public;

import DAO.CartDAO;
import DAO.CaseDAO;
import DAO.FeedbackDAO;
import DAO.PCDAO;
import DAO.ProductDAO;
import DAO.SliderDAO;
import DAO.WishlistDAO;
import Model.Case;
import Model.Product;
import Model.Slider;
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
public class HomeController extends HttpServlet {

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
        HttpSession session = request.getSession();
        SliderDAO slDAO = new SliderDAO();
        ProductDAO pDAO = new ProductDAO();
        CaseDAO caseDAO = new CaseDAO();
        PCDAO pcDAO = new PCDAO();
        WishlistDAO wlDAO = new WishlistDAO();
        FeedbackDAO fDAO = new FeedbackDAO();
        CartDAO cartDAO = new CartDAO();

        int totalWishlistProduct, totalCartProduct;
        User u = (User) session.getAttribute("user");

        //Slider
        ArrayList<Slider> listSlider = slDAO.getSliderInHome();
        request.setAttribute("listSlider", listSlider);

        //Gaming PC
        ArrayList<Product> listFourGamingPC = pDAO.getFourPCByCategoryID(1);
        request.setAttribute("listFourGamingPC", listFourGamingPC);

        //Map to get original Price and sale price of gaming product
        Map<Integer, Integer> listGamingProductPrice = pDAO.getOriginalPriceByID(listFourGamingPC);
        request.setAttribute("listGamingProductPrice", listGamingProductPrice);
        Map<Integer, Integer> listGamingProductSalePrice = pDAO.getSalePriceByID(listFourGamingPC);
        request.setAttribute("listGamingProductSalePrice", listGamingProductSalePrice);
        //get the map star of the product
        Map<Integer, Integer> listGamingFeedback = fDAO.getStarByProductID(listFourGamingPC);
        request.setAttribute("listGamingFeedback", listGamingFeedback);

        //workPC
        ArrayList<Product> listFourWorkPC = pDAO.getFourPCByCategoryID(3);
        request.setAttribute("listFourWorkPC", listFourWorkPC);

        //Map to get original Price and sale price of work product
        Map<Integer, Integer> listWorkProductPrice = pDAO.getOriginalPriceByID(listFourWorkPC);
        request.setAttribute("listWorkProductPrice", listWorkProductPrice);
        Map<Integer, Integer> listWorkProductSalePrice = pDAO.getSalePriceByID(listFourWorkPC);
        request.setAttribute("listWorkProductSalePrice", listWorkProductSalePrice);
        //get the map star of the product
        Map<Integer, Integer> listWorkFeedback = fDAO.getStarByProductID(listFourWorkPC);
        request.setAttribute("listWorkFeedback", listWorkFeedback);

        //Mini PC
        ArrayList<Product> listFourMiniPC = pDAO.getFourPCByCategoryID(2);
        request.setAttribute("listFourMiniPC", listFourMiniPC);

        //Map to get original Price and sale price of mini product
        Map<Integer, Integer> listMiniProductPrice = pDAO.getOriginalPriceByID(listFourMiniPC);
        request.setAttribute("listMiniProductPrice", listMiniProductPrice);
        Map<Integer, Integer> listMiniProductSalePrice = pDAO.getSalePriceByID(listFourMiniPC);
        request.setAttribute("listMiniProductSalePrice", listMiniProductSalePrice);
        //get the map star of the product
        Map<Integer, Integer> listMiniFeedback = fDAO.getStarByProductID(listFourMiniPC);
        request.setAttribute("listMiniFeedback", listMiniFeedback);

        //MapToGetImage From Case
        Map<Integer, Case> listImage = caseDAO.getCaseByCaseID();
        request.setAttribute("listImage", listImage);
        Map<Integer, Integer> listCaseID = pcDAO.getCaseIDByProductID();
        request.setAttribute("listCaseID", listCaseID);

        if (u != null && u.getRole_ID() == 1) {
            totalWishlistProduct = wlDAO.getTotalWishlistProduct(u.getUser_ID());
            session.setAttribute("totalWishlistProduct", totalWishlistProduct);
            totalCartProduct = cartDAO.getTotalCartProduct(u.getUser_ID());
            session.setAttribute("totalCartProduct", totalCartProduct);
        }
        request.getRequestDispatcher("Home.jsp").forward(request, response);
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
