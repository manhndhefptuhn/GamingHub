/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Sale;

import DAL.CPUDAO;
import DAL.CaseDAO;
import DAL.CategoryDAO;
import DAL.MainboardDAO;
import DAL.PCDAO;
import DAL.PSUDAO;
import DAL.ProductDAO;
import DAL.ProductImagesDAO;
import DAL.RAMDAO;
import DAL.StorageDAO;
import DAL.VGADAO;
import Model.CPU;
import Model.Case;
import Model.Category;
import Model.Mainboard;
import Model.PC;
import Model.PSU;
import Model.Product;
import Model.ProductStatus;
import Model.Product_Images;
import Model.RAM;
import Model.Storage;
import Model.VGA;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Tien Dat
 */
public class SaleProductDetailController extends HttpServlet {

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
        ProductDAO pDAO = new ProductDAO();
        int productID = Integer.parseInt(request.getParameter("id"));
        
        Product product = pDAO.getProductByID(productID);
        request.setAttribute("product", product);
        
        PCDAO pcDAO = new PCDAO();
        PC pc = pcDAO.getPCByProductID(productID);
        request.setAttribute("pc", pc);
        
        List<Category> allcate = new CategoryDAO().getAllCategory();
        request.setAttribute("allcate", allcate);
        
        List<ProductStatus> allprs = new ProductDAO().getAllProductStatus();
        request.setAttribute("allprs", allprs); 
        
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
        
        ArrayList<Product_Images> listImageOfProduct = new ProductImagesDAO().getListImageOfProductByID(productID);
        request.setAttribute("listImageOfProduct", listImageOfProduct);
        
        request.getRequestDispatcher("SaleProductDetail.jsp").forward(request, response);
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
