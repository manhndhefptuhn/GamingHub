/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import Model.*;
import DAL.*;
import java.util.ArrayList;
import java.util.List;
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
        // CustomerDAO cd = new CustomerDAO();
        CategoryDAO cateDAO = new CategoryDAO();
        ProductStatusDAO psDAO = new ProductStatusDAO(); 

        int totalProduct = pd.getTotalNumberOfProduct();

//        int quantityOfId1 = pd.getQuantityOfProductByProductName(1);
//        int quantityOfId2 = pd.getQuantityOfProductByProductName(2);
//        int quantityOfId3 = pd.getQuantityOfProductByProductName(3);
//        int quantityOfId4 = pd.getQuantityOfProductByProductName(4);
//        int quantityOfId5 = pd.getQuantityOfProductByProductName(5);
//
//        int quantityOfId6 = pd.getQuantityOfProductByProductName(6);
//        int quantityOfId7 = pd.getQuantityOfProductByProductName(7);
//        int quantityOfId8 = pd.getQuantityOfProductByProductName(8);
//        int quantityOfId9 = pd.getQuantityOfProductByProductName(9);
//        int quantityOfId10 = pd.getQuantityOfProductByProductName(10);

        int numberOfProductFromCategory1 = pd.getNumberOfProductByCategoryId(1);
        int numberOfProductFromCategory2 = pd.getNumberOfProductByCategoryId(2);
        int numberOfProductFromCategory3 = pd.getNumberOfProductByCategoryId(3);
        
        int numberOfProduct1 = pd.getNumberOfProductByProductStatusId(0);
        int numberOfProduct2 = pd.getNumberOfProductByProductStatusId(1);
        int numberOfProduct3 = pd.getNumberOfProductByProductStatusId(2);
        

        List<Product> productList = pd.getAllProduct1();
        List<Category> categoryList = cateDAO.getTotalCategory();
        List<ProductStatus> productStatusList = psDAO.getProductStatus(); 

        Date date = dd.get7day();
        String salerId = "4";
        String startDateForRevenue = "2023-07-05";
        String startDateForCustomer = "2023-07-10";
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
        
        List<Chart> listChartCustomer = new ArrayList<>();
        int maxListChartCustomerArea = 0;
        
        if (startDate.equals("") && endDate.equals("")) {
            int day = dd.CountDayByStartEnd(startDateForRevenue, end);

            listChartRevenueArea = od.getChartRevenueArea(salerId, startDateForRevenue, day);
            
            for (Chart o : listChartRevenueArea) {
                if (o.getValue() > maxListChartRevenueArea) {
                    maxListChartRevenueArea = o.getValue();
                }
            }
            maxListChartRevenueArea = (maxListChartRevenueArea / 1000000 + 1) * 1000000;

            int day1 = dd.CountDayByStartEnd(startDateForCustomer, end);
            // listChartCustomer = cd.getChartCustomerArea(startDateForCustomer, day1);
            
            for (Chart c : listChartCustomer) {
                if (c.getValue() > maxListChartCustomerArea) {
                    maxListChartCustomerArea = c.getValue();
                }
            }
            maxListChartCustomerArea = (maxListChartCustomerArea / 10 + 1) * 10;
        } else if (!startDate.equals("") && !endDate.equals("")){
            int day = dd.CountDayByStartEnd(startDate, endDate);

            listChartRevenueArea = od.getChartRevenueArea(salerId,startDate, day);

            for (Chart o : listChartRevenueArea) {
                if (o.getValue() > maxListChartRevenueArea) {
                    maxListChartRevenueArea = o.getValue();
                }
            }
            maxListChartRevenueArea = (maxListChartRevenueArea / 1000000 + 1) * 1000000;

            int day1 = dd.CountDayByStartEnd(startDate, endDate);
            // listChartCustomer = cd.getChartCustomerArea(startDate, day1);
            
            for (Chart c : listChartCustomer) {
                if (c.getValue() > maxListChartCustomerArea) {
                    maxListChartCustomerArea = c.getValue();
                }
            }
            maxListChartCustomerArea = (maxListChartCustomerArea / 10 + 1) * 10;
        }

        request.setAttribute("listChartRevenueArea", listChartRevenueArea);
        request.setAttribute("maxListChartRevenueArea", maxListChartRevenueArea);

        request.setAttribute("listChartCustomer", listChartCustomer);
        request.setAttribute("maxListChartCustomerArea", maxListChartCustomerArea);

        request.setAttribute("numberOfProductFromCategory1", numberOfProductFromCategory1);
        request.setAttribute("numberOfProductFromCategory2", numberOfProductFromCategory2);
        request.setAttribute("numberOfProductFromCategory3", numberOfProductFromCategory3);

        request.setAttribute("numberOfProduct1", numberOfProduct1);
        request.setAttribute("numberOfProduct2", numberOfProduct2);
        request.setAttribute("numberOfProduct3", numberOfProduct3);

        request.setAttribute("totalProduct", totalProduct);

//        request.setAttribute("quantityOfId1", quantityOfId1);
//        request.setAttribute("quantityOfId2", quantityOfId2);
//        request.setAttribute("quantityOfId3", quantityOfId3);
//        request.setAttribute("quantityOfId4", quantityOfId4);
//        request.setAttribute("quantityOfId5", quantityOfId5);
//
//        request.setAttribute("quantityOfId6", quantityOfId6);
//        request.setAttribute("quantityOfId7", quantityOfId7);
//        request.setAttribute("quantityOfId8", quantityOfId8);
//        request.setAttribute("quantityOfId9", quantityOfId9);
//        request.setAttribute("quantityOfId10", quantityOfId10);

        request.setAttribute("productList", productList);
        request.setAttribute("categoryList", categoryList);
        request.setAttribute("productStatusList", productStatusList);

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
