/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAO.OrderDAO;
import DAO.CategoryDAO;
import DAO.ProductStatusDAO;
import DAO.DateDAO;
import DAO.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import Model.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author AN515-57
 */
public class AdminDashboardController extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");

        ProductDAO pd = new ProductDAO();
        OrderDAO od = new OrderDAO();
        DateDAO dd = new DateDAO();
        CategoryDAO cateDAO = new CategoryDAO();
        ProductStatusDAO psDAO = new ProductStatusDAO();

        int totalProduct = pd.getTotalNumberOfProduct();
        request.setAttribute("totalProduct", totalProduct);

        ArrayList<Category> categoryList = cateDAO.getTotalCategory();
        request.setAttribute("categoryList", categoryList);

        Map<Integer, Integer> listNumberOfProduct = pd.getNumberOfProductByCategoryId(categoryList);
        request.setAttribute("listNumberOfProduct", listNumberOfProduct);

        ArrayList<ProductStatus> productStatusList = psDAO.getProductStatus();
        request.setAttribute("productStatusList", productStatusList);

        Map<Integer, Integer> listNumberOfProductStatus = pd.getNumberOfProductByProductStatusId(productStatusList);
        request.setAttribute("listNumberOfProductStatus", listNumberOfProductStatus);

        Date date = dd.get7day();
        String start = date.getStart().toString();
        String end = date.getEnd().toString();

        String startDate = "";
        String endDate = "";
        String start_raw = request.getParameter("start");
        String end_raw = request.getParameter("end");
        if (start_raw != null) {
            startDate = start_raw;
            endDate = end_raw;
        }

        List<Chart> listChartRevenueArea = new ArrayList<>();
        int maxListChartRevenueArea = 0;

        if (startDate.equals("") && endDate.equals("")) {
            int day = dd.CountDayByStartEnd(start, end);

            listChartRevenueArea = od.getChartRevenueArea(start, day);

            for (Chart o : listChartRevenueArea) {
                if (o.getValue() > maxListChartRevenueArea) {
                    maxListChartRevenueArea = o.getValue();
                }
            }
            maxListChartRevenueArea = (maxListChartRevenueArea / 1000000 + 1) * 1000000;
        } else if (!startDate.equals("") && !endDate.equals("")) {
            int day = dd.CountDayByStartEnd(startDate, endDate);

            listChartRevenueArea = od.getChartRevenueArea(startDate, day);

            for (Chart o : listChartRevenueArea) {
                if (o.getValue() > maxListChartRevenueArea) {
                    maxListChartRevenueArea = o.getValue();
                }
            }
            maxListChartRevenueArea = (maxListChartRevenueArea / 1000000 + 1) * 1000000;

        }

        request.setAttribute("listChartRevenueArea", listChartRevenueArea);
        request.setAttribute("maxListChartRevenueArea", maxListChartRevenueArea);

        request.getRequestDispatcher("AdminDashboard.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AdminDashboardController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AdminDashboardController.class.getName()).log(Level.SEVERE, null, ex);
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
