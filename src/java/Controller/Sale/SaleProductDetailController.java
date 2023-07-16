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
        int productStatusID = pDAO.getProductStatusIDByProductID(productID);
        int categoryID = pDAO.getCategoryIDByProductID(productID);
        int cpuID = pDAO.getCPUIDByProductID(productID);
        int caseID = pDAO.getCaseIDByProductID(productID);
        int mainboardID = pDAO.getMainboardIDByProductID(productID);
        int psuID = pDAO.getPSUIDByProductID(productID);
        int ramID = pDAO.getRAMIDByProductID(productID);
        int storageID = pDAO.getStorageIDByProductID(productID);
        int vgaID = pDAO.getVGAIDByProductID(productID);

        Product product = pDAO.getProductByID(productID);
        request.setAttribute("product", product);
        ProductStatus prs = pDAO.getProductStatusByID(productStatusID);
        request.setAttribute("prs", prs);
        List<ProductStatus> allprs = new ProductDAO().getAllProductStatus();
        request.setAttribute("allprs", allprs);       
        Category cate = pDAO.getCategoryByID(categoryID);
        request.setAttribute("cate", cate);
        List<Category> allcate = new CategoryDAO().getAllCategory();
        request.setAttribute("allcate", allcate);

        PCDAO pcDAO = new PCDAO();
        PC pc = pcDAO.getPCByProductID(productID);
        request.setAttribute("pc", pc);
        CPU cpu = new CPUDAO().getCPUByID(cpuID);
        request.setAttribute("cpu", cpu);
        List<CPU> allcpu = new CPUDAO().getAllCPU();
        request.setAttribute("allcpu", allcpu);
        Case c = new CaseDAO().getCaseByID(caseID);
        request.setAttribute("c", c);
        List<Case> allca = new CaseDAO().getAllCase();
        request.setAttribute("allca", allca);
        Mainboard mb = new MainboardDAO().getMainboardByID(mainboardID);
        request.setAttribute("mb", mb);
        List<Mainboard> allmb = new MainboardDAO().getAllMainboard();
        request.setAttribute("allmb", allmb);
        PSU psu = new PSUDAO().getPSUByID(psuID);
        request.setAttribute("psu", psu);
        List<PSU> allpsu = new PSUDAO().getAllPSU();
        request.setAttribute("allpsu", allpsu);
        RAM ram = new RAMDAO().getRAMByID(ramID);
        request.setAttribute("ram", ram);
        List<RAM> allram = new RAMDAO().getAllRAM();
        request.setAttribute("allram", allram);
        Storage st = new StorageDAO().getStorageByID(storageID);
        request.setAttribute("st", st);
        List<Storage> allst = new StorageDAO().getAllStorage();
        request.setAttribute("allst", allst);
        VGA vga = new VGADAO().getVGAByID(vgaID);
        request.setAttribute("vga", vga);
        List<VGA> allvga = new VGADAO().getAllVGA();
        request.setAttribute("allvga", allvga);
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
