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

import Model.Product;
import DAL.ProductDAO; 
import java.util.List;

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ProductDAO pd = new ProductDAO(); 
        
        int totalProduct = pd.getTotalNumberOfProduct(); 
        int quantityOfId1 = pd.getQuantityOfProductByProductName(1);
        int quantityOfId2 = pd.getQuantityOfProductByProductName(2);
        int quantityOfId3 = pd.getQuantityOfProductByProductName(3);
        int quantityOfId4 = pd.getQuantityOfProductByProductName(4);
        int quantityOfId5 = pd.getQuantityOfProductByProductName(5);
        
        int quantityOfId6 = pd.getQuantityOfProductByProductName(6);
        int quantityOfId7 = pd.getQuantityOfProductByProductName(7);
        int quantityOfId8 = pd.getQuantityOfProductByProductName(8);
        int quantityOfId9 = pd.getQuantityOfProductByProductName(9);
        int quantityOfId10 = pd.getQuantityOfProductByProductName(10);
        
//        int quantityOfId11 = pd.getQuantityOfProductByProductName(11);
//        int quantityOfId12 = pd.getQuantityOfProductByProductName(12);
//        int quantityOfId13 = pd.getQuantityOfProductByProductName(13);
//        int quantityOfId14 = pd.getQuantityOfProductByProductName(14);
//        int quantityOfId15 = pd.getQuantityOfProductByProductName(15);
//        
//        int quantityOfId16 = pd.getQuantityOfProductByProductName(16);
//        int quantityOfId17 = pd.getQuantityOfProductByProductName(17);
//        int quantityOfId18 = pd.getQuantityOfProductByProductName(18);
//        int quantityOfId19 = pd.getQuantityOfProductByProductName(19);
//        int quantityOfId20 = pd.getQuantityOfProductByProductName(20);
//        
//        int quantityOfId21 = pd.getQuantityOfProductByProductName(21);
//        int quantityOfId22 = pd.getQuantityOfProductByProductName(22);
//        int quantityOfId23 = pd.getQuantityOfProductByProductName(23);
//        int quantityOfId24 = pd.getQuantityOfProductByProductName(24);
//        int quantityOfId25 = pd.getQuantityOfProductByProductName(25);
//        
//        int quantityOfId26 = pd.getQuantityOfProductByProductName(26);
//        int quantityOfId27 = pd.getQuantityOfProductByProductName(27);
//        int quantityOfId28 = pd.getQuantityOfProductByProductName(28);
//        int quantityOfId29 = pd.getQuantityOfProductByProductName(29);
//        int quantityOfId30 = pd.getQuantityOfProductByProductName(30);
        
        List<Product> productList = pd.getAllProduct(); 
        
        request.setAttribute("totalProduct", totalProduct);
        request.setAttribute("quantityOfId1", quantityOfId1);
        request.setAttribute("quantityOfId2", quantityOfId2);
        request.setAttribute("quantityOfId3", quantityOfId3);
        request.setAttribute("quantityOfId4", quantityOfId4);
        request.setAttribute("quantityOfId5", quantityOfId5);
        
        request.setAttribute("quantityOfId6", quantityOfId6);
        request.setAttribute("quantityOfId7", quantityOfId7);
        request.setAttribute("quantityOfId8", quantityOfId8);
        request.setAttribute("quantityOfId9", quantityOfId9);
        request.setAttribute("quantityOfId10", quantityOfId10);
        
        request.setAttribute("productList", productList);
        
//        request.setAttribute("quantityOfId11", quantityOfId11);
//        request.setAttribute("quantityOfId12", quantityOfId12);
//        request.setAttribute("quantityOfId13", quantityOfId13);
//        request.setAttribute("quantityOfId14", quantityOfId14);
//        request.setAttribute("quantityOfId15", quantityOfId15);
//        
//        request.setAttribute("quantityOfId16", quantityOfId16);
//        request.setAttribute("quantityOfId17", quantityOfId17);
//        request.setAttribute("quantityOfId18", quantityOfId18);
//        request.setAttribute("quantityOfId19", quantityOfId19);
//        request.setAttribute("quantityOfId20", quantityOfId20);
//        
//        request.setAttribute("quantityOfId21", quantityOfId21);
//        request.setAttribute("quantityOfId22", quantityOfId22);
//        request.setAttribute("quantityOfId23", quantityOfId23);
//        request.setAttribute("quantityOfId24", quantityOfId24);
//        request.setAttribute("quantityOfId25", quantityOfId25);
//        
//        request.setAttribute("quantityOfId26", quantityOfId26);
//        request.setAttribute("quantityOfId27", quantityOfId27);
//        request.setAttribute("quantityOfId28", quantityOfId28);
//        request.setAttribute("quantityOfId29", quantityOfId29);
//        request.setAttribute("quantityOfId30", quantityOfId30);
        

        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
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
