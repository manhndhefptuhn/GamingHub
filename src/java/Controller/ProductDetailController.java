/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.CPUDAO;
import DAL.CaseDAO;
import DAL.FeedbackDAO;
import DAL.FeedbackResponseDAO;
import DAL.MainboardDAO;
import DAL.PCDAO;
import DAL.PSUDAO;
import DAL.ProductDAO;
import DAL.ProductImagesDAO;
import DAL.RAMDAO;
import DAL.StorageDAO;
import DAL.UserDAO;
import DAL.VGADAO;
import Model.CPU;
import Model.Case;
import Model.Feedback;
import Model.FeedbackResponse;
import Model.Mainboard;
import Model.PC;
import Model.PSU;
import Model.Product;
import Model.Product_Images;
import Model.RAM;
import Model.Storage;
import Model.User;
import Model.VGA;
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
        
        int productID = Integer.parseInt(request.getParameter("productID"));
        ProductDAO pDAO = new ProductDAO();
        CaseDAO caseDAO = new CaseDAO();
        PCDAO pcDAO = new PCDAO();
        CPUDAO cpuDAO = new CPUDAO();
        MainboardDAO mainDAO = new MainboardDAO();
        PSUDAO psuDAO = new PSUDAO();
        RAMDAO ramDAO = new RAMDAO();
        StorageDAO stoDAO = new StorageDAO();
        VGADAO vgaDAO = new VGADAO();
        ProductImagesDAO primgDAO = new ProductImagesDAO();
        FeedbackDAO fDAO = new FeedbackDAO();
        UserDAO uDAO = new UserDAO();
        FeedbackResponseDAO fbrspDAO = new FeedbackResponseDAO();
        
        PC pc = pcDAO.getPCByProductID(productID);

        Mainboard mainboard = mainDAO.getMainboardByID(pc.getMainboardID());
        CPU cpu = cpuDAO.getCPUByID(pc.getCpuID());
        RAM ram = ramDAO.getRAMByID(pc.getRamID());
        VGA vga = vgaDAO.getVGAByID(pc.getVgaID());
        Storage storage = stoDAO.getStorageByID(pc.getStorageID());
        PSU psu = psuDAO.getPSUByID(pc.getPsuID());
        Case casePC = caseDAO.getCaseByID(pc.getCaseID());

        request.setAttribute("mainboard", mainboard);
        request.setAttribute("cpu", cpu);
        request.setAttribute("ram", ram);
        request.setAttribute("vga", vga);
        request.setAttribute("storage", storage);
        request.setAttribute("psu", psu);
        request.setAttribute("casePC", casePC);

        Product p = pDAO.getProductByID(productID);
        request.setAttribute("product", p);

        int originalPrice = pDAO.getOriginalPriceByID(productID);
        request.setAttribute("originalPrice", originalPrice);

        int salePrice = pDAO.getSalePriceByID(productID, 10.0);
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

        Map<Integer, Integer> listSalePrice = pDAO.getSalePriceByID(listRelated, 10.0);
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
        
        Map<Integer, User> listUserResponse = uDAO.getUserByUserID();
        request.setAttribute("listUserResponse", listUserResponse);
        
        request.getRequestDispatcher("productDetail.jsp").forward(request, response);

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
