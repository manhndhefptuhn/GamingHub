/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Sale;

import DAL.CPUDAO;
import DAL.CaseDAO;
import DAL.CategoryDAO;
import DAL.MainboardDAO;
import DAL.PSUDAO;
import DAL.ProductDAO;
import DAL.RAMDAO;
import DAL.StorageDAO;
import DAL.VGADAO;
import Model.CPU;
import Model.Case;
import Model.Category;
import Model.Mainboard;
import Model.PSU;
import Model.ProductStatus;
import Model.RAM;
import Model.Storage;
import Model.VGA;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Zarius
 */
public class AddProductController extends HttpServlet {

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
        
        List<ProductStatus> allprs = new ProductDAO().getAllProductStatus();
        request.setAttribute("allprs", allprs);
        
        List<Category> allcate = new CategoryDAO().getAllCategory();
        request.setAttribute("allcate", allcate);
        
        List<CPU> allcpu = new CPUDAO().getAllCPUActive();
        request.setAttribute("allcpu", allcpu);
        
        List<Case> allca = new CaseDAO().getAllCaseActive();
        request.setAttribute("allca", allca);
        
        List<Mainboard> allmb = new MainboardDAO().getAllMainboardActive();
        request.setAttribute("allmb", allmb);
        
        List<PSU> allpsu = new PSUDAO().getAllPSUActive();
        request.setAttribute("allpsu", allpsu);
        
        List<RAM> allram = new RAMDAO().getAllRAMActive();
        request.setAttribute("allram", allram);
        
        List<Storage> allst = new StorageDAO().getAllStorageActive();
        request.setAttribute("allst", allst);
        
        List<VGA> allvga = new VGADAO().getAllVGAActive();
        request.setAttribute("allvga", allvga);
        
        request.getRequestDispatcher("SaleAddProduct.jsp").forward(request, response);
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
