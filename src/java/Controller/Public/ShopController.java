/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Public;

import DAL.CaseDAO;
import DAL.CategoryDAO;
import DAL.FeedbackDAO;
import DAL.PCDAO;
import DAL.ProductDAO;
import Model.Case;
import Model.Category;
import Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

/**
 *
 * @author Zarius
 */
public class ShopController extends HttpServlet {

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
        CategoryDAO catDAO = new CategoryDAO();
        ProductDAO pDAO = new ProductDAO();
        CaseDAO caseDAO = new CaseDAO();
        PCDAO pcDAO = new PCDAO();
        FeedbackDAO fDAO = new FeedbackDAO();

        int totalProduct, productsPerPage, categoryID, totalPages, startIndex, endIndex, productStatus;

        ArrayList<Category> listCategory = catDAO.getAllCategory();
        request.setAttribute("listCategory", listCategory);

        // Set the number of products to display per page
        productsPerPage = 9;
        // Get the current page number from the request parameter (assuming it is passed as 'page')
        int currentPage = 1;
        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            currentPage = Integer.parseInt(pageParam);
        }
        request.setAttribute("currentPage", currentPage);

        // Get the categoryID parameter from the request
        String categoryIDParam = request.getParameter("categoryID");
        String cpuName = request.getParameter("cpuName");
        String productStatusParam = request.getParameter("productStatus");
        // Check if the categoryID parameter is provided
        if (categoryIDParam != null && !categoryIDParam.isEmpty()) {
            categoryID = Integer.parseInt(categoryIDParam);
            if (cpuName != null && !cpuName.isEmpty()) {
                ArrayList<Product> listAllByCategoryAndByName = pDAO.getAllProductByCategoryAndCpuName(categoryID, cpuName);
                totalProduct = listAllByCategoryAndByName.size();

                totalPages = (int) Math.ceil((double) totalProduct / productsPerPage);
                request.setAttribute("totalPages", totalPages);

                startIndex = (currentPage - 1) * productsPerPage;
                endIndex = Math.min(startIndex + productsPerPage, totalProduct);

                ArrayList<Product> listProduct = new ArrayList<>(listAllByCategoryAndByName.subList(startIndex, endIndex));
                request.setAttribute("listProduct", listProduct);

                Map<Integer, Integer> listFeedback = fDAO.getStarByProductID(listProduct);
                request.setAttribute("listFeedback", listFeedback);

                Map<Integer, Integer> listOriginalPrice = pDAO.getOriginalPriceByID(listProduct);
                request.setAttribute("listOriginalPrice", listOriginalPrice);

                Map<Integer, Integer> listSalePrice = pDAO.getSalePriceByID(listProduct);
                request.setAttribute("listSalePrice", listSalePrice);
            } else if (productStatusParam != null && !productStatusParam.isEmpty()) {
                productStatus = Integer.parseInt(productStatusParam);
                ArrayList<Product> listAllProductByCategoryAndProductStatus = pDAO.getAllProductByCategoryAndProductStatus(categoryID, productStatus);
                totalProduct = listAllProductByCategoryAndProductStatus.size();
                totalPages = (int) Math.ceil((double) totalProduct / productsPerPage);
                request.setAttribute("totalPages", totalPages);

                startIndex = (currentPage - 1) * productsPerPage;
                endIndex = Math.min(startIndex + productsPerPage, totalProduct);

                ArrayList<Product> listProduct = new ArrayList<>(listAllProductByCategoryAndProductStatus.subList(startIndex, endIndex));
                request.setAttribute("listProduct", listProduct);

                Map<Integer, Integer> listFeedback = fDAO.getStarByProductID(listProduct);
                request.setAttribute("listFeedback", listFeedback);

                Map<Integer, Integer> listOriginalPrice = pDAO.getOriginalPriceByID(listProduct);
                request.setAttribute("listOriginalPrice", listOriginalPrice);

                Map<Integer, Integer> listSalePrice = pDAO.getSalePriceByID(listProduct);
                request.setAttribute("listSalePrice", listSalePrice);
            } else {
                ArrayList<Product> listAllCategoryProduct = pDAO.getAllProductByCategory(categoryID);

                totalProduct = listAllCategoryProduct.size();

                totalPages = (int) Math.ceil((double) totalProduct / productsPerPage);
                request.setAttribute("totalPages", totalPages);

                startIndex = (currentPage - 1) * productsPerPage;
                endIndex = Math.min(startIndex + productsPerPage, totalProduct);

                ArrayList<Product> listProduct = new ArrayList<>(listAllCategoryProduct.subList(startIndex, endIndex));
                request.setAttribute("listProduct", listProduct);

                Map<Integer, Integer> listFeedback = fDAO.getStarByProductID(listProduct);
                request.setAttribute("listFeedback", listFeedback);

                Map<Integer, Integer> listOriginalPrice = pDAO.getOriginalPriceByID(listProduct);
                request.setAttribute("listOriginalPrice", listOriginalPrice);

                Map<Integer, Integer> listSalePrice = pDAO.getSalePriceByID(listProduct);
                request.setAttribute("listSalePrice", listSalePrice);
            }
        } else {
            ArrayList<Product> listAllProduct = pDAO.getAllProduct();
            // Get the total number of products
            totalProduct = listAllProduct.size();
            // Calculate the total number of pages needed

            totalPages = (int) Math.ceil((double) totalProduct / productsPerPage);
            request.setAttribute("totalPages", totalPages);

            startIndex = (currentPage - 1) * productsPerPage;
            endIndex = Math.min(startIndex + productsPerPage, totalProduct);

            ArrayList<Product> listProduct = new ArrayList<>(listAllProduct.subList(startIndex, endIndex));
            request.setAttribute("listProduct", listProduct);

            Map<Integer, Integer> listFeedback = fDAO.getStarByProductID(listProduct);
            request.setAttribute("listFeedback", listFeedback);

            Map<Integer, Integer> listOriginalPrice = pDAO.getOriginalPriceByID(listProduct);
            request.setAttribute("listOriginalPrice", listOriginalPrice);

            Map<Integer, Integer> listSalePrice = pDAO.getSalePriceByID(listProduct);
            request.setAttribute("listSalePrice", listSalePrice);
        }

        Map<Integer, Case> listImage = caseDAO.getCaseByCaseID();
        request.setAttribute("listImage", listImage);
        Map<Integer, Integer> listCaseID = pcDAO.getCaseIDByProductID();
        request.setAttribute("listCaseID", listCaseID);

        request.getRequestDispatcher("shop.jsp").forward(request, response);
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
